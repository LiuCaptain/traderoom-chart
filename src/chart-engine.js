/**
 * 图表引擎：假数据 → WASM 几何 → WebGL2
 *
 * REA：actionMove / actionScale / setPaletteColor / autoScale
 * 视觉：background / axis-line / candles / current-value-line / extremum / crosshair
 */

import { WebGL2Renderer } from "./webgl2-renderer.js";
import {
  CHART_TYPE,
  PALETTE,
  candleColors,
  hexToRgb,
  supportsLastCandleTimer,
} from "./theme.js";

function formatPrice(v) {
  return v.toFixed(5);
}
function formatTime(ts) {
  const d = new Date(ts * 1000);
  return `${String(d.getHours()).padStart(2, "0")}:${String(d.getMinutes()).padStart(2, "0")}:${String(d.getSeconds()).padStart(2, "0")}`;
}
function formatTimer(sec) {
  const s = Math.max(0, Math.ceil(sec));
  const m = Math.floor(s / 60);
  const r = s % 60;
  return m > 0 ? `${m}:${String(r).padStart(2, "0")}` : `0:${String(r).padStart(2, "0")}`;
}

function clamp(v, lo, hi) {
  return Math.max(lo, Math.min(hi, v));
}

function lerp(a, b, t) {
  return a + (b - a) * t;
}

function damp(current, target, lambda, dt) {
  return lerp(current, target, 1 - Math.exp(-lambda * dt));
}

function rubber(excess, dim) {
  const x = Math.abs(excess);
  const d = Math.max(24, dim);
  return Math.sign(excess) * d * (1 - 1 / (x / d + 1)) * 0.55;
}

export class ChartEngine {
  constructor(canvas, overlay, wasm, { onHover, onAwayFromHome, returnBtn } = {}) {
    this.canvas = canvas;
    this.overlay = overlay;
    this.octx = overlay.getContext("2d");
    this.wasm = wasm;
    this.onHover = onHover;
    this.onAwayFromHome = onAwayFromHome;
    this.returnBtn = returnBtn ?? null;
    this.gpu = new WebGL2Renderer(canvas);

    this.candles = [];
    this._syncKey = "";
    this.chartType = "candle";
    this.candleSize = 60;
    /** REA enableTradingVolume / setLastCandleTimer */
    this.showVolume = true;
    this.showLastTimer = true;
    this.visibleCount = 80;
    this.targetVisible = 80;
    /**
     * rightOffset 语义（REA setChartMinRightOffset / actionMove）：
     *  local(last) ≈ rightOffset + visibleCount - 1
     *  0 → 最新贴右；约 1-visibleCount/2 → 居中；更负 → 可拖出左屏
     */
    this.rightOffset = 1 - 80 * 0.5;
    this.interactOffset = this.rightOffset;
    this.pricePad = 0.1;
    this.hoverIndex = -1;
    this.pointer = null;
    this.dragging = false;
    this.dragStartX = 0;
    this.dragStartOffset = 0;
    this.loadingHistory = false;

    this.velocity = 0;
    this.samples = [];
    this.dragPull = 0;
    this.settling = false;
    this._settleTarget = null;
    this.focusAnim = null;
    /** 历史预加载节流，避免贴右界时每帧触发 get-candles */
    this._olderReqAt = 0;
    this._olderReqCooldownMs = 450;

    this.displayRange = null;
    this._range = { min: 0, max: 1 };
    this._window = { start: 0, end: 0 };
    this._shiftX = 0;
    this._lastTs = performance.now();

    this._boundResize = () => this.resize();
    this._bindPointer();
    window.addEventListener("resize", this._boundResize);
    this.resize();
  }

  destroy() {
    window.removeEventListener("resize", this._boundResize);
  }

  setCandles(candles) {
    this.candles = candles;
    const last = candles.at(-1);
    const key = `${candles.length}:${last?.from}:${last?.close}:${last?.high}:${last?.low}`;
    if (key !== this._syncKey) {
      this._syncKey = key;
      this.wasm.syncCandles(candles);
    }
  }

  setChartType(type) {
    this.chartType = type;
  }

  setCandleSize(size) {
    this.candleSize = size;
  }

  setShowVolume(on) {
    this.showVolume = !!on;
  }

  focusLast() {
    this.velocity = 0;
    this.focusAnim = {
      from: this.interactOffset,
      to: this._homeOffset(),
      t: 0,
      dur: 0.45,
    };
    this.settling = false;
  }

  onNeedOlder(fn) {
    this._requestOlder = fn;
  }

  /** 最新 K 线落在视窗水平中间（回弹目标） */
  _homeOffset() {
    return 1 - this.visibleCount * 0.5;
  }

  /** 允许把最新 K 线拖出左屏（约 0.6·visibleCount 槽宽到非可见区） */
  _minOffset() {
    return 1 - this.visibleCount * 1.6;
  }

  _maxOffset() {
    // 历史方向：保证还能看到至少一部分 K 线
    return Math.max(0, this.candles.length - Math.max(8, this.visibleCount * 0.25));
  }

  /** REA actionMove：槽单位；负值 = 最新 K 线左移 */
  actionMoveTo(absoluteOffset) {
    const min = this._minOffset();
    const max = this._maxOffset();
    this.interactOffset = absoluteOffset;

    // 逻辑偏移跟随（含负值）；仅在越界橡皮筋段夹紧，像素过冲用 rubberPx
    if (absoluteOffset < min) {
      this.dragPull = clamp((min - absoluteOffset) / 12, 0, 1);
      this.rightOffset = min;
    } else if (absoluteOffset > max) {
      this.dragPull = -clamp((absoluteOffset - max) / 12, 0, 1);
      this.rightOffset = max;
    } else {
      this.dragPull = 0;
      this.rightOffset = absoluteOffset;
    }

    this._maybeRequestOlder();
  }

  _maybeRequestOlder() {
    if (this.loadingHistory) return;
    const max = this._maxOffset();
    // 距历史右界约 8 根以内才预取；冷却避免惯性/回弹每帧连打
    if (this.rightOffset <= max - 8) return;
    const now = performance.now();
    if (now - this._olderReqAt < this._olderReqCooldownMs) return;
    this._olderReqAt = now;
    this._requestOlder?.();
  }

  /**
   * 前置更早 K 线后平移视窗状态。
   * rightOffset 语义跟「距最新的槽数」相关：数据左插必须同步加 count。
   * 但 home（居中）不随历史变长而变，settleTarget=home 时绝不能 +count，
   * 否则会朝「旧 max」猛冲，观感像快速跳动。
   */
  applyPrependedCandles(count) {
    if (!(count > 0)) return;
    const home = this._homeOffset();
    // 调用时 adapter 已 concat，_maxOffset() 已是新右界
    const newMax = this._maxOffset();

    this.rightOffset += count;
    this.interactOffset += count;
    this.dragStartOffset += count;

    if (this._settleTarget != null) {
      if (Math.abs(this._settleTarget - home) < 0.75) {
        this._settleTarget = home;
      } else if (this._settleTarget >= newMax - count - 2) {
        // 原本在贴旧右界回弹 → 跟到新右界，禁止朝旧值回拉
        this._settleTarget = newMax;
      } else {
        this._settleTarget += count;
      }
    }
    if (this.focusAnim) {
      this.focusAnim.from += count;
      if (Math.abs(this.focusAnim.to - home) < 0.75) this.focusAnim.to = home;
      else this.focusAnim.to += count;
    }
    for (const s of this.samples) s.offset += count;
  }

  actionScale(factor) {
    this.targetVisible = clamp(Math.round(this.targetVisible * factor), 20, 220);
  }

  resize() {
    const rect = this.canvas.getBoundingClientRect();
    this.width = rect.width;
    this.height = rect.height;
    this.gpu.resize();
    this.overlay.width = Math.floor(rect.width * this.gpu.dpr);
    this.overlay.height = Math.floor(rect.height * this.gpu.dpr);
    this.octx.setTransform(this.gpu.dpr, 0, 0, this.gpu.dpr, 0, 0);
  }

  _plotRect() {
    // 对齐 setTimeScaleBarXOffsetAndPadding：底轴留给 time scale bar
    // enableTradingVolume：底部再留成交量带
    const timeH = 36;
    const volH = this.showVolume ? Math.max(36, Math.floor(this.height * 0.14)) : 0;
    const top = 10;
    return {
      x: 8,
      y: top,
      w: this.width - 8 - 68,
      h: this.height - top - timeH - volH,
      volH,
      volY: this.height - timeH - volH,
      timeH,
    };
  }

  _isAwayFromHome() {
    return Math.abs(this.interactOffset - this._homeOffset()) > this.visibleCount * 0.12;
  }

  _yForPrice(price, plot) {
    const { min, max } = this._range;
    const t = (price - min) / (max - min || 1);
    return plot.y + plot.h * (1 - t);
  }

  /** 生成近似“整齐”的价格刻度 */
  _priceTicks(count = 6) {
    const min = this._range.min;
    const max = this._range.max;
    const span = max - min || 1e-5;
    const raw = span / count;
    const pow = 10 ** Math.floor(Math.log10(raw));
    const nice = [1, 2, 2.5, 5, 10].map((m) => m * pow);
    let step = nice[0];
    for (const n of nice) if (Math.abs(raw - n) < Math.abs(raw - step)) step = n;
    const start = Math.ceil(min / step) * step;
    const ticks = [];
    for (let v = start; v <= max + step * 0.01; v += step) ticks.push(v);
    return ticks;
  }

  _slotWidth() {
    return this._plotRect().w / this.visibleCount;
  }

  _bindPointer() {
    const el = this.overlay;
    el.style.pointerEvents = "auto";

    el.addEventListener("pointerdown", (e) => {
      this.dragging = true;
      this.velocity = 0;
      this.focusAnim = null;
      this.settling = false;
      this.dragStartX = e.clientX;
      this.dragStartOffset = this.interactOffset;
      this.samples = [{ t: performance.now(), x: e.clientX, offset: this.interactOffset }];
      el.classList.add("is-dragging");
      el.closest(".stage")?.classList.add("is-dragging");
      el.setPointerCapture(e.pointerId);
    });

    el.addEventListener("pointermove", (e) => {
      const rect = el.getBoundingClientRect();
      this.pointer = { x: e.clientX - rect.left, y: e.clientY - rect.top };

      if (this.dragging) {
        const dx = e.clientX - this.dragStartX;
        // 内容跟手：左滑 dx<0 → rightOffset 更负 → 最新 K 线左移（可出左屏）
        const raw = this.dragStartOffset + dx / this._slotWidth();
        const min = this._minOffset();
        const max = this._maxOffset();
        let next = raw;
        if (raw < min) next = min - rubber(min - raw, this.visibleCount * 0.55);
        else if (raw > max) next = max + rubber(raw - max, this.visibleCount * 0.35);
        this.actionMoveTo(next);

        const now = performance.now();
        this.samples.push({ t: now, x: e.clientX, offset: this.interactOffset });
        while (this.samples.length > 6) this.samples.shift();
      }

      this._updateHover();
    });

    el.addEventListener("pointerup", () => this._endDrag());
    el.addEventListener("pointercancel", () => this._endDrag());

    el.addEventListener("pointerleave", () => {
      if (!this.dragging) {
        this.pointer = null;
        this.hoverIndex = -1;
        this.onHover?.(null);
      }
    });

    el.addEventListener(
      "wheel",
      (e) => {
        e.preventDefault();
        this.actionScale(e.deltaY > 0 ? 1.1 : 0.9);
      },
      { passive: false },
    );
  }

  _endDrag() {
    if (!this.dragging) return;
    this.dragging = false;
    this.overlay.classList.remove("is-dragging");
    this.overlay.closest(".stage")?.classList.remove("is-dragging");

    const s = this.samples;
    if (s.length >= 2) {
      const a = s[Math.max(0, s.length - 3)];
      const b = s[s.length - 1];
      const dt = Math.max(0.008, (b.t - a.t) / 1000);
      this.velocity = clamp((b.offset - a.offset) / dt, -140, 140);
    }

    const home = this._homeOffset();
    const min = this._minOffset();
    const max = this._maxOffset();

    // 最新侧（含拖出左屏）：松手回弹到中间；历史侧越界才回弹
    if (this.interactOffset < home - 0.5 || this.interactOffset < min || this.interactOffset > max) {
      this.settling = true;
      this._settleTarget =
        this.interactOffset > max ? max : home; // 左拖/出屏 → 中间
      this.velocity *= 0.15;
    } else {
      this._settleTarget = null;
    }
  }

  /**
   * 价格轴滞后：displayRange 用指数阻尼追 target。
   * 拖动时更慢 → 蜡烛高度持续被拉伸/压缩；槽宽不变。
   */
  _tickPriceScale(dt, target) {
    if (!target || !(target.max > target.min)) return;

    if (!this.displayRange) {
      this.displayRange = { min: target.min, max: target.max };
      return;
    }

    const span = Math.max(target.max - target.min, 1e-9);
    const jump =
      Math.abs(target.min - this.displayRange.min) > span * 3 ||
      Math.abs(target.max - this.displayRange.max) > span * 3;
    if (jump) {
      this.displayRange = { min: target.min, max: target.max };
      return;
    }

    // 拖动/惯性中明显滞后；静止后较快收敛
    const moving = this.dragging || Math.abs(this.velocity) > 1 || this.settling;
    const lambda = moving ? 1.8 : 7.5;
    this.displayRange.min = damp(this.displayRange.min, target.min, lambda, dt);
    this.displayRange.max = damp(this.displayRange.max, target.max, lambda, dt);

    if (this.displayRange.max <= this.displayRange.min) {
      this.displayRange = { min: target.min, max: target.max };
    }
  }

  _tickInertia(dt) {
    if (this.dragging || this.focusAnim) return;
    const home = this._homeOffset();
    const min = this._minOffset();
    const max = this._maxOffset();

    if (this.settling) {
      // 历史追加后 max 变大：若目标是「贴右界」，跟随最新 max，杜绝朝旧 max 猛冲
      let target = this._settleTarget;
      if (target == null) {
        target = this.interactOffset > max ? max : home;
      } else if (target > home && target >= max - 2) {
        target = max;
        this._settleTarget = max;
      }
      this.interactOffset = damp(this.interactOffset, target, 11, dt);
      this.velocity = damp(this.velocity, 0, 16, dt);
      this.actionMoveTo(this.interactOffset);
      if (Math.abs(this.interactOffset - target) < 0.04 && Math.abs(this.velocity) < 0.35) {
        this.interactOffset = target;
        this.actionMoveTo(target);
        this.velocity = 0;
        this.settling = false;
        this._settleTarget = null;
        this.dragPull = 0;
      }
      return;
    }

    if (Math.abs(this.velocity) > 0.35) {
      this.interactOffset += this.velocity * dt;
      this.velocity *= Math.exp(-4.5 * dt);

      // 惯性撞历史右界：就地夹紧并衰减，而不是先冲过再 settle 甩回（观感像「快速跳动」）
      if (this.interactOffset > max) {
        this.interactOffset = max;
        this.velocity *= 0.2;
        this.actionMoveTo(this.interactOffset);
        if (Math.abs(this.velocity) < 2) {
          this.velocity = 0;
          this.settling = true;
          this._settleTarget = max;
        }
      } else if (this.interactOffset < min) {
        this.settling = true;
        this._settleTarget = home;
        this.velocity *= 0.15;
        this.actionMoveTo(this.interactOffset);
      } else if (this.interactOffset < home - this.visibleCount * 0.15) {
        // 最新侧甩过中间过多 → 回弹中间
        this.settling = true;
        this._settleTarget = home;
        this.actionMoveTo(this.interactOffset);
      } else {
        this.actionMoveTo(this.interactOffset);
      }
    } else {
      this.velocity = 0;
      this.dragPull = 0;
      this.interactOffset = this.rightOffset;
    }
  }

  _updateHover() {
    if (!this.pointer || !this.candles.length || this.dragging) {
      if (this.dragging) {
        this.hoverIndex = -1;
        const mid =
          this._window.start + Math.floor((this._window.end - this._window.start) * 0.5);
        this.onHover?.(this.candles[mid] ?? this.candles.at(-1));
      } else if (!this.pointer) {
        this.hoverIndex = -1;
        this.onHover?.(null);
      }
      return;
    }
    const plot = this._plotRect();
    const { start, end } = this._window;
    const idx = this.wasm.hitTest(
      this.pointer.x - this._shiftX,
      plot.x,
      this._slotWidth(),
      start,
      end - start,
    );
    this.hoverIndex = idx;
    this.onHover?.(idx >= 0 ? this.candles[idx] : null);
  }

  draw() {
    const now = performance.now();
    const dt = clamp((now - this._lastTs) / 1000, 0, 0.05);
    this._lastTs = now;

    // 缩放平滑；接近目标时吸附，避免 slot 每帧微抖
    this.visibleCount = damp(this.visibleCount, this.targetVisible, 12, dt);
    if (Math.abs(this.visibleCount - this.targetVisible) < 0.05) {
      this.visibleCount = this.targetVisible;
    }

    // 缩放时保持「最新相对位置」：按 visibleCount 比例重映射 home 附近偏移
    const maxOff = this._maxOffset();
    const minOff = this._minOffset();
    if (!this.dragging && !this.settling) {
      if (this.interactOffset > maxOff) {
        this.interactOffset = maxOff;
        this.rightOffset = maxOff;
      } else if (this.interactOffset < minOff) {
        this.interactOffset = minOff;
        this.rightOffset = minOff;
      }
    }

    if (this.focusAnim) {
      this.focusAnim.t += dt;
      const p = clamp(this.focusAnim.t / this.focusAnim.dur, 0, 1);
      this.interactOffset = lerp(this.focusAnim.from, this.focusAnim.to, 1 - (1 - p) ** 3);
      this.actionMoveTo(this.interactOffset);
      this.velocity = 0;
      if (p >= 1) this.focusAnim = null;
    } else {
      this._tickInertia(dt);
    }

    if (!this.candles.length) {
      this.gpu.clear();
      this.octx.clearRect(0, 0, this.width, this.height);
      return;
    }

    const plot = this._plotRect();
    const slot = plot.w / this.visibleCount;
    const chartType = CHART_TYPE[this.chartType] ?? CHART_TYPE.candle;
    const colors = candleColors(this.chartType);
    const lineRgb = hexToRgb(PALETTE["chart-line"]);

    // 视窗：允许 startF 越过数据右端，从而把最新 K 线拖到左侧/屏外
    const endF = this.candles.length - this.rightOffset;
    const startF = endF - this.visibleCount;
    const lastIdx = Math.max(0, this.candles.length - 1);
    const start = clamp(Math.floor(startF), 0, lastIdx);
    const end = clamp(
      Math.max(start + 1, Math.ceil(startF + this.visibleCount) + 1),
      start + 1,
      this.candles.length,
    );
    this._shiftX = (start - startF) * slot;
    this._window = { start, end };

    // 越界橡皮筋：仅像素层（逻辑 rightOffset 已夹在 min/max）
    const rubberPx = (this.interactOffset - this.rightOffset) * slot;

    const targetRange = this.wasm.computeVisibleRange({
      chartType,
      start,
      end,
      pricePad: this.pricePad,
    });
    this._tickPriceScale(dt, targetRange);

    const geo = this.wasm.buildGeometry({
      chartType,
      start,
      end,
      plotX: plot.x,
      plotY: plot.y,
      plotW: plot.w,
      plotH: plot.h,
      visibleCount: this.visibleCount,
      pricePad: this.pricePad,
      useFixedRange: true,
      fixedMin: this.displayRange.min,
      fixedMax: this.displayRange.max,
      grow: colors.grow,
      fall: colors.fall,
      line: lineRgb,
    });

    this._range = { min: this.displayRange.min, max: this.displayRange.max };

    const bg = hexToRgb(PALETTE["background-top"]);
    this.gpu.clear(bg.r, bg.g, bg.b);
    this.gpu.setScissor(plot);
    this.gpu.setOffsetX(this._shiftX + rubberPx);
    this.gpu.upload(geo.triangles, geo.lines, geo.triCount, geo.lineCount);
    this.gpu.draw();
    this._drawOverlay(plot, start, end);

    const away = this._isAwayFromHome();
    if (this.returnBtn) {
      this.returnBtn.hidden = !away;
      this.returnBtn.setAttribute("aria-hidden", away ? "false" : "true");
    }
    this.onAwayFromHome?.(away);
  }

  _drawOverlay(plot, start, end) {
    const ctx = this.octx;
    const P = PALETTE;
    ctx.clearRect(0, 0, this.width, this.height);

    // 成交量带 + time scale bar
    const bandTop = plot.y + plot.h;
    ctx.fillStyle = P["background-bottom"];
    ctx.fillRect(0, bandTop, this.width, this.height - bandTop);
    if (plot.volH > 0) {
      this._drawVolume(ctx, plot, start, end);
      ctx.strokeStyle = P["line-on-time-scale-bar"];
      ctx.globalAlpha = 0.7;
      ctx.beginPath();
      ctx.moveTo(plot.x, plot.volY + 0.5);
      ctx.lineTo(plot.x + plot.w, plot.volY + 0.5);
      ctx.stroke();
      ctx.globalAlpha = 1;
    }
    ctx.strokeStyle = P["line-on-time-scale-bar"];
    ctx.beginPath();
    ctx.moveTo(0, this.height - plot.timeH + 0.5);
    ctx.lineTo(this.width, this.height - plot.timeH + 0.5);
    ctx.stroke();

    const priceTicks = this._priceTicks(6);
    const series = this.candles.slice(start, end);
    const slot = this._slotWidth();
    const timeStep = Math.max(1, Math.floor(series.length / 6));

    // 网格：axis-line —— 横线对齐价格刻度，竖线对齐时间刻度
    ctx.strokeStyle = P["axis-line"];
    ctx.lineWidth = 1;
    for (const price of priceTicks) {
      const y = this._yForPrice(price, plot);
      if (y < plot.y || y > plot.y + plot.h) continue;
      ctx.globalAlpha = 0.85;
      ctx.beginPath();
      ctx.moveTo(plot.x, y + 0.5);
      ctx.lineTo(plot.x + plot.w, y + 0.5);
      ctx.stroke();
    }
    for (let i = 0; i < series.length; i += timeStep) {
      const x = plot.x + i * slot + slot / 2 + this._shiftX;
      if (x < plot.x || x > plot.x + plot.w) continue;
      ctx.globalAlpha = 0.55;
      ctx.beginPath();
      ctx.moveTo(x + 0.5, plot.y);
      ctx.lineTo(x + 0.5, plot.y + plot.h);
      ctx.stroke();
    }
    ctx.globalAlpha = 1;

    // 左右 edge fade
    const fade = ctx.createLinearGradient(plot.x, 0, plot.x + 28, 0);
    fade.addColorStop(0, P["chart-edge-fade"]);
    fade.addColorStop(1, "#00000000");
    ctx.fillStyle = fade;
    ctx.fillRect(plot.x, plot.y, 28, plot.h);
    const fadeR = ctx.createLinearGradient(plot.x + plot.w - 28, 0, plot.x + plot.w, 0);
    fadeR.addColorStop(0, "#00000000");
    fadeR.addColorStop(1, P["chart-edge-fade"]);
    ctx.fillStyle = fadeR;
    ctx.fillRect(plot.x + plot.w - 28, plot.y, 28, plot.h);

    // 价格轴标签
    ctx.fillStyle = P["axis-label"];
    ctx.font = "11px system-ui, -apple-system, sans-serif";
    ctx.textAlign = "left";
    ctx.textBaseline = "middle";
    for (const price of priceTicks) {
      const y = this._yForPrice(price, plot);
      if (y < plot.y - 2 || y > plot.y + plot.h + 2) continue;
      ctx.fillText(formatPrice(price), plot.x + plot.w + 8, y);
    }

    // 时间轴标签（贴底 time scale bar）
    const timeY = this.height - plot.timeH;
    ctx.save();
    ctx.beginPath();
    ctx.rect(plot.x, timeY, plot.w, plot.timeH);
    ctx.clip();
    ctx.textAlign = "center";
    ctx.textBaseline = "top";
    ctx.fillStyle = P["axis-label"];
    for (let i = 0; i < series.length; i += timeStep) {
      const x = plot.x + i * slot + slot / 2 + this._shiftX;
      ctx.fillText(formatTime(series[i].from), x, timeY + 10);
    }
    ctx.restore();

    // High / Low（tabSetHighLowVisible）
    if (series.length) {
      let hiI = 0;
      let loI = 0;
      for (let i = 1; i < series.length; i++) {
        if (series[i].high > series[hiI].high) hiI = i;
        if (series[i].low < series[loI].low) loI = i;
      }
      this._drawExtremum(ctx, plot, slot, hiI, series[hiI], "H");
      this._drawExtremum(ctx, plot, slot, loI, series[loI], "L");
    }

    const last = this.candles.at(-1);
    if (last) {
      const y = this._yForPrice(last.close, plot);
      const lastLocal = this.candles.length - 1 - start;
      const lastX = plot.x + lastLocal * slot + slot / 2 + this._shiftX;
      const up = last.close >= last.open;
      if (y >= plot.y && y <= plot.y + plot.h) {
        ctx.strokeStyle = P["chart-current-value-line"];
        ctx.globalAlpha = 0.75;
        ctx.setLineDash([5, 4]);
        ctx.beginPath();
        ctx.moveTo(plot.x, y + 0.5);
        ctx.lineTo(plot.x + plot.w, y + 0.5);
        ctx.stroke();
        ctx.setLineDash([]);
        ctx.globalAlpha = 1;

        const label = formatPrice(last.close);
        ctx.font = "11px system-ui, -apple-system, sans-serif";
        const tw = ctx.measureText(label).width + 12;
        const bx = plot.x + plot.w + 4;
        const by = y - 10;
        ctx.fillStyle = up
          ? P["chart-current-value-precision-positive"]
          : P["chart-current-value-precision-negative"];
        if (typeof ctx.roundRect === "function") {
          ctx.beginPath();
          ctx.roundRect(bx, by, tw, 20, 3);
          ctx.fill();
        } else {
          ctx.fillRect(bx, by, tw, 20);
        }
        ctx.fillStyle = "#ffffff";
        ctx.textAlign = "left";
        ctx.textBaseline = "middle";
        ctx.fillText(label, bx + 6, y);

        if (lastX >= plot.x - 8 && lastX <= plot.x + plot.w + 8) {
          ctx.fillStyle = P["chart-last-value-point-glow"];
          ctx.beginPath();
          ctx.arc(lastX, y, 7, 0, Math.PI * 2);
          ctx.fill();
          ctx.fillStyle = P["chart-last-value-point"];
          ctx.beginPath();
          ctx.arc(lastX, y, 3.5, 0, Math.PI * 2);
          ctx.fill();
        }

        if (
          this.showLastTimer &&
          supportsLastCandleTimer(this.chartType) &&
          lastX >= plot.x - 20 &&
          lastX <= plot.x + plot.w + 40
        ) {
          this._drawLastCandleTimer(ctx, lastX, y, last);
        }
      }
    }

    if (!this.dragging && this.pointer && this.hoverIndex >= 0) {
      const local = this.hoverIndex - start;
      if (local >= 0 && local < series.length) {
        const c = series[local];
        const x = plot.x + local * slot + slot / 2 + this._shiftX;
        const y = this.pointer.y;
        ctx.strokeStyle = P["chart-crosshair-line"];
        ctx.setLineDash([3, 3]);
        ctx.beginPath();
        ctx.moveTo(x, plot.y);
        ctx.lineTo(x, plot.y + plot.h);
        ctx.moveTo(plot.x, y);
        ctx.lineTo(plot.x + plot.w, y);
        ctx.stroke();
        ctx.setLineDash([]);

        const py = clamp(y, plot.y, plot.y + plot.h);
        const priceAt =
          this._range.max -
          ((py - plot.y) / plot.h) * (this._range.max - this._range.min);
        const pl = formatPrice(priceAt);
        ctx.font = "11px system-ui, -apple-system, sans-serif";
        const pw = ctx.measureText(pl).width + 10;
        ctx.fillStyle = P["chart-crosshair-label-body"];
        ctx.fillRect(plot.x + plot.w + 4, py - 10, pw, 20);
        ctx.fillStyle = P["chart-crosshair-label-text"];
        ctx.textAlign = "left";
        ctx.textBaseline = "middle";
        ctx.fillText(pl, plot.x + plot.w + 9, py);

        const tl = formatTime(c.from);
        const tw = ctx.measureText(tl).width + 10;
        ctx.fillStyle = P["chart-current-time-body"];
        ctx.fillRect(x - tw / 2, timeY + 4, tw, 18);
        ctx.fillStyle = P["chart-current-time-text"];
        ctx.textAlign = "center";
        ctx.fillText(tl, x, timeY + 13);
      }
    }
  }

  _drawVolume(ctx, plot, start, end) {
    if (!(plot.volH > 0)) return;
    const series = this.candles.slice(start, end);
    if (!series.length) return;
    const slot = this._slotWidth();
    let maxVol = 1;
    for (const c of series) maxVol = Math.max(maxVol, c.volume || 0);
    const pad = 4;
    const base = plot.volY + plot.volH - pad;
    const hMax = plot.volH - pad * 2;
    const bodyW = Math.max(2, slot * 0.54);
    ctx.save();
    ctx.beginPath();
    ctx.rect(plot.x, plot.volY, plot.w, plot.volH);
    ctx.clip();
    for (let i = 0; i < series.length; i++) {
      const c = series[i];
      const x = plot.x + i * slot + slot / 2 + this._shiftX;
      if (x < plot.x - bodyW || x > plot.x + plot.w + bodyW) continue;
      const h = ((c.volume || 0) / maxVol) * hMax;
      const up = c.close >= c.open;
      ctx.fillStyle = up ? PALETTE["chart-volume-grow"] : PALETTE["chart-volume-fall"];
      const bx = x - bodyW / 2;
      const by = base - h;
      if (typeof ctx.roundRect === "function") {
        ctx.beginPath();
        ctx.roundRect(bx, by, bodyW, Math.max(1, h), 2);
        ctx.fill();
      } else {
        ctx.fillRect(bx, by, bodyW, Math.max(1, h));
      }
    }
    ctx.restore();
  }

  _drawLastCandleTimer(ctx, lastX, priceY, last) {
    const remain = last.from + this.candleSize - Date.now() / 1000;
    const label = formatTimer(remain);
    ctx.font = "10px system-ui, -apple-system, sans-serif";
    const tw = ctx.measureText(label).width + 10;
    const bx = lastX + 10;
    const by = priceY - 28;
    ctx.fillStyle = PALETTE["last-candle-timer-body"];
    if (typeof ctx.roundRect === "function") {
      ctx.beginPath();
      ctx.roundRect(bx, by, tw, 18, 3);
      ctx.fill();
    } else {
      ctx.fillRect(bx, by, tw, 18);
    }
    ctx.fillStyle = PALETTE["last-candle-timer-text"];
    ctx.textAlign = "left";
    ctx.textBaseline = "middle";
    ctx.fillText(label, bx + 5, by + 9);
  }

  _drawExtremum(ctx, plot, slot, local, candle, tag) {
    if (local < 0) return;
    const x = plot.x + local * slot + slot / 2 + this._shiftX;
    const price = tag === "H" ? candle.high : candle.low;
    const y = this._yForPrice(price, plot);
    if (x < plot.x || x > plot.x + plot.w) return;
    const label = `${tag} ${formatPrice(price)}`;
    ctx.font = "10px system-ui, -apple-system, sans-serif";
    const tw = ctx.measureText(label).width + 8;
    const bx = clamp(x - tw / 2, plot.x, plot.x + plot.w - tw);
    const by = tag === "H" ? y - 18 : y + 6;
    ctx.fillStyle = PALETTE["chart-extremum-body"];
    ctx.strokeStyle = PALETTE["axis-line"];
    ctx.fillRect(bx, by, tw, 16);
    ctx.strokeRect(bx + 0.5, by + 0.5, tw - 1, 15);
    ctx.fillStyle = PALETTE["chart-extremum-text"];
    ctx.textAlign = "center";
    ctx.textBaseline = "middle";
    ctx.fillText(label, bx + tw / 2, by + 8);
  }
}

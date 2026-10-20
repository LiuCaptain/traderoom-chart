/**
 * 数据适配层：镜像 REA 逆向到的消息名与职责
 * - quotes-history.get-first-candles@1.0
 * - quotes-history.get-candles@2.0
 * - quotes.candle-generated@1.0
 *
 * 此处用假数据 + EventTarget 事件，不连真实 /echo/websocket。
 */

import {
  createFakeCandles,
  rollNewCandle,
  tickLiveCandle,
} from "./fake-quotes.js";

export class QuotesHistoryAdapter extends EventTarget {
  constructor({ candleSize = 60, initialCount = 240 } = {}) {
    super();
    this.candleSize = candleSize;
    this.candles = [];
    this.live = true;
    this._raf = 0;
    this._initialCount = initialCount;
  }

  /** quotes-history.get-first-candles@1.0 */
  async getFirstCandles({ size = this.candleSize, count = this._initialCount } = {}) {
    this.candleSize = size;
    this.candles = createFakeCandles({ count, size, seed: 1000 + size });
    this.dispatchEvent(
      new CustomEvent("history", {
        detail: { name: "quotes-history.get-first-candles@1.0", candles: this.candles },
      }),
    );
    return this.candles;
  }

  /** quotes-history.get-candles@2.0 — 向更早时间追加 */
  async getCandles({ count = 80 } = {}) {
    if (!this.candles.length) return this.getFirstCandles({ count });
    const first = this.candles[0];
    const older = createFakeCandles({
      count,
      size: this.candleSize,
      endTs: first.from,
      startPrice: first.open * 0.998,
      seed: first.from,
    });
    // 去掉与现有重叠的最后一根
    older.pop();
    this.candles = older.concat(this.candles);
    this.dispatchEvent(
      new CustomEvent("history", {
        detail: { name: "quotes-history.get-candles@2.0", candles: this.candles, prepended: older.length },
      }),
    );
    return older;
  }

  setCandleSize(size) {
    this.candleSize = size;
    return this.getFirstCandles({ size });
  }

  setLive(enabled) {
    this.live = enabled;
    if (enabled) this.startRealtime();
    else this.stopRealtime();
  }

  startRealtime() {
    this.stopRealtime();
    const loop = () => {
      if (!this.live || !this.candles.length) return;
      const now = Date.now() / 1000;
      let last = this.candles[this.candles.length - 1];
      if (now >= last.from + this.candleSize) {
        last = rollNewCandle(last, this.candleSize);
        this.candles.push(last);
      } else {
        last = tickLiveCandle(last, this.candleSize, now);
        this.candles[this.candles.length - 1] = last;
      }
      this.dispatchEvent(
        new CustomEvent("candle", {
          detail: { name: "quotes.candle-generated@1.0", candle: last },
        }),
      );
      this._raf = requestAnimationFrame(loop);
    };
    this._raf = requestAnimationFrame(loop);
  }

  stopRealtime() {
    if (this._raf) cancelAnimationFrame(this._raf);
    this._raf = 0;
  }
}

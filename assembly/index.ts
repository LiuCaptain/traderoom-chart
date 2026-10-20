/**
 * 自研 chart_core.wasm —— 对齐 REA 逆向的「计算在 WASM、绘制在 GPU」链路
 * 职责：OHLC 变换 / 视窗裁剪 / 价格量程 / 顶点缓冲生成
 * 自研几何核心，不依赖第三方闭源图表 WASM
 */

const STRIDE: i32 = 6; // from, open, high, low, close, volume
/** 三角形：x,y,r,g,b, localX, localY, halfW, halfH（halfW<=0 = 实心无圆角） */
const TRI_STRIDE: i32 = 9;
/** 线段：x, y, r, g, b */
const LINE_STRIDE: i32 = 5;

let candleCap: i32 = 0;
let candleCount: i32 = 0;
let candleData: Float64Array = new Float64Array(0);

let workCap: i32 = 0;
let workData: Float64Array = new Float64Array(0);

let triCap: i32 = 0;
let triCount: i32 = 0;
let triVerts: Float32Array = new Float32Array(0);

let lineCap: i32 = 0;
let lineCount: i32 = 0;
let lineVerts: Float32Array = new Float32Array(0);

let priceMin: f64 = 0;
let priceMax: f64 = 1;

export function getPriceMin(): f64 {
  return priceMin;
}
export function getPriceMax(): f64 {
  return priceMax;
}
export function getTriVertexCount(): i32 {
  return triCount;
}
export function getLineVertexCount(): i32 {
  return lineCount;
}
export function getCandleCount(): i32 {
  return candleCount;
}

export function candleDataPtr(): usize {
  return changetype<usize>(candleData.buffer) + candleData.byteOffset;
}
export function triVertsPtr(): usize {
  return changetype<usize>(triVerts.buffer) + triVerts.byteOffset;
}
export function lineVertsPtr(): usize {
  return changetype<usize>(lineVerts.buffer) + lineVerts.byteOffset;
}

function ensureCandles(n: i32): void {
  if (n <= candleCap) return;
  let cap = candleCap == 0 ? 256 : candleCap;
  while (cap < n) cap <<= 1;
  const next = new Float64Array(cap * STRIDE);
  for (let i = 0; i < candleCount * STRIDE; i++) next[i] = candleData[i];
  candleData = next;
  candleCap = cap;
}

function ensureWork(n: i32): void {
  if (n <= workCap) return;
  let cap = workCap == 0 ? 256 : workCap;
  while (cap < n) cap <<= 1;
  workData = new Float64Array(cap * STRIDE);
  workCap = cap;
}

function ensureTris(nVerts: i32): void {
  if (nVerts <= triCap) return;
  let cap = triCap == 0 ? 1024 : triCap;
  while (cap < nVerts) cap <<= 1;
  triVerts = new Float32Array(cap * TRI_STRIDE);
  triCap = cap;
}

function ensureLines(nVerts: i32): void {
  if (nVerts <= lineCap) return;
  let cap = lineCap == 0 ? 1024 : lineCap;
  while (cap < nVerts) cap <<= 1;
  lineVerts = new Float32Array(cap * LINE_STRIDE);
  lineCap = cap;
}

/** JS 写入前先分配，再通过 memory 填充；也可直接 setCandle */
export function reserveCandles(n: i32): usize {
  ensureCandles(n);
  candleCount = n;
  return candleDataPtr();
}

export function setCandle(
  i: i32,
  from: f64,
  open: f64,
  high: f64,
  low: f64,
  close: f64,
  volume: f64,
): void {
  ensureCandles(i + 1);
  if (i + 1 > candleCount) candleCount = i + 1;
  const o = i * STRIDE;
  candleData[o] = from;
  candleData[o + 1] = open;
  candleData[o + 2] = high;
  candleData[o + 3] = low;
  candleData[o + 4] = close;
  candleData[o + 5] = volume;
}

export function setCandleCount(n: i32): void {
  ensureCandles(n);
  candleCount = n;
}

@inline
function yFor(price: f64, plotY: f32, plotH: f32, pMin: f64, pMax: f64): f32 {
  const t = (price - pMin) / (pMax - pMin == 0 ? 1 : pMax - pMin);
  return plotY + plotH * f32(1.0 - t);
}

function pushTri(
  x: f32,
  y: f32,
  r: f32,
  g: f32,
  b: f32,
  lx: f32,
  ly: f32,
  hx: f32,
  hy: f32,
): void {
  ensureTris(triCount + 1);
  const o = triCount * TRI_STRIDE;
  triVerts[o] = x;
  triVerts[o + 1] = y;
  triVerts[o + 2] = r;
  triVerts[o + 3] = g;
  triVerts[o + 4] = b;
  triVerts[o + 5] = lx;
  triVerts[o + 6] = ly;
  triVerts[o + 7] = hx;
  triVerts[o + 8] = hy;
  triCount++;
}

function pushLine(
  x: f32,
  y: f32,
  r: f32,
  g: f32,
  b: f32,
): void {
  ensureLines(lineCount + 1);
  const o = lineCount * LINE_STRIDE;
  lineVerts[o] = x;
  lineVerts[o + 1] = y;
  lineVerts[o + 2] = r;
  lineVerts[o + 3] = g;
  lineVerts[o + 4] = b;
  lineCount++;
}

/** 实心四边形（线性面积等，无圆角 SDF） */
function pushQuad(
  x0: f32,
  y0: f32,
  x1: f32,
  y1: f32,
  r: f32,
  g: f32,
  b: f32,
): void {
  pushTri(x0, y0, r, g, b, 0, 0, -1, -1);
  pushTri(x1, y0, r, g, b, 0, 0, -1, -1);
  pushTri(x0, y1, r, g, b, 0, 0, -1, -1);
  pushTri(x1, y0, r, g, b, 0, 0, -1, -1);
  pushTri(x1, y1, r, g, b, 0, 0, -1, -1);
  pushTri(x0, y1, r, g, b, 0, 0, -1, -1);
}

/**
 * 圆角蜡烛体：顶点带 local/halfSize，GPU 侧 SDF 裁圆角
 * 对标 IQ Option 截图像素：圆角约 2.5css px，体宽约 slot·0.54
 */
function pushRoundedQuad(
  x0: f32,
  y0: f32,
  x1: f32,
  y1: f32,
  r: f32,
  g: f32,
  b: f32,
): void {
  const cx = (x0 + x1) * 0.5;
  const cy = (y0 + y1) * 0.5;
  const hx = (x1 - x0) * 0.5;
  const hy = (y1 - y0) * 0.5;
  // 六个角点：screen + local
  pushTri(x0, y0, r, g, b, x0 - cx, y0 - cy, hx, hy);
  pushTri(x1, y0, r, g, b, x1 - cx, y0 - cy, hx, hy);
  pushTri(x0, y1, r, g, b, x0 - cx, y1 - cy, hx, hy);
  pushTri(x1, y0, r, g, b, x1 - cx, y0 - cy, hx, hy);
  pushTri(x1, y1, r, g, b, x1 - cx, y1 - cy, hx, hy);
  pushTri(x0, y1, r, g, b, x0 - cx, y1 - cy, hx, hy);
}

function copyRawToWork(start: i32, end: i32): i32 {
  const n = end - start;
  ensureWork(n);
  for (let i = 0; i < n; i++) {
    const s = (start + i) * STRIDE;
    const d = i * STRIDE;
    workData[d] = candleData[s];
    workData[d + 1] = candleData[s + 1];
    workData[d + 2] = candleData[s + 2];
    workData[d + 3] = candleData[s + 3];
    workData[d + 4] = candleData[s + 4];
    workData[d + 5] = candleData[s + 5];
  }
  return n;
}

function toHeikenAshi(n: i32): void {
  if (n <= 0) return;
  let prevOpen = (workData[1] + workData[4]) * 0.5;
  let prevClose = (workData[1] + workData[2] + workData[3] + workData[4]) * 0.25;
  for (let i = 0; i < n; i++) {
    const o = i * STRIDE;
    const open = workData[o + 1];
    const high = workData[o + 2];
    const low = workData[o + 3];
    const close = workData[o + 4];
    const haClose = (open + high + low + close) * 0.25;
    const haOpen = i == 0 ? (open + close) * 0.5 : (prevOpen + prevClose) * 0.5;
    const haHigh = Math.max(high, Math.max(haOpen, haClose));
    const haLow = Math.min(low, Math.min(haOpen, haClose));
    workData[o + 1] = haOpen;
    workData[o + 2] = haHigh;
    workData[o + 3] = haLow;
    workData[o + 4] = haClose;
    prevOpen = haOpen;
    prevClose = haClose;
  }
}

function computeRange(n: i32, pad: f64): void {
  if (n <= 0) {
    priceMin = 0;
    priceMax = 1;
    return;
  }
  let mn = Infinity;
  let mx = -Infinity;
  for (let i = 0; i < n; i++) {
    const o = i * STRIDE;
    const h = workData[o + 2];
    const l = workData[o + 3];
    if (l < mn) mn = l;
    if (h > mx) mx = h;
  }
  const span = mx - mn;
  const p = span == 0 ? 0.0005 : span * pad;
  priceMin = mn - p;
  priceMax = mx + p;
}

/**
 * 计算可见区自动价格量程（写入 priceMin/priceMax），供 JS 侧 actionMove 弹簧追赶。
 * chartType REA：0=Zone 1=Candle 2=Linear 3=Bar 4=HeikenAshi
 */
export function computeVisibleRange(
  chartType: i32,
  start: i32,
  end: i32,
  pricePad: f64,
): void {
  if (end > candleCount) end = candleCount;
  if (start < 0) start = 0;
  if (end <= start) {
    priceMin = 0;
    priceMax = 1;
    return;
  }
  const n = copyRawToWork(start, end);
  if (chartType == 4) toHeikenAshi(n);
  computeRange(n, pricePad);
}

/**
 * chartType REA：0=Zone 1=Candle 2=Linear 3=Bar 4=HeikenAshi
 * 颜色来自 setPaletteColor 语义（JS 传入 grow/fall/line RGB）
 */
export function buildGeometry(
  chartType: i32,
  start: i32,
  end: i32,
  plotX: f32,
  plotY: f32,
  plotW: f32,
  plotH: f32,
  visibleCount: f32,
  pricePad: f64,
  useFixedRange: i32,
  fixedMin: f64,
  fixedMax: f64,
  upR: f32,
  upG: f32,
  upB: f32,
  dnR: f32,
  dnG: f32,
  dnB: f32,
  lnR: f32,
  lnG: f32,
  lnB: f32,
): i32 {
  triCount = 0;
  lineCount = 0;
  if (end > candleCount) end = candleCount;
  if (start < 0) start = 0;
  if (end <= start || visibleCount <= 0 || plotW <= 0 || plotH <= 0) return 0;

  const n = copyRawToWork(start, end);
  if (chartType == 4) toHeikenAshi(n);

  if (useFixedRange != 0 && fixedMax > fixedMin) {
    priceMin = fixedMin;
    priceMax = fixedMax;
  } else {
    computeRange(n, pricePad);
  }

  const slot = plotW / visibleCount;

  if (chartType == 2) {
    // Linear：折线 + 顶亮底暗面积（近似 chart-line-gradient-top/bottom）
    const base = plotY + plotH;
    const botR = lnR * 0.12;
    const botG = lnG * 0.12;
    const botB = lnB * 0.12;
    const topR = lnR * 0.42;
    const topG = lnG * 0.42;
    const topB = lnB * 0.42;
    for (let i = 0; i < n; i++) {
      const o = i * STRIDE;
      const x = plotX + f32(i) * slot + slot * 0.5;
      const y = yFor(workData[o + 4], plotY, plotH, priceMin, priceMax);
      if (i > 0) {
        const po = (i - 1) * STRIDE;
        const px = plotX + f32(i - 1) * slot + slot * 0.5;
        const py = yFor(workData[po + 4], plotY, plotH, priceMin, priceMax);
        pushLine(px, py, lnR, lnG, lnB);
        pushLine(x, y, lnR, lnG, lnB);
        pushTri(px, py, topR, topG, topB, 0, 0, -1, -1);
        pushTri(x, y, topR, topG, topB, 0, 0, -1, -1);
        pushTri(px, base, botR, botG, botB, 0, 0, -1, -1);
        pushTri(x, y, topR, topG, topB, 0, 0, -1, -1);
        pushTri(x, base, botR, botG, botB, 0, 0, -1, -1);
        pushTri(px, base, botR, botG, botB, 0, 0, -1, -1);
      }
    }
    return triCount;
  }

  for (let i = 0; i < n; i++) {
    const o = i * STRIDE;
    const open = workData[o + 1];
    const high = workData[o + 2];
    const low = workData[o + 3];
    const close = workData[o + 4];
    const up = close >= open;
    const r = up ? upR : dnR;
    const g = up ? upG : dnG;
    const b = up ? upB : dnB;
    const x = plotX + f32(i) * slot + slot * 0.5;
    const yH = yFor(high, plotY, plotH, priceMin, priceMax);
    const yL = yFor(low, plotY, plotH, priceMin, priceMax);
    const yO = yFor(open, plotY, plotH, priceMin, priceMax);
    const yC = yFor(close, plotY, plotH, priceMin, priceMax);

    if (chartType == 0) {
      // Zone：高-低半透明带 + 开收实体（REA Zone=0，无影线倒计时）
      const zoneW = Mathf.max(2.0, slot * 0.72);
      const zr = r * 0.35 + 0.08;
      const zg = g * 0.35 + 0.08;
      const zb = b * 0.35 + 0.08;
      pushRoundedQuad(x - zoneW * 0.5, yH, x + zoneW * 0.5, yL, zr, zg, zb);
      const bodyW = Mathf.max(2.0, slot * 0.48);
      const top = Mathf.min(yO, yC);
      const bot = Mathf.max(yO, yC);
      const h = Mathf.max(1.0, bot - top);
      pushRoundedQuad(x - bodyW * 0.5, top, x + bodyW * 0.5, top + h, r, g, b);
      continue;
    }

    // wick / bar stem
    pushLine(x, yH, r, g, b);
    pushLine(x, yL, r, g, b);

    if (chartType == 3) {
      // Bar
      const tick = Mathf.max(3.0, slot * 0.28);
      pushLine(x - tick, yO, r, g, b);
      pushLine(x, yO, r, g, b);
      pushLine(x, yC, r, g, b);
      pushLine(x + tick, yC, r, g, b);
    } else {
      // Candle / HeikenAshi：体宽与截图间隙对齐；圆角走 GPU SDF
      const bodyW = Mathf.max(2.0, slot * 0.54);
      const top = Mathf.min(yO, yC);
      const bot = Mathf.max(yO, yC);
      const h = Mathf.max(1.0, bot - top);
      pushRoundedQuad(x - bodyW * 0.5, top, x + bodyW * 0.5, top + h, r, g, b);
    }
  }
  return triCount;
}

/** 命中测试：返回全局 candle index，未命中 -1 */
export function hitTest(
  px: f32,
  plotX: f32,
  slotW: f32,
  start: i32,
  count: i32,
): i32 {
  if (slotW <= 0 || count <= 0) return -1;
  if (px < plotX) return -1;
  const idx = i32(Math.floor((px - plotX) / slotW));
  if (idx < 0 || idx >= count) return -1;
  return start + idx;
}

export function visibleWindow(
  total: i32,
  visibleCount: i32,
  rightOffset: f32,
): i64 {
  // pack start/end into i64: high=start, low=end
  let end = total - i32(Math.floor(rightOffset));
  if (end < 0) end = 0;
  if (end > total) end = total;
  let start = end - visibleCount;
  if (start < 0) start = 0;
  return (i64(start) << 32) | i64(u32(end));
}

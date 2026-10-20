import { QuotesHistoryAdapter } from "./data-adapter.js";
import { ChartEngine } from "./chart-engine.js";
import { loadChartCore } from "./wasm-loader.js";

const canvas = document.getElementById("chart");
const overlay = document.getElementById("overlay");
const statusText = document.getElementById("statusText");
const fpsText = document.getElementById("fpsText");
const chartTypeEl = document.getElementById("chartType");
const candleSizeEl = document.getElementById("candleSize");
const focusLastBtn = document.getElementById("focusLast");
const toggleLiveBtn = document.getElementById("toggleLive");
const toggleVolumeEl = document.getElementById("toggleVolume");
const returnToLastBtn = document.getElementById("returnToLast");

const hud = {
  open: document.getElementById("hudOpen"),
  high: document.getElementById("hudHigh"),
  low: document.getElementById("hudLow"),
  close: document.getElementById("hudClose"),
  vol: document.getElementById("hudVol"),
  delta: document.getElementById("hudDelta"),
};

function setHud(candle) {
  if (!candle) {
    hud.open.textContent = "—";
    hud.high.textContent = "—";
    hud.low.textContent = "—";
    hud.close.textContent = "—";
    hud.vol.textContent = "—";
    hud.delta.textContent = "—";
    hud.delta.className = "";
    hud.close.className = "";
    return;
  }
  const delta = candle.close - candle.open;
  const pct = (delta / candle.open) * 100;
  const cls = delta >= 0 ? "up" : "down";
  hud.open.textContent = candle.open.toFixed(5);
  hud.high.textContent = candle.high.toFixed(5);
  hud.low.textContent = candle.low.toFixed(5);
  hud.close.textContent = candle.close.toFixed(5);
  hud.vol.textContent = String(candle.volume ?? "—");
  hud.delta.textContent = `${delta >= 0 ? "+" : ""}${delta.toFixed(5)} (${pct.toFixed(3)}%)`;
  hud.delta.className = cls;
  hud.close.className = cls;
}

statusText.textContent = "加载 chart_core.wasm…";
const wasm = await loadChartCore("./build/chart_core.wasm");
statusText.textContent = "WASM ready · 初始化 WebGL2…";

const adapter = new QuotesHistoryAdapter({ candleSize: 60, initialCount: 260 });
const chart = new ChartEngine(canvas, overlay, wasm, {
  onHover: (c) => setHud(c ?? adapter.candles.at(-1)),
  returnBtn: returnToLastBtn,
});
chart.setCandleSize(60);
chart.setShowVolume(toggleVolumeEl.checked);

let frames = 0;
let lastFpsTs = performance.now();

function paint() {
  chart.setCandles(adapter.candles);
  chart.draw();
  frames += 1;
  const now = performance.now();
  if (now - lastFpsTs >= 1000) {
    fpsText.textContent = `${frames} FPS · WebGL2`;
    frames = 0;
    lastFpsTs = now;
  }
  requestAnimationFrame(paint);
}

chart.onNeedOlder(async () => {
  if (chart.loadingHistory) return;
  chart.loadingHistory = true;
  statusText.textContent = "quotes-history.get-candles@2.0 …";
  const older = await adapter.getCandles({ count: 60 });
  chart.applyPrependedCandles(older.length);
  chart._syncKey = "";
  statusText.textContent = `WASM/WebGL2 · 已追加 ${older.length} · 共 ${adapter.candles.length}`;
  chart.loadingHistory = false;
});

adapter.addEventListener("history", (e) => {
  const { name, candles } = e.detail;
  statusText.textContent = `WASM/WebGL2 · ${name} · ${candles.length}`;
  setHud(candles.at(-1));
});

adapter.addEventListener("candle", (e) => {
  if (chart.hoverIndex < 0) setHud(e.detail.candle);
});

chartTypeEl.addEventListener("change", () => {
  chart.setChartType(chartTypeEl.value);
});

candleSizeEl.addEventListener("change", async () => {
  const size = Number(candleSizeEl.value);
  chart.setCandleSize(size);
  statusText.textContent = "quotes-history.get-first-candles@1.0 …";
  await adapter.setCandleSize(size);
  chart.focusLast();
});

toggleVolumeEl.addEventListener("change", () => {
  chart.setShowVolume(toggleVolumeEl.checked);
});

const goHome = () => chart.focusLast();
focusLastBtn.addEventListener("click", goHome);
returnToLastBtn.addEventListener("click", goHome);

toggleLiveBtn.addEventListener("click", () => {
  const next = !adapter.live;
  adapter.setLive(next);
  toggleLiveBtn.textContent = next ? "暂停实时" : "恢复实时";
  statusText.textContent = next
    ? "quotes.candle-generated@1.0 → WASM → WebGL2"
    : "实时推送已暂停";
});

await adapter.getFirstCandles({ size: 60, count: 260 });
adapter.startRealtime();
statusText.textContent = "quotes.candle-generated@1.0 → WASM → WebGL2";
setHud(adapter.candles.at(-1));
paint();

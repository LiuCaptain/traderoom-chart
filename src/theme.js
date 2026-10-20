/**
 * REA 逆向：YS palette → window.setPaletteColor
 * 键名来自生产 Bundle KS 映射；色值按 IQ Option 截图像素采样。
 */

export const PALETTE = {
  "background-top": "#0f172c",
  "background-bottom": "#0f172c",
  "background-transparent": "#00000000",

  "axis-label": "#6b7690",
  "axis-line": "#1e2a42",

  "chart-candles-grow": "#30a46c",
  "chart-candles-grow-stroke": "#30a46c",
  "chart-candles-fall": "#e5484d",
  "chart-candles-fall-stroke": "#e5484d",
  "chart-candles-flat": "#8b93a7",
  "chart-heikin-ashi-candles-grow": "#54b9ff",
  "chart-heikin-ashi-candles-grow-stroke": "#54b9ff",

  // enableTradingVolume
  "chart-volume-grow": "#30a46c88",
  "chart-volume-fall": "#e5484d88",
  "chart-volume-flat": "#6b769066",

  "chart-line": "#e8ecf4",
  "chart-line-gradient-top": "#c5cddc66",
  "chart-line-gradient-bottom": "#00000000",

  "chart-crosshair-line": "#5c657a",
  "chart-crosshair-label-body": "#2c3344",
  "chart-crosshair-label-text": "#f2f4f8",

  "chart-current-value-line": "#e8ecf4",
  "chart-current-value-body": "#e8ecf4",
  "chart-current-value-base": "#f2f4f8",
  "chart-current-value-precision-positive": "#30a46c",
  "chart-current-value-precision-negative": "#e5484d",
  "chart-last-value-point": "#ffffff",
  "chart-last-value-point-glow": "#ffffff55",

  "chart-extremum-body": "#0f172c",
  "chart-extremum-text": "#6b7690",

  "line-on-time-scale-bar": "#1e2a42",
  "chart-current-time-body": "#243049aa",
  "chart-current-time-text": "#6b7690",

  "chart-edge-fade": "#0f172c",
  "chart-return-to-last-body": "#1a2438",
  "chart-return-to-last-text": "#f2f4f8",
  "chart-return-to-last-icon": "#54b9ff",
  "last-candle-timer-body": "#1a2438cc",
  "last-candle-timer-text": "#f2f4f8",
  "graph-info-hint-background": "#152038e6",
  "graph-info-label-color": "#6b7690",
  "graph-info-value-color": "#e8ecf4",
};

export function hexToRgb(hex) {
  const h = hex.replace("#", "");
  const full = h.length === 3 ? h.split("").map((c) => c + c).join("") : h.slice(0, 6);
  return {
    r: parseInt(full.slice(0, 2), 16) / 255,
    g: parseInt(full.slice(2, 4), 16) / 255,
    b: parseInt(full.slice(4, 6), 16) / 255,
  };
}

export function candleColors(chartType) {
  if (chartType === "heikenAshi") {
    return {
      grow: hexToRgb(PALETTE["chart-heikin-ashi-candles-grow"]),
      fall: hexToRgb(PALETTE["chart-candles-fall"]),
    };
  }
  return {
    grow: hexToRgb(PALETTE["chart-candles-grow"]),
    fall: hexToRgb(PALETTE["chart-candles-fall"]),
  };
}

/** REA：ev = { Zone:0, Candle:1, Linear:2, Bar:3, HeikenAshi:4 } */
export const CHART_TYPE = {
  zone: 0,
  candle: 1,
  linear: 2,
  bar: 3,
  heikenAshi: 4,
};

/** Zone / Linear 不显示 last-candle-timer（REA） */
export function supportsLastCandleTimer(chartType) {
  return chartType !== "zone" && chartType !== "linear";
}

/**
 * 假行情生成器：模拟 IQ Option /echo/websocket 上的
 * quotes-history.get-first-candles / get-candles / quotes.candle-generated
 *
 * 故意制造「高波动 / 低波动」区间，便于拖动时价格轴 auto-fit 产生明显高低变化。
 */

function seededRandom(seed) {
  let s = seed >>> 0;
  return () => {
    s = (s * 1664525 + 1013904223) >>> 0;
    return s / 0xffffffff;
  };
}

export function createFakeCandles({
  count = 240,
  size = 60,
  startPrice = 1.08542,
  seed = 42,
  endTs = Math.floor(Date.now() / 1000),
} = {}) {
  const rand = seededRandom(seed);
  const candles = [];
  let price = startPrice;
  let from = endTs - count * size;

  for (let i = 0; i < count; i += 1) {
    // 每 36 根切换波动体制：安静段 vs 剧烈段
    const regime = Math.floor(i / 36) % 3;
    const vol =
      regime === 0 ? 0.00035 : regime === 1 ? 0.0018 : 0.0009;
    const open = price;
    const drift = (rand() - 0.48) * vol * 0.9;
    const shock = (rand() - 0.5) * vol * 1.4;
    const close = Math.max(0.0001, open + drift + shock);
    const wick = vol * (0.35 + rand() * 0.9);
    const high = Math.max(open, close) + rand() * wick;
    const low = Math.min(open, close) - rand() * wick;
    candles.push({
      from,
      to: from + size,
      open,
      high,
      low,
      close,
      volume: Math.floor(80 + rand() * 420),
      id: from,
    });
    price = close;
    from += size;
  }
  return candles;
}

/** 把当前未收盘 K 线按 tick 推进，对应 candle-generated */
export function tickLiveCandle(candle, size, nowSec = Date.now() / 1000) {
  const progress = Math.min(1, Math.max(0, (nowSec - candle.from) / size));
  const noise = Math.sin(nowSec * 7.3) * 0.00012 + Math.cos(nowSec * 3.1) * 0.00008;
  const target = candle.open + (candle.close - candle.open) * 0.15 + noise;
  const close = candle.close * 0.82 + target * 0.18;
  const high = Math.max(candle.high, candle.open, close);
  const low = Math.min(candle.low, candle.open, close);
  return {
    ...candle,
    to: Math.min(candle.from + size, Math.floor(nowSec)),
    high,
    low,
    close,
    volume: candle.volume + (progress > 0.98 ? 0 : 1),
  };
}

export function rollNewCandle(prev, size) {
  const from = prev.from + size;
  return {
    from,
    to: from + size,
    open: prev.close,
    high: prev.close,
    low: prev.close,
    close: prev.close,
    volume: 1,
    id: from,
  };
}

export function toHeikenAshi(candles) {
  if (!candles.length) return [];
  const out = [];
  for (let i = 0; i < candles.length; i += 1) {
    const c = candles[i];
    const prev = out[i - 1];
    const haClose = (c.open + c.high + c.low + c.close) / 4;
    const haOpen = prev ? (prev.open + prev.close) / 2 : (c.open + c.close) / 2;
    out.push({
      ...c,
      open: haOpen,
      close: haClose,
      high: Math.max(c.high, haOpen, haClose),
      low: Math.min(c.low, haOpen, haClose),
    });
  }
  return out;
}

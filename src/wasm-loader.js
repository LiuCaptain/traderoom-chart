/**
 * 加载自研 chart_core.wasm
 * 链路：JS 写入 OHLC → WASM 生成顶点 → WebGL2 上传 GPU
 */

export async function loadChartCore() {
  const core = await import("../build/chart_core.js");

  return {
    memory: core.memory,
    exports: core,

    syncCandles(candles) {
      core.setCandleCount(candles.length);
      for (let i = 0; i < candles.length; i++) {
        const c = candles[i];
        core.setCandle(i, c.from, c.open, c.high, c.low, c.close, c.volume ?? 0);
      }
      return core.getCandleCount();
    },

    readF32(ptr, count) {
      return new Float32Array(core.memory.buffer, ptr, count);
    },

    computeVisibleRange({ chartType, start, end, pricePad }) {
      core.computeVisibleRange(chartType, start, end, pricePad);
      return { min: core.getPriceMin(), max: core.getPriceMax() };
    },

    buildGeometry(args) {
      const g = args.grow ?? { r: 48 / 255, g: 164 / 255, b: 108 / 255 };
      const f = args.fall ?? { r: 229 / 255, g: 72 / 255, b: 77 / 255 };
      const l = args.line ?? { r: 0.91, g: 0.93, b: 0.96 };
      core.buildGeometry(
        args.chartType,
        args.start,
        args.end,
        args.plotX,
        args.plotY,
        args.plotW,
        args.plotH,
        args.visibleCount,
        args.pricePad,
        args.useFixedRange ? 1 : 0,
        args.fixedMin ?? 0,
        args.fixedMax ?? 0,
        g.r,
        g.g,
        g.b,
        f.r,
        f.g,
        f.b,
        l.r,
        l.g,
        l.b,
      );
      const triN = core.getTriVertexCount();
      const lineN = core.getLineVertexCount();
      const triStride = 9; // x,y,rgb,local,half
      const lineStride = 5;
      const triSrc = this.readF32(core.triVertsPtr(), triN * triStride);
      const lineSrc = this.readF32(core.lineVertsPtr(), lineN * lineStride);
      return {
        triangles: triSrc.slice(),
        lines: lineSrc.slice(),
        triCount: triN,
        lineCount: lineN,
        priceMin: core.getPriceMin(),
        priceMax: core.getPriceMax(),
      };
    },

    hitTest(px, plotX, slotW, start, count) {
      return core.hitTest(px, plotX, slotW, start, count);
    },

    visibleWindow(total, visibleCount, rightOffset) {
      const packed = core.visibleWindow(total, visibleCount, rightOffset);
      const v = typeof packed === "bigint" ? packed : BigInt(packed);
      return {
        start: Number(v >> 32n),
        end: Number(v & 0xffffffffn),
      };
    },
  };
}

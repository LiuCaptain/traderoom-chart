/** Exported memory */
export declare const memory: WebAssembly.Memory;
// Exported runtime interface
export declare function __new(size: number, id: number): number;
export declare function __pin(ptr: number): number;
export declare function __unpin(ptr: number): void;
export declare function __collect(): void;
export declare const __rtti_base: number;
/**
 * assembly/index/getPriceMin
 * @returns `f64`
 */
export declare function getPriceMin(): number;
/**
 * assembly/index/getPriceMax
 * @returns `f64`
 */
export declare function getPriceMax(): number;
/**
 * assembly/index/getTriVertexCount
 * @returns `i32`
 */
export declare function getTriVertexCount(): number;
/**
 * assembly/index/getLineVertexCount
 * @returns `i32`
 */
export declare function getLineVertexCount(): number;
/**
 * assembly/index/getCandleCount
 * @returns `i32`
 */
export declare function getCandleCount(): number;
/**
 * assembly/index/candleDataPtr
 * @returns `usize`
 */
export declare function candleDataPtr(): number;
/**
 * assembly/index/triVertsPtr
 * @returns `usize`
 */
export declare function triVertsPtr(): number;
/**
 * assembly/index/lineVertsPtr
 * @returns `usize`
 */
export declare function lineVertsPtr(): number;
/**
 * assembly/index/reserveCandles
 * @param n `i32`
 * @returns `usize`
 */
export declare function reserveCandles(n: number): number;
/**
 * assembly/index/setCandle
 * @param i `i32`
 * @param from `f64`
 * @param open `f64`
 * @param high `f64`
 * @param low `f64`
 * @param close `f64`
 * @param volume `f64`
 */
export declare function setCandle(i: number, from: number, open: number, high: number, low: number, close: number, volume: number): void;
/**
 * assembly/index/setCandleCount
 * @param n `i32`
 */
export declare function setCandleCount(n: number): void;
/**
 * assembly/index/buildGeometry
 * @param chartType `i32`
 * @param start `i32`
 * @param end `i32`
 * @param plotX `f32`
 * @param plotY `f32`
 * @param plotW `f32`
 * @param plotH `f32`
 * @param visibleCount `f32`
 * @param pricePad `f64`
 * @param stretchY `f32`
 * @returns `i32`
 */
export declare function buildGeometry(chartType: number, start: number, end: number, plotX: number, plotY: number, plotW: number, plotH: number, visibleCount: number, pricePad: number, stretchY?: number): number;
/**
 * assembly/index/hitTest
 * @param px `f32`
 * @param plotX `f32`
 * @param slotW `f32`
 * @param start `i32`
 * @param count `i32`
 * @returns `i32`
 */
export declare function hitTest(px: number, plotX: number, slotW: number, start: number, count: number): number;
/**
 * assembly/index/visibleWindow
 * @param total `i32`
 * @param visibleCount `i32`
 * @param rightOffset `f32`
 * @returns `i64`
 */
export declare function visibleWindow(total: number, visibleCount: number, rightOffset: number): bigint;

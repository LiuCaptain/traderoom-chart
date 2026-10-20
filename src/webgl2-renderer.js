/**
 * WebGL2 渲染器 —— 对应原站 GPU 绘制层
 * 蜡烛体：SDF 圆角（对标 IQ Option 截图软角矩形）
 */

const VS = `#version 300 es
precision highp float;
layout(location=0) in vec2 a_pos;
layout(location=1) in vec3 a_color;
layout(location=2) in vec2 a_local;
layout(location=3) in vec2 a_half;
uniform vec2 u_resolution;
uniform float u_offsetX;
out vec3 v_color;
out vec2 v_local;
out vec2 v_half;
void main() {
  vec2 pos = vec2(a_pos.x + u_offsetX, a_pos.y);
  vec2 clip = (pos / u_resolution) * 2.0 - 1.0;
  gl_Position = vec4(clip.x, -clip.y, 0.0, 1.0);
  v_color = a_color;
  v_local = a_local;
  v_half = a_half;
}
`;

const FS = `#version 300 es
precision highp float;
in vec3 v_color;
in vec2 v_local;
in vec2 v_half;
out vec4 outColor;

// 圆角盒 SDF：p 相对中心，b 半宽高，r 圆角
float sdRoundBox(vec2 p, vec2 b, float r) {
  vec2 q = abs(p) - b + vec2(r);
  return min(max(q.x, q.y), 0.0) + length(max(q, 0.0)) - r;
}

void main() {
  // half.x <= 0 → 实心（线性面积等）
  if (v_half.x <= 0.0) {
    outColor = vec4(v_color, 1.0);
    return;
  }
  // 对标截图：圆角约 2.4–2.8 css px，矮实体自动收缩
  float rad = min(2.6, min(v_half.x, v_half.y) * 0.92);
  float d = sdRoundBox(v_local, v_half, rad);
  float aa = max(fwidth(d), 0.75);
  float alpha = 1.0 - smoothstep(-aa, aa, d);
  if (alpha < 0.02) discard;
  outColor = vec4(v_color, alpha);
}
`;

const LINE_VS = `#version 300 es
precision highp float;
layout(location=0) in vec2 a_pos;
layout(location=1) in vec3 a_color;
uniform vec2 u_resolution;
uniform float u_offsetX;
out vec3 v_color;
void main() {
  vec2 pos = vec2(a_pos.x + u_offsetX, a_pos.y);
  vec2 clip = (pos / u_resolution) * 2.0 - 1.0;
  gl_Position = vec4(clip.x, -clip.y, 0.0, 1.0);
  v_color = a_color;
}
`;

const LINE_FS = `#version 300 es
precision highp float;
in vec3 v_color;
out vec4 outColor;
void main() {
  outColor = vec4(v_color, 1.0);
}
`;

function compile(gl, type, src) {
  const sh = gl.createShader(type);
  gl.shaderSource(sh, src);
  gl.compileShader(sh);
  if (!gl.getShaderParameter(sh, gl.COMPILE_STATUS)) {
    const info = gl.getShaderInfoLog(sh);
    gl.deleteShader(sh);
    throw new Error(info);
  }
  return sh;
}

function createProgram(gl, vsSrc, fsSrc) {
  const vs = compile(gl, gl.VERTEX_SHADER, vsSrc);
  const fs = compile(gl, gl.FRAGMENT_SHADER, fsSrc);
  const prog = gl.createProgram();
  gl.attachShader(prog, vs);
  gl.attachShader(prog, fs);
  gl.linkProgram(prog);
  if (!gl.getProgramParameter(prog, gl.LINK_STATUS)) {
    throw new Error(gl.getProgramInfoLog(prog));
  }
  gl.deleteShader(vs);
  gl.deleteShader(fs);
  return prog;
}

export class WebGL2Renderer {
  constructor(canvas) {
    this.canvas = canvas;
    const gl = canvas.getContext("webgl2", {
      antialias: true,
      alpha: false,
      premultipliedAlpha: false,
      preserveDrawingBuffer: false,
    });
    if (!gl) throw new Error("WebGL2 不可用");
    this.gl = gl;
    this.triProgram = createProgram(gl, VS, FS);
    this.lineProgram = createProgram(gl, LINE_VS, LINE_FS);
    this.uTriResolution = gl.getUniformLocation(this.triProgram, "u_resolution");
    this.uTriOffsetX = gl.getUniformLocation(this.triProgram, "u_offsetX");
    this.uLineResolution = gl.getUniformLocation(this.lineProgram, "u_resolution");
    this.uLineOffsetX = gl.getUniformLocation(this.lineProgram, "u_offsetX");

    this.triVao = gl.createVertexArray();
    this.triBuf = gl.createBuffer();
    this.lineVao = gl.createVertexArray();
    this.lineBuf = gl.createBuffer();
    this._bindTriVao();
    this._bindLineVao();

    this.triCount = 0;
    this.lineCount = 0;
    this.width = 0;
    this.height = 0;
    this.dpr = Math.min(window.devicePixelRatio || 1, 2);
    this.offsetX = 0;
    this.scissor = null;

    gl.disable(gl.DEPTH_TEST);
  }

  setOffsetX(x) {
    this.offsetX = x;
  }

  /** CSS 像素坐标系下的裁剪盒，避免边缘多画的 K 线闪入闪出 */
  setScissor(rect) {
    this.scissor = rect;
  }

  _bindTriVao() {
    const gl = this.gl;
    gl.bindVertexArray(this.triVao);
    gl.bindBuffer(gl.ARRAY_BUFFER, this.triBuf);
    const stride = 9 * 4;
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 2, gl.FLOAT, false, stride, 0);
    gl.enableVertexAttribArray(1);
    gl.vertexAttribPointer(1, 3, gl.FLOAT, false, stride, 8);
    gl.enableVertexAttribArray(2);
    gl.vertexAttribPointer(2, 2, gl.FLOAT, false, stride, 20);
    gl.enableVertexAttribArray(3);
    gl.vertexAttribPointer(3, 2, gl.FLOAT, false, stride, 28);
    gl.bindVertexArray(null);
  }

  _bindLineVao() {
    const gl = this.gl;
    gl.bindVertexArray(this.lineVao);
    gl.bindBuffer(gl.ARRAY_BUFFER, this.lineBuf);
    const stride = 5 * 4;
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 2, gl.FLOAT, false, stride, 0);
    gl.enableVertexAttribArray(1);
    gl.vertexAttribPointer(1, 3, gl.FLOAT, false, stride, 8);
    gl.bindVertexArray(null);
  }

  resize() {
    const rect = this.canvas.getBoundingClientRect();
    this.width = rect.width;
    this.height = rect.height;
    this.canvas.width = Math.floor(rect.width * this.dpr);
    this.canvas.height = Math.floor(rect.height * this.dpr);
    this.gl.viewport(0, 0, this.canvas.width, this.canvas.height);
  }

  upload(triangles, lines, triCount, lineCount) {
    const gl = this.gl;
    this.triCount = triCount;
    this.lineCount = lineCount;

    gl.bindBuffer(gl.ARRAY_BUFFER, this.triBuf);
    gl.bufferData(gl.ARRAY_BUFFER, triangles.subarray(0, triCount * 9), gl.DYNAMIC_DRAW);

    gl.bindBuffer(gl.ARRAY_BUFFER, this.lineBuf);
    gl.bufferData(gl.ARRAY_BUFFER, lines.subarray(0, lineCount * 5), gl.DYNAMIC_DRAW);
  }

  clear(r = 0.059, g = 0.09, b = 0.173) {
    const gl = this.gl;
    gl.disable(gl.SCISSOR_TEST);
    gl.clearColor(r, g, b, 1);
    gl.clear(gl.COLOR_BUFFER_BIT);
  }

  _applyScissor() {
    const gl = this.gl;
    if (this.scissor) {
      const s = this.scissor;
      const dpr = this.dpr;
      const x = Math.floor(s.x * dpr);
      const y = Math.floor((this.height - s.y - s.h) * dpr);
      const w = Math.max(0, Math.ceil(s.w * dpr));
      const h = Math.max(0, Math.ceil(s.h * dpr));
      gl.enable(gl.SCISSOR_TEST);
      gl.scissor(x, y, w, h);
    } else {
      gl.disable(gl.SCISSOR_TEST);
    }
  }

  draw() {
    const gl = this.gl;
    gl.viewport(0, 0, this.canvas.width, this.canvas.height);
    this._applyScissor();

    if (this.triCount > 0) {
      gl.enable(gl.BLEND);
      gl.blendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);
      gl.useProgram(this.triProgram);
      gl.uniform2f(this.uTriResolution, this.width, this.height);
      gl.uniform1f(this.uTriOffsetX, this.offsetX);
      gl.bindVertexArray(this.triVao);
      gl.drawArrays(gl.TRIANGLES, 0, this.triCount);
      gl.disable(gl.BLEND);
    }
    if (this.lineCount > 0) {
      gl.useProgram(this.lineProgram);
      gl.uniform2f(this.uLineResolution, this.width, this.height);
      gl.uniform1f(this.uLineOffsetX, this.offsetX);
      gl.bindVertexArray(this.lineVao);
      gl.drawArrays(gl.LINES, 0, this.lineCount);
    }
    gl.bindVertexArray(null);
    gl.disable(gl.SCISSOR_TEST);
  }
}

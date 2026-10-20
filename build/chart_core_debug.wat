(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32 i32)))
 (type $2 (func (param i32)))
 (type $3 (func (result i32)))
 (type $4 (func))
 (type $5 (func (param i32 i32) (result i32)))
 (type $6 (func (param i32 i32 i32)))
 (type $7 (func (result f64)))
 (type $8 (func (param i32 i32 i32 f32 f32 f32 f32 f32 f64 f32) (result i32)))
 (type $9 (func (param f32 f32 f32 f32 f32)))
 (type $10 (func (param i32 i32 i32 i32)))
 (type $11 (func (param i32 i32 i64) (result i32)))
 (type $12 (func (param f32 f32 f32 f32 f32 f32 f32)))
 (type $13 (func (param f32 f32 f32 i32 i32) (result i32)))
 (type $14 (func (param i32 i32 f32) (result i64)))
 (type $15 (func (param i32 i32 i32) (result i32)))
 (type $16 (func (param i32 i32) (result f64)))
 (type $17 (func (param i32 i32 f64)))
 (type $18 (func (param i32 f64 f64 f64 f64 f64 f64)))
 (type $19 (func (param i32 f64)))
 (type $20 (func (param i32 i32 f32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (global $assembly/index/STRIDE i32 (i32.const 6))
 (global $assembly/index/VERT_STRIDE i32 (i32.const 5))
 (global $assembly/index/candleCap (mut i32) (i32.const 0))
 (global $assembly/index/candleCount (mut i32) (i32.const 0))
 (global $~lib/shared/runtime/Runtime.Stub i32 (i32.const 0))
 (global $~lib/shared/runtime/Runtime.Minimal i32 (i32.const 1))
 (global $~lib/shared/runtime/Runtime.Incremental i32 (i32.const 2))
 (global $~lib/rt/itcms/total (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/threshold (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/state (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/visitCount (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/pinSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/iter (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/toSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/white (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/fromSpace (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/native/ASC_LOW_MEMORY_LIMIT i32 (i32.const 0))
 (global $~lib/native/ASC_RUNTIME i32 (i32.const 2))
 (global $assembly/index/candleData (mut i32) (i32.const 0))
 (global $assembly/index/workCap (mut i32) (i32.const 0))
 (global $assembly/index/workData (mut i32) (i32.const 0))
 (global $assembly/index/triCap (mut i32) (i32.const 0))
 (global $assembly/index/triCount (mut i32) (i32.const 0))
 (global $assembly/index/triVerts (mut i32) (i32.const 0))
 (global $assembly/index/lineCap (mut i32) (i32.const 0))
 (global $assembly/index/lineCount (mut i32) (i32.const 0))
 (global $assembly/index/lineVerts (mut i32) (i32.const 0))
 (global $assembly/index/priceMin (mut f64) (f64.const 0))
 (global $assembly/index/priceMax (mut f64) (f64.const 1))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 720))
 (global $~lib/memory/__data_end i32 (i32.const 748))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 33516))
 (global $~lib/memory/__heap_base i32 (i32.const 33516))
 (memory $0 1)
 (data $0 (i32.const 12) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data $1 (i32.const 60) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00\00\00\00\00\00\00")
 (data $2 (i32.const 124) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00\00\00\00\00")
 (data $3 (i32.const 188) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00r\00t\00/\00i\00t\00c\00m\00s\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $4 (i32.const 256) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $5 (i32.const 288) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $6 (i32.const 316) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e\00\00\00\00\00\00\00\00\00")
 (data $7 (i32.const 380) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s\00\00\00\00\00\00\00\00\00")
 (data $8 (i32.const 432) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $9 (i32.const 460) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $10 (i32.const 524) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00\00\00\00\00\00\00")
 (data $11 (i32.const 588) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00*\00\00\00O\00b\00j\00e\00c\00t\00 \00a\00l\00r\00e\00a\00d\00y\00 \00p\00i\00n\00n\00e\00d\00\00\00")
 (data $12 (i32.const 652) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00O\00b\00j\00e\00c\00t\00 \00i\00s\00 \00n\00o\00t\00 \00p\00i\00n\00n\00e\00d\00\00\00\00\00")
 (data $13 (i32.const 720) "\06\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00\01\1a\00\00\01\19\00\00")
 (table $0 1 1 funcref)
 (elem $0 (i32.const 1))
 (export "getPriceMin" (func $assembly/index/getPriceMin))
 (export "getPriceMax" (func $assembly/index/getPriceMax))
 (export "getTriVertexCount" (func $assembly/index/getTriVertexCount))
 (export "getLineVertexCount" (func $assembly/index/getLineVertexCount))
 (export "getCandleCount" (func $assembly/index/getCandleCount))
 (export "candleDataPtr" (func $assembly/index/candleDataPtr))
 (export "triVertsPtr" (func $assembly/index/triVertsPtr))
 (export "lineVertsPtr" (func $assembly/index/lineVertsPtr))
 (export "reserveCandles" (func $assembly/index/reserveCandles))
 (export "setCandle" (func $assembly/index/setCandle))
 (export "setCandleCount" (func $assembly/index/setCandleCount))
 (export "buildGeometry" (func $assembly/index/buildGeometry@varargs))
 (export "hitTest" (func $assembly/index/hitTest))
 (export "visibleWindow" (func $assembly/index/visibleWindow))
 (export "__new" (func $~lib/rt/itcms/__new))
 (export "__pin" (func $~lib/rt/itcms/__pin))
 (export "__unpin" (func $~lib/rt/itcms/__unpin))
 (export "__collect" (func $~lib/rt/itcms/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "memory" (memory $0))
 (export "__setArgumentsLength" (func $~setArgumentsLength))
 (start $~start)
 (func $~lib/rt/itcms/Object#set:nextWithColor (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=4
 )
 (func $~lib/rt/itcms/Object#set:prev (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=8
 )
 (func $~lib/rt/itcms/initLazy (param $0 i32) (result i32)
  local.get $0
  local.get $0
  call $~lib/rt/itcms/Object#set:nextWithColor
  local.get $0
  local.get $0
  call $~lib/rt/itcms/Object#set:prev
  local.get $0
  return
 )
 (func $~lib/rt/itcms/Object#get:nextWithColor (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
 )
 (func $~lib/rt/itcms/Object#get:next (param $0 i32) (result i32)
  local.get $0
  call $~lib/rt/itcms/Object#get:nextWithColor
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  return
 )
 (func $~lib/rt/itcms/Object#get:color (param $0 i32) (result i32)
  local.get $0
  call $~lib/rt/itcms/Object#get:nextWithColor
  i32.const 3
  i32.and
  return
 )
 (func $~lib/rt/itcms/visitRoots (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/__visit_globals
  global.get $~lib/rt/itcms/pinSpace
  local.set $1
  local.get $1
  call $~lib/rt/itcms/Object#get:next
  local.set $2
  loop $while-continue|0
   local.get $2
   local.get $1
   i32.ne
   if
    i32.const 1
    drop
    local.get $2
    call $~lib/rt/itcms/Object#get:color
    i32.const 3
    i32.eq
    i32.eqz
    if
     i32.const 0
     i32.const 208
     i32.const 160
     i32.const 16
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    i32.const 20
    i32.add
    local.get $0
    call $~lib/rt/__visit_members
    local.get $2
    call $~lib/rt/itcms/Object#get:next
    local.set $2
    br $while-continue|0
   end
  end
 )
 (func $~lib/rt/itcms/Object#set:color (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  call $~lib/rt/itcms/Object#get:nextWithColor
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $1
  i32.or
  call $~lib/rt/itcms/Object#set:nextWithColor
 )
 (func $~lib/rt/itcms/Object#get:prev (param $0 i32) (result i32)
  local.get $0
  i32.load offset=8
 )
 (func $~lib/rt/itcms/Object#set:next (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  local.get $0
  call $~lib/rt/itcms/Object#get:nextWithColor
  i32.const 3
  i32.and
  i32.or
  call $~lib/rt/itcms/Object#set:nextWithColor
 )
 (func $~lib/rt/itcms/Object#unlink (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/itcms/Object#get:next
  local.set $1
  local.get $1
  i32.const 0
  i32.eq
  if
   i32.const 1
   drop
   local.get $0
   call $~lib/rt/itcms/Object#get:prev
   i32.const 0
   i32.eq
   if (result i32)
    local.get $0
    global.get $~lib/memory/__heap_base
    i32.lt_u
   else
    i32.const 0
   end
   i32.eqz
   if
    i32.const 0
    i32.const 208
    i32.const 128
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   return
  end
  local.get $0
  call $~lib/rt/itcms/Object#get:prev
  local.set $2
  i32.const 1
  drop
  local.get $2
  i32.eqz
  if
   i32.const 0
   i32.const 208
   i32.const 132
   i32.const 16
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $2
  call $~lib/rt/itcms/Object#set:prev
  local.get $2
  local.get $1
  call $~lib/rt/itcms/Object#set:next
 )
 (func $~lib/rt/itcms/Object#get:rtId (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $~lib/shared/typeinfo/Typeinfo#get:flags (param $0 i32) (result i32)
  local.get $0
  i32.load
 )
 (func $~lib/rt/__typeinfo (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/rt/__rtti_base
  local.set $1
  local.get $0
  local.get $1
  i32.load
  i32.gt_u
  if
   i32.const 336
   i32.const 400
   i32.const 21
   i32.const 28
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 4
  i32.add
  local.get $0
  i32.const 4
  i32.mul
  i32.add
  call $~lib/shared/typeinfo/Typeinfo#get:flags
  return
 )
 (func $~lib/rt/itcms/Object#get:isPointerfree (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/itcms/Object#get:rtId
  local.set $1
  local.get $1
  i32.const 2
  i32.le_u
  if (result i32)
   i32.const 1
  else
   local.get $1
   call $~lib/rt/__typeinfo
   i32.const 32
   i32.and
   i32.const 0
   i32.ne
  end
  return
 )
 (func $~lib/rt/itcms/Object#linkTo (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/itcms/Object#get:prev
  local.set $3
  local.get $0
  local.get $1
  local.get $2
  i32.or
  call $~lib/rt/itcms/Object#set:nextWithColor
  local.get $0
  local.get $3
  call $~lib/rt/itcms/Object#set:prev
  local.get $3
  local.get $0
  call $~lib/rt/itcms/Object#set:next
  local.get $1
  local.get $0
  call $~lib/rt/itcms/Object#set:prev
 )
 (func $~lib/rt/itcms/Object#makeGray (param $0 i32)
  (local $1 i32)
  local.get $0
  global.get $~lib/rt/itcms/iter
  i32.eq
  if
   local.get $0
   call $~lib/rt/itcms/Object#get:prev
   local.tee $1
   i32.eqz
   if (result i32)
    i32.const 0
    i32.const 208
    i32.const 148
    i32.const 30
    call $~lib/builtins/abort
    unreachable
   else
    local.get $1
   end
   global.set $~lib/rt/itcms/iter
  end
  local.get $0
  call $~lib/rt/itcms/Object#unlink
  local.get $0
  global.get $~lib/rt/itcms/toSpace
  local.get $0
  call $~lib/rt/itcms/Object#get:isPointerfree
  if (result i32)
   global.get $~lib/rt/itcms/white
   i32.eqz
  else
   i32.const 2
  end
  call $~lib/rt/itcms/Object#linkTo
 )
 (func $~lib/rt/itcms/__visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  local.get $0
  i32.const 20
  i32.sub
  local.set $2
  i32.const 0
  drop
  local.get $2
  call $~lib/rt/itcms/Object#get:color
  global.get $~lib/rt/itcms/white
  i32.eq
  if
   local.get $2
   call $~lib/rt/itcms/Object#makeGray
   global.get $~lib/rt/itcms/visitCount
   i32.const 1
   i32.add
   global.set $~lib/rt/itcms/visitCount
  end
 )
 (func $~lib/rt/itcms/visitStack (param $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  local.set $1
  loop $while-continue|0
   local.get $1
   global.get $~lib/memory/__heap_base
   i32.lt_u
   if
    local.get $1
    i32.load
    local.get $0
    call $~lib/rt/itcms/__visit
    local.get $1
    i32.const 4
    i32.add
    local.set $1
    br $while-continue|0
   end
  end
 )
 (func $~lib/rt/common/BLOCK#get:mmInfo (param $0 i32) (result i32)
  local.get $0
  i32.load
 )
 (func $~lib/rt/itcms/Object#get:size (param $0 i32) (result i32)
  i32.const 4
  local.get $0
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  i32.add
  return
 )
 (func $~lib/rt/tlsf/Root#set:flMap (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store
 )
 (func $~lib/rt/common/BLOCK#set:mmInfo (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store
 )
 (func $~lib/rt/tlsf/Block#set:prev (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/Block#set:next (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=8
 )
 (func $~lib/rt/tlsf/Block#get:prev (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
 )
 (func $~lib/rt/tlsf/Block#get:next (param $0 i32) (result i32)
  local.get $0
  i32.load offset=8
 )
 (func $~lib/rt/tlsf/Root#get:flMap (param $0 i32) (result i32)
  local.get $0
  i32.load
 )
 (func $~lib/rt/tlsf/removeBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (local $23 i32)
  local.get $1
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $2
  i32.const 1
  drop
  local.get $2
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 480
   i32.const 268
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $3
  i32.const 1
  drop
  local.get $3
  i32.const 12
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 480
   i32.const 270
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $4
   local.get $3
   i32.const 4
   i32.shr_u
   local.set $5
  else
   local.get $3
   local.tee $6
   i32.const 1073741820
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_u
   select
   local.set $8
   i32.const 31
   local.get $8
   i32.clz
   i32.sub
   local.set $4
   local.get $8
   local.get $4
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $5
   local.get $4
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $4
  end
  i32.const 1
  drop
  local.get $4
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $5
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 480
   i32.const 284
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $~lib/rt/tlsf/Block#get:prev
  local.set $9
  local.get $1
  call $~lib/rt/tlsf/Block#get:next
  local.set $10
  local.get $9
  if
   local.get $9
   local.get $10
   call $~lib/rt/tlsf/Block#set:next
  end
  local.get $10
  if
   local.get $10
   local.get $9
   call $~lib/rt/tlsf/Block#set:prev
  end
  local.get $1
  block $~lib/rt/tlsf/GETHEAD|inlined.0 (result i32)
   local.get $0
   local.set $11
   local.get $4
   local.set $12
   local.get $5
   local.set $13
   local.get $11
   local.get $12
   i32.const 4
   i32.shl
   local.get $13
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
   br $~lib/rt/tlsf/GETHEAD|inlined.0
  end
  i32.eq
  if
   local.get $0
   local.set $14
   local.get $4
   local.set $15
   local.get $5
   local.set $16
   local.get $10
   local.set $17
   local.get $14
   local.get $15
   i32.const 4
   i32.shl
   local.get $16
   i32.add
   i32.const 2
   i32.shl
   i32.add
   local.get $17
   i32.store offset=96
   local.get $10
   i32.eqz
   if
    block $~lib/rt/tlsf/GETSL|inlined.0 (result i32)
     local.get $0
     local.set $18
     local.get $4
     local.set $19
     local.get $18
     local.get $19
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=4
     br $~lib/rt/tlsf/GETSL|inlined.0
    end
    local.set $20
    local.get $0
    local.set $21
    local.get $4
    local.set $22
    local.get $20
    i32.const 1
    local.get $5
    i32.shl
    i32.const -1
    i32.xor
    i32.and
    local.tee $20
    local.set $23
    local.get $21
    local.get $22
    i32.const 2
    i32.shl
    i32.add
    local.get $23
    i32.store offset=4
    local.get $20
    i32.eqz
    if
     local.get $0
     local.get $0
     call $~lib/rt/tlsf/Root#get:flMap
     i32.const 1
     local.get $4
     i32.shl
     i32.const -1
     i32.xor
     i32.and
     call $~lib/rt/tlsf/Root#set:flMap
    end
   end
  end
 )
 (func $~lib/rt/tlsf/insertBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 i32)
  (local $27 i32)
  (local $28 i32)
  i32.const 1
  drop
  local.get $1
  i32.eqz
  if
   i32.const 0
   i32.const 480
   i32.const 201
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $2
  i32.const 1
  drop
  local.get $2
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 480
   i32.const 203
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETRIGHT|inlined.0 (result i32)
   local.get $1
   local.set $3
   local.get $3
   i32.const 4
   i32.add
   local.get $3
   call $~lib/rt/common/BLOCK#get:mmInfo
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   br $~lib/rt/tlsf/GETRIGHT|inlined.0
  end
  local.set $4
  local.get $4
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $5
  local.get $5
  i32.const 1
  i32.and
  if
   local.get $0
   local.get $4
   call $~lib/rt/tlsf/removeBlock
   local.get $1
   local.get $2
   i32.const 4
   i32.add
   local.get $5
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.tee $2
   call $~lib/rt/common/BLOCK#set:mmInfo
   block $~lib/rt/tlsf/GETRIGHT|inlined.1 (result i32)
    local.get $1
    local.set $6
    local.get $6
    i32.const 4
    i32.add
    local.get $6
    call $~lib/rt/common/BLOCK#get:mmInfo
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
    br $~lib/rt/tlsf/GETRIGHT|inlined.1
   end
   local.set $4
   local.get $4
   call $~lib/rt/common/BLOCK#get:mmInfo
   local.set $5
  end
  local.get $2
  i32.const 2
  i32.and
  if
   block $~lib/rt/tlsf/GETFREELEFT|inlined.0 (result i32)
    local.get $1
    local.set $7
    local.get $7
    i32.const 4
    i32.sub
    i32.load
    br $~lib/rt/tlsf/GETFREELEFT|inlined.0
   end
   local.set $8
   local.get $8
   call $~lib/rt/common/BLOCK#get:mmInfo
   local.set $9
   i32.const 1
   drop
   local.get $9
   i32.const 1
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 480
    i32.const 221
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $8
   call $~lib/rt/tlsf/removeBlock
   local.get $8
   local.set $1
   local.get $1
   local.get $9
   i32.const 4
   i32.add
   local.get $2
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.tee $2
   call $~lib/rt/common/BLOCK#set:mmInfo
  end
  local.get $4
  local.get $5
  i32.const 2
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $2
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $10
  i32.const 1
  drop
  local.get $10
  i32.const 12
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 480
   i32.const 233
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 1
  drop
  local.get $1
  i32.const 4
  i32.add
  local.get $10
  i32.add
  local.get $4
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 480
   i32.const 234
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const 4
  i32.sub
  local.get $1
  i32.store
  local.get $10
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $11
   local.get $10
   i32.const 4
   i32.shr_u
   local.set $12
  else
   local.get $10
   local.tee $13
   i32.const 1073741820
   local.tee $14
   local.get $13
   local.get $14
   i32.lt_u
   select
   local.set $15
   i32.const 31
   local.get $15
   i32.clz
   i32.sub
   local.set $11
   local.get $15
   local.get $11
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $12
   local.get $11
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $11
  end
  i32.const 1
  drop
  local.get $11
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $12
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 480
   i32.const 251
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETHEAD|inlined.1 (result i32)
   local.get $0
   local.set $16
   local.get $11
   local.set $17
   local.get $12
   local.set $18
   local.get $16
   local.get $17
   i32.const 4
   i32.shl
   local.get $18
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
   br $~lib/rt/tlsf/GETHEAD|inlined.1
  end
  local.set $19
  local.get $1
  i32.const 0
  call $~lib/rt/tlsf/Block#set:prev
  local.get $1
  local.get $19
  call $~lib/rt/tlsf/Block#set:next
  local.get $19
  if
   local.get $19
   local.get $1
   call $~lib/rt/tlsf/Block#set:prev
  end
  local.get $0
  local.set $20
  local.get $11
  local.set $21
  local.get $12
  local.set $22
  local.get $1
  local.set $23
  local.get $20
  local.get $21
  i32.const 4
  i32.shl
  local.get $22
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.get $23
  i32.store offset=96
  local.get $0
  local.get $0
  call $~lib/rt/tlsf/Root#get:flMap
  i32.const 1
  local.get $11
  i32.shl
  i32.or
  call $~lib/rt/tlsf/Root#set:flMap
  local.get $0
  local.set $26
  local.get $11
  local.set $27
  block $~lib/rt/tlsf/GETSL|inlined.1 (result i32)
   local.get $0
   local.set $24
   local.get $11
   local.set $25
   local.get $24
   local.get $25
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=4
   br $~lib/rt/tlsf/GETSL|inlined.1
  end
  i32.const 1
  local.get $12
  i32.shl
  i32.or
  local.set $28
  local.get $26
  local.get $27
  i32.const 2
  i32.shl
  i32.add
  local.get $28
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/addMemory (param $0 i32) (param $1 i32) (param $2 i64) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  local.get $2
  i32.wrap_i64
  local.set $3
  i32.const 1
  drop
  local.get $1
  i64.extend_i32_u
  local.get $2
  i64.le_u
  i32.eqz
  if
   i32.const 0
   i32.const 480
   i32.const 382
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 4
  i32.add
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  i32.const 4
  i32.sub
  local.set $1
  local.get $3
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.set $3
  block $~lib/rt/tlsf/GETTAIL|inlined.0 (result i32)
   local.get $0
   local.set $4
   local.get $4
   i32.load offset=1568
   br $~lib/rt/tlsf/GETTAIL|inlined.0
  end
  local.set $5
  i32.const 0
  local.set $6
  local.get $5
  if
   i32.const 1
   drop
   local.get $1
   local.get $5
   i32.const 4
   i32.add
   i32.ge_u
   i32.eqz
   if
    i32.const 0
    i32.const 480
    i32.const 389
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   i32.const 16
   i32.sub
   local.get $5
   i32.eq
   if
    local.get $1
    i32.const 16
    i32.sub
    local.set $1
    local.get $5
    call $~lib/rt/common/BLOCK#get:mmInfo
    local.set $6
   else
   end
  else
   i32.const 1
   drop
   local.get $1
   local.get $0
   i32.const 1572
   i32.add
   i32.ge_u
   i32.eqz
   if
    i32.const 0
    i32.const 480
    i32.const 402
    i32.const 5
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $3
  local.get $1
  i32.sub
  local.set $7
  local.get $7
  i32.const 4
  i32.const 12
  i32.add
  i32.const 4
  i32.add
  i32.lt_u
  if
   i32.const 0
   return
  end
  local.get $7
  i32.const 2
  i32.const 4
  i32.mul
  i32.sub
  local.set $8
  local.get $1
  local.set $9
  local.get $9
  local.get $8
  i32.const 1
  i32.or
  local.get $6
  i32.const 2
  i32.and
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $9
  i32.const 0
  call $~lib/rt/tlsf/Block#set:prev
  local.get $9
  i32.const 0
  call $~lib/rt/tlsf/Block#set:next
  local.get $1
  i32.const 4
  i32.add
  local.get $8
  i32.add
  local.set $5
  local.get $5
  i32.const 0
  i32.const 2
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $0
  local.set $10
  local.get $5
  local.set $11
  local.get $10
  local.get $11
  i32.store offset=1568
  local.get $0
  local.get $9
  call $~lib/rt/tlsf/insertBlock
  i32.const 1
  return
 )
 (func $~lib/rt/tlsf/initialize
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  i32.const 0
  drop
  global.get $~lib/memory/__heap_base
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.set $0
  memory.size
  local.set $1
  local.get $0
  i32.const 1572
  i32.add
  i32.const 65535
  i32.add
  i32.const 65535
  i32.const -1
  i32.xor
  i32.and
  i32.const 16
  i32.shr_u
  local.set $2
  local.get $2
  local.get $1
  i32.gt_s
  if (result i32)
   local.get $2
   local.get $1
   i32.sub
   memory.grow
   i32.const 0
   i32.lt_s
  else
   i32.const 0
  end
  if
   unreachable
  end
  local.get $0
  local.set $3
  local.get $3
  i32.const 0
  call $~lib/rt/tlsf/Root#set:flMap
  local.get $3
  local.set $4
  i32.const 0
  local.set $5
  local.get $4
  local.get $5
  i32.store offset=1568
  i32.const 0
  local.set $6
  loop $for-loop|0
   local.get $6
   i32.const 23
   i32.lt_u
   if
    local.get $3
    local.set $7
    local.get $6
    local.set $8
    i32.const 0
    local.set $9
    local.get $7
    local.get $8
    i32.const 2
    i32.shl
    i32.add
    local.get $9
    i32.store offset=4
    i32.const 0
    local.set $10
    loop $for-loop|1
     local.get $10
     i32.const 16
     i32.lt_u
     if
      local.get $3
      local.set $11
      local.get $6
      local.set $12
      local.get $10
      local.set $13
      i32.const 0
      local.set $14
      local.get $11
      local.get $12
      i32.const 4
      i32.shl
      local.get $13
      i32.add
      i32.const 2
      i32.shl
      i32.add
      local.get $14
      i32.store offset=96
      local.get $10
      i32.const 1
      i32.add
      local.set $10
      br $for-loop|1
     end
    end
    local.get $6
    i32.const 1
    i32.add
    local.set $6
    br $for-loop|0
   end
  end
  local.get $0
  i32.const 1572
  i32.add
  local.set $15
  i32.const 0
  drop
  local.get $3
  local.get $15
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  drop
  local.get $3
  global.set $~lib/rt/tlsf/ROOT
 )
 (func $~lib/rt/tlsf/checkUsedBlock (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 4
  i32.sub
  local.set $1
  local.get $0
  i32.const 0
  i32.ne
  if (result i32)
   local.get $0
   i32.const 15
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  if (result i32)
   local.get $1
   call $~lib/rt/common/BLOCK#get:mmInfo
   i32.const 1
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 480
   i32.const 562
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  return
 )
 (func $~lib/rt/tlsf/freeBlock (param $0 i32) (param $1 i32)
  i32.const 0
  drop
  local.get $1
  local.get $1
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.const 1
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/tlsf/__free (param $0 i32)
  local.get $0
  global.get $~lib/memory/__heap_base
  i32.lt_u
  if
   return
  end
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.get $0
  call $~lib/rt/tlsf/checkUsedBlock
  call $~lib/rt/tlsf/freeBlock
 )
 (func $~lib/rt/itcms/free (param $0 i32)
  local.get $0
  global.get $~lib/memory/__heap_base
  i32.lt_u
  if
   local.get $0
   i32.const 0
   call $~lib/rt/itcms/Object#set:nextWithColor
   local.get $0
   i32.const 0
   call $~lib/rt/itcms/Object#set:prev
  else
   global.get $~lib/rt/itcms/total
   local.get $0
   call $~lib/rt/itcms/Object#get:size
   i32.sub
   global.set $~lib/rt/itcms/total
   i32.const 0
   drop
   local.get $0
   i32.const 4
   i32.add
   call $~lib/rt/tlsf/__free
  end
 )
 (func $~lib/rt/itcms/step (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  block $break|0
   block $case2|0
    block $case1|0
     block $case0|0
      global.get $~lib/rt/itcms/state
      local.set $1
      local.get $1
      i32.const 0
      i32.eq
      br_if $case0|0
      local.get $1
      i32.const 1
      i32.eq
      br_if $case1|0
      local.get $1
      i32.const 2
      i32.eq
      br_if $case2|0
      br $break|0
     end
     i32.const 1
     global.set $~lib/rt/itcms/state
     i32.const 0
     global.set $~lib/rt/itcms/visitCount
     i32.const 0
     call $~lib/rt/itcms/visitRoots
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/iter
     global.get $~lib/rt/itcms/visitCount
     i32.const 1
     i32.mul
     return
    end
    global.get $~lib/rt/itcms/white
    i32.eqz
    local.set $2
    global.get $~lib/rt/itcms/iter
    call $~lib/rt/itcms/Object#get:next
    local.set $0
    loop $while-continue|1
     local.get $0
     global.get $~lib/rt/itcms/toSpace
     i32.ne
     if
      local.get $0
      global.set $~lib/rt/itcms/iter
      local.get $0
      call $~lib/rt/itcms/Object#get:color
      local.get $2
      i32.ne
      if
       local.get $0
       local.get $2
       call $~lib/rt/itcms/Object#set:color
       i32.const 0
       global.set $~lib/rt/itcms/visitCount
       local.get $0
       i32.const 20
       i32.add
       i32.const 0
       call $~lib/rt/__visit_members
       global.get $~lib/rt/itcms/visitCount
       i32.const 1
       i32.mul
       return
      end
      local.get $0
      call $~lib/rt/itcms/Object#get:next
      local.set $0
      br $while-continue|1
     end
    end
    i32.const 0
    global.set $~lib/rt/itcms/visitCount
    i32.const 0
    call $~lib/rt/itcms/visitRoots
    global.get $~lib/rt/itcms/iter
    call $~lib/rt/itcms/Object#get:next
    local.set $0
    local.get $0
    global.get $~lib/rt/itcms/toSpace
    i32.eq
    if
     i32.const 0
     call $~lib/rt/itcms/visitStack
     global.get $~lib/rt/itcms/iter
     call $~lib/rt/itcms/Object#get:next
     local.set $0
     loop $while-continue|2
      local.get $0
      global.get $~lib/rt/itcms/toSpace
      i32.ne
      if
       local.get $0
       call $~lib/rt/itcms/Object#get:color
       local.get $2
       i32.ne
       if
        local.get $0
        local.get $2
        call $~lib/rt/itcms/Object#set:color
        local.get $0
        i32.const 20
        i32.add
        i32.const 0
        call $~lib/rt/__visit_members
       end
       local.get $0
       call $~lib/rt/itcms/Object#get:next
       local.set $0
       br $while-continue|2
      end
     end
     global.get $~lib/rt/itcms/fromSpace
     local.set $3
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/fromSpace
     local.get $3
     global.set $~lib/rt/itcms/toSpace
     local.get $2
     global.set $~lib/rt/itcms/white
     local.get $3
     call $~lib/rt/itcms/Object#get:next
     global.set $~lib/rt/itcms/iter
     i32.const 2
     global.set $~lib/rt/itcms/state
    end
    global.get $~lib/rt/itcms/visitCount
    i32.const 1
    i32.mul
    return
   end
   global.get $~lib/rt/itcms/iter
   local.set $0
   local.get $0
   global.get $~lib/rt/itcms/toSpace
   i32.ne
   if
    local.get $0
    call $~lib/rt/itcms/Object#get:next
    global.set $~lib/rt/itcms/iter
    i32.const 1
    drop
    local.get $0
    call $~lib/rt/itcms/Object#get:color
    global.get $~lib/rt/itcms/white
    i32.eqz
    i32.eq
    i32.eqz
    if
     i32.const 0
     i32.const 208
     i32.const 229
     i32.const 20
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    call $~lib/rt/itcms/free
    i32.const 10
    return
   end
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   call $~lib/rt/itcms/Object#set:nextWithColor
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   call $~lib/rt/itcms/Object#set:prev
   i32.const 0
   global.set $~lib/rt/itcms/state
   br $break|0
  end
  i32.const 0
  return
 )
 (func $~lib/rt/itcms/interrupt
  (local $0 i32)
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 1024
  i32.const 200
  i32.mul
  i32.const 100
  i32.div_u
  local.set $0
  loop $do-loop|0
   local.get $0
   call $~lib/rt/itcms/step
   i32.sub
   local.set $0
   global.get $~lib/rt/itcms/state
   i32.const 0
   i32.eq
   if
    i32.const 0
    drop
    global.get $~lib/rt/itcms/total
    i64.extend_i32_u
    i32.const 200
    i64.extend_i32_u
    i64.mul
    i64.const 100
    i64.div_u
    i32.wrap_i64
    i32.const 1024
    i32.add
    global.set $~lib/rt/itcms/threshold
    i32.const 0
    drop
    return
   end
   local.get $0
   i32.const 0
   i32.gt_s
   br_if $do-loop|0
  end
  i32.const 0
  drop
  global.get $~lib/rt/itcms/total
  i32.const 1024
  global.get $~lib/rt/itcms/total
  global.get $~lib/rt/itcms/threshold
  i32.sub
  i32.const 1024
  i32.lt_u
  i32.mul
  i32.add
  global.set $~lib/rt/itcms/threshold
  i32.const 0
  drop
 )
 (func $~lib/rt/tlsf/computeSize (param $0 i32) (result i32)
  local.get $0
  i32.const 12
  i32.le_u
  if (result i32)
   i32.const 12
  else
   local.get $0
   i32.const 4
   i32.add
   i32.const 15
   i32.add
   i32.const 15
   i32.const -1
   i32.xor
   i32.and
   i32.const 4
   i32.sub
  end
  return
 )
 (func $~lib/rt/tlsf/prepareSize (param $0 i32) (result i32)
  local.get $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 144
   i32.const 480
   i32.const 461
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $~lib/rt/tlsf/computeSize
  return
 )
 (func $~lib/rt/tlsf/roundSize (param $0 i32) (result i32)
  local.get $0
  i32.const 536870910
  i32.lt_u
  if (result i32)
   local.get $0
   i32.const 1
   i32.const 27
   local.get $0
   i32.clz
   i32.sub
   i32.shl
   i32.add
   i32.const 1
   i32.sub
  else
   local.get $0
  end
  return
 )
 (func $~lib/rt/tlsf/searchBlock (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  local.get $1
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $2
   local.get $1
   i32.const 4
   i32.shr_u
   local.set $3
  else
   local.get $1
   call $~lib/rt/tlsf/roundSize
   local.set $4
   i32.const 4
   i32.const 8
   i32.mul
   i32.const 1
   i32.sub
   local.get $4
   i32.clz
   i32.sub
   local.set $2
   local.get $4
   local.get $2
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $3
   local.get $2
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $2
  end
  i32.const 1
  drop
  local.get $2
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $3
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 480
   i32.const 334
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETSL|inlined.2 (result i32)
   local.get $0
   local.set $5
   local.get $2
   local.set $6
   local.get $5
   local.get $6
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=4
   br $~lib/rt/tlsf/GETSL|inlined.2
  end
  i32.const 0
  i32.const -1
  i32.xor
  local.get $3
  i32.shl
  i32.and
  local.set $7
  i32.const 0
  local.set $8
  local.get $7
  i32.eqz
  if
   local.get $0
   call $~lib/rt/tlsf/Root#get:flMap
   i32.const 0
   i32.const -1
   i32.xor
   local.get $2
   i32.const 1
   i32.add
   i32.shl
   i32.and
   local.set $9
   local.get $9
   i32.eqz
   if
    i32.const 0
    local.set $8
   else
    local.get $9
    i32.ctz
    local.set $2
    block $~lib/rt/tlsf/GETSL|inlined.3 (result i32)
     local.get $0
     local.set $10
     local.get $2
     local.set $11
     local.get $10
     local.get $11
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=4
     br $~lib/rt/tlsf/GETSL|inlined.3
    end
    local.set $7
    i32.const 1
    drop
    local.get $7
    i32.eqz
    if
     i32.const 0
     i32.const 480
     i32.const 347
     i32.const 18
     call $~lib/builtins/abort
     unreachable
    end
    block $~lib/rt/tlsf/GETHEAD|inlined.2 (result i32)
     local.get $0
     local.set $12
     local.get $2
     local.set $13
     local.get $7
     i32.ctz
     local.set $14
     local.get $12
     local.get $13
     i32.const 4
     i32.shl
     local.get $14
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=96
     br $~lib/rt/tlsf/GETHEAD|inlined.2
    end
    local.set $8
   end
  else
   block $~lib/rt/tlsf/GETHEAD|inlined.3 (result i32)
    local.get $0
    local.set $15
    local.get $2
    local.set $16
    local.get $7
    i32.ctz
    local.set $17
    local.get $15
    local.get $16
    i32.const 4
    i32.shl
    local.get $17
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
    br $~lib/rt/tlsf/GETHEAD|inlined.3
   end
   local.set $8
  end
  local.get $8
  return
 )
 (func $~lib/rt/tlsf/growMemory (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  i32.const 0
  drop
  local.get $1
  i32.const 256
  i32.ge_u
  if
   local.get $1
   call $~lib/rt/tlsf/roundSize
   local.set $1
  end
  memory.size
  local.set $2
  local.get $1
  i32.const 4
  local.get $2
  i32.const 16
  i32.shl
  i32.const 4
  i32.sub
  block $~lib/rt/tlsf/GETTAIL|inlined.1 (result i32)
   local.get $0
   local.set $3
   local.get $3
   i32.load offset=1568
   br $~lib/rt/tlsf/GETTAIL|inlined.1
  end
  i32.ne
  i32.shl
  i32.add
  local.set $1
  local.get $1
  i32.const 65535
  i32.add
  i32.const 65535
  i32.const -1
  i32.xor
  i32.and
  i32.const 16
  i32.shr_u
  local.set $4
  local.get $2
  local.tee $5
  local.get $4
  local.tee $6
  local.get $5
  local.get $6
  i32.gt_s
  select
  local.set $7
  local.get $7
  memory.grow
  i32.const 0
  i32.lt_s
  if
   local.get $4
   memory.grow
   i32.const 0
   i32.lt_s
   if
    unreachable
   end
  end
  memory.size
  local.set $8
  local.get $0
  local.get $2
  i32.const 16
  i32.shl
  local.get $8
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  drop
 )
 (func $~lib/rt/tlsf/prepareBlock (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $1
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $3
  i32.const 1
  drop
  local.get $2
  i32.const 4
  i32.add
  i32.const 15
  i32.and
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 480
   i32.const 361
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $2
  i32.sub
  local.set $4
  local.get $4
  i32.const 4
  i32.const 12
  i32.add
  i32.ge_u
  if
   local.get $1
   local.get $2
   local.get $3
   i32.const 2
   i32.and
   i32.or
   call $~lib/rt/common/BLOCK#set:mmInfo
   local.get $1
   i32.const 4
   i32.add
   local.get $2
   i32.add
   local.set $5
   local.get $5
   local.get $4
   i32.const 4
   i32.sub
   i32.const 1
   i32.or
   call $~lib/rt/common/BLOCK#set:mmInfo
   local.get $0
   local.get $5
   call $~lib/rt/tlsf/insertBlock
  else
   local.get $1
   local.get $3
   i32.const 1
   i32.const -1
   i32.xor
   i32.and
   call $~lib/rt/common/BLOCK#set:mmInfo
   block $~lib/rt/tlsf/GETRIGHT|inlined.3 (result i32)
    local.get $1
    local.set $7
    local.get $7
    i32.const 4
    i32.add
    local.get $7
    call $~lib/rt/common/BLOCK#get:mmInfo
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
    br $~lib/rt/tlsf/GETRIGHT|inlined.3
   end
   block $~lib/rt/tlsf/GETRIGHT|inlined.2 (result i32)
    local.get $1
    local.set $6
    local.get $6
    i32.const 4
    i32.add
    local.get $6
    call $~lib/rt/common/BLOCK#get:mmInfo
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
    br $~lib/rt/tlsf/GETRIGHT|inlined.2
   end
   call $~lib/rt/common/BLOCK#get:mmInfo
   i32.const 2
   i32.const -1
   i32.xor
   i32.and
   call $~lib/rt/common/BLOCK#set:mmInfo
  end
 )
 (func $~lib/rt/tlsf/allocateBlock (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/tlsf/prepareSize
  local.set $2
  local.get $0
  local.get $2
  call $~lib/rt/tlsf/searchBlock
  local.set $3
  local.get $3
  i32.eqz
  if
   local.get $0
   local.get $2
   call $~lib/rt/tlsf/growMemory
   local.get $0
   local.get $2
   call $~lib/rt/tlsf/searchBlock
   local.set $3
   i32.const 1
   drop
   local.get $3
   i32.eqz
   if
    i32.const 0
    i32.const 480
    i32.const 499
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
  end
  i32.const 1
  drop
  local.get $3
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $2
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 480
   i32.const 501
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $3
  call $~lib/rt/tlsf/removeBlock
  local.get $0
  local.get $3
  local.get $2
  call $~lib/rt/tlsf/prepareBlock
  i32.const 0
  drop
  local.get $3
  return
 )
 (func $~lib/rt/tlsf/__alloc (param $0 i32) (result i32)
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.get $0
  call $~lib/rt/tlsf/allocateBlock
  i32.const 4
  i32.add
  return
 )
 (func $~lib/rt/itcms/Object#set:rtId (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=12
 )
 (func $~lib/rt/itcms/Object#set:rtSize (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=16
 )
 (func $~lib/rt/itcms/__new (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.const 1073741804
  i32.ge_u
  if
   i32.const 144
   i32.const 208
   i32.const 261
   i32.const 31
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/total
  global.get $~lib/rt/itcms/threshold
  i32.ge_u
  if
   call $~lib/rt/itcms/interrupt
  end
  i32.const 16
  local.get $0
  i32.add
  call $~lib/rt/tlsf/__alloc
  i32.const 4
  i32.sub
  local.set $2
  local.get $2
  local.get $1
  call $~lib/rt/itcms/Object#set:rtId
  local.get $2
  local.get $0
  call $~lib/rt/itcms/Object#set:rtSize
  local.get $2
  global.get $~lib/rt/itcms/fromSpace
  global.get $~lib/rt/itcms/white
  call $~lib/rt/itcms/Object#linkTo
  global.get $~lib/rt/itcms/total
  local.get $2
  call $~lib/rt/itcms/Object#get:size
  i32.add
  global.set $~lib/rt/itcms/total
  local.get $2
  i32.const 20
  i32.add
  local.set $3
  local.get $3
  i32.const 0
  local.get $0
  memory.fill
  local.get $3
  return
 )
 (func $~lib/rt/itcms/__link (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.eqz
  if
   return
  end
  i32.const 1
  drop
  local.get $0
  i32.eqz
  if
   i32.const 0
   i32.const 208
   i32.const 295
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 20
  i32.sub
  local.set $3
  local.get $3
  call $~lib/rt/itcms/Object#get:color
  global.get $~lib/rt/itcms/white
  i32.eq
  if
   local.get $0
   i32.const 20
   i32.sub
   local.set $4
   local.get $4
   call $~lib/rt/itcms/Object#get:color
   local.set $5
   local.get $5
   global.get $~lib/rt/itcms/white
   i32.eqz
   i32.eq
   if
    local.get $2
    if
     local.get $4
     call $~lib/rt/itcms/Object#makeGray
    else
     local.get $3
     call $~lib/rt/itcms/Object#makeGray
    end
   else
    local.get $5
    i32.const 3
    i32.eq
    if (result i32)
     global.get $~lib/rt/itcms/state
     i32.const 1
     i32.eq
    else
     i32.const 0
    end
    if
     local.get $3
     call $~lib/rt/itcms/Object#makeGray
    end
   end
  end
 )
 (func $~lib/arraybuffer/ArrayBufferView#set:buffer (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/arraybuffer/ArrayBufferView#set:dataStart (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=4
 )
 (func $~lib/arraybuffer/ArrayBufferView#set:byteLength (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=8
 )
 (func $start:assembly/index
  memory.size
  i32.const 16
  i32.shl
  global.get $~lib/memory/__heap_base
  i32.sub
  i32.const 1
  i32.shr_u
  global.set $~lib/rt/itcms/threshold
  i32.const 256
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/pinSpace
  i32.const 288
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/toSpace
  i32.const 432
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/fromSpace
  i32.const 0
  i32.const 0
  call $~lib/typedarray/Float64Array#constructor
  global.set $assembly/index/candleData
  i32.const 0
  i32.const 0
  call $~lib/typedarray/Float64Array#constructor
  global.set $assembly/index/workData
  i32.const 0
  i32.const 0
  call $~lib/typedarray/Float32Array#constructor
  global.set $assembly/index/triVerts
  i32.const 0
  i32.const 0
  call $~lib/typedarray/Float32Array#constructor
  global.set $assembly/index/lineVerts
 )
 (func $assembly/index/getPriceMin (result f64)
  global.get $assembly/index/priceMin
  return
 )
 (func $assembly/index/getPriceMax (result f64)
  global.get $assembly/index/priceMax
  return
 )
 (func $assembly/index/getTriVertexCount (result i32)
  global.get $assembly/index/triCount
  return
 )
 (func $assembly/index/getLineVertexCount (result i32)
  global.get $assembly/index/lineCount
  return
 )
 (func $assembly/index/getCandleCount (result i32)
  global.get $assembly/index/candleCount
  return
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:buffer (param $0 i32) (result i32)
  local.get $0
  i32.load
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:dataStart (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:byteLength (param $0 i32) (result i32)
  local.get $0
  i32.load offset=8
 )
 (func $assembly/index/reserveCandles (param $0 i32) (result i32)
  local.get $0
  call $assembly/index/ensureCandles
  local.get $0
  global.set $assembly/index/candleCount
  call $assembly/index/candleDataPtr
  return
 )
 (func $assembly/index/setCandleCount (param $0 i32)
  local.get $0
  call $assembly/index/ensureCandles
  local.get $0
  global.set $assembly/index/candleCount
 )
 (func $assembly/index/ensureWork (param $0 i32)
  (local $1 i32)
  local.get $0
  global.get $assembly/index/workCap
  i32.le_s
  if
   return
  end
  global.get $assembly/index/workCap
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 256
  else
   global.get $assembly/index/workCap
  end
  local.set $1
  loop $while-continue|0
   local.get $1
   local.get $0
   i32.lt_s
   if
    local.get $1
    i32.const 1
    i32.shl
    local.set $1
    br $while-continue|0
   end
  end
  i32.const 0
  local.get $1
  global.get $assembly/index/STRIDE
  i32.mul
  call $~lib/typedarray/Float64Array#constructor
  global.set $assembly/index/workData
  local.get $1
  global.set $assembly/index/workCap
 )
 (func $assembly/index/ensureLines (param $0 i32)
  (local $1 i32)
  local.get $0
  global.get $assembly/index/lineCap
  i32.le_s
  if
   return
  end
  global.get $assembly/index/lineCap
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 1024
  else
   global.get $assembly/index/lineCap
  end
  local.set $1
  loop $while-continue|0
   local.get $1
   local.get $0
   i32.lt_s
   if
    local.get $1
    i32.const 1
    i32.shl
    local.set $1
    br $while-continue|0
   end
  end
  i32.const 0
  local.get $1
  global.get $assembly/index/VERT_STRIDE
  i32.mul
  call $~lib/typedarray/Float32Array#constructor
  global.set $assembly/index/lineVerts
  local.get $1
  global.set $assembly/index/lineCap
 )
 (func $assembly/index/ensureTris (param $0 i32)
  (local $1 i32)
  local.get $0
  global.get $assembly/index/triCap
  i32.le_s
  if
   return
  end
  global.get $assembly/index/triCap
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 1024
  else
   global.get $assembly/index/triCap
  end
  local.set $1
  loop $while-continue|0
   local.get $1
   local.get $0
   i32.lt_s
   if
    local.get $1
    i32.const 1
    i32.shl
    local.set $1
    br $while-continue|0
   end
  end
  i32.const 0
  local.get $1
  global.get $assembly/index/VERT_STRIDE
  i32.mul
  call $~lib/typedarray/Float32Array#constructor
  global.set $assembly/index/triVerts
  local.get $1
  global.set $assembly/index/triCap
 )
 (func $assembly/index/pushQuad (param $0 f32) (param $1 f32) (param $2 f32) (param $3 f32) (param $4 f32) (param $5 f32) (param $6 f32)
  local.get $0
  local.get $1
  local.get $4
  local.get $5
  local.get $6
  call $assembly/index/pushTri
  local.get $2
  local.get $1
  local.get $4
  local.get $5
  local.get $6
  call $assembly/index/pushTri
  local.get $0
  local.get $3
  local.get $4
  local.get $5
  local.get $6
  call $assembly/index/pushTri
  local.get $2
  local.get $1
  local.get $4
  local.get $5
  local.get $6
  call $assembly/index/pushTri
  local.get $2
  local.get $3
  local.get $4
  local.get $5
  local.get $6
  call $assembly/index/pushTri
  local.get $0
  local.get $3
  local.get $4
  local.get $5
  local.get $6
  call $assembly/index/pushTri
 )
 (func $assembly/index/buildGeometry@varargs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 f32) (param $4 f32) (param $5 f32) (param $6 f32) (param $7 f32) (param $8 f64) (param $9 f32) (result i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 9
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   f32.const 1
   local.set $9
  end
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  local.get $4
  local.get $5
  local.get $6
  local.get $7
  local.get $8
  local.get $9
  call $assembly/index/buildGeometry
 )
 (func $assembly/index/hitTest (param $0 f32) (param $1 f32) (param $2 f32) (param $3 i32) (param $4 i32) (result i32)
  (local $5 f64)
  (local $6 i32)
  local.get $2
  f32.const 0
  f32.le
  if (result i32)
   i32.const 1
  else
   local.get $4
   i32.const 0
   i32.le_s
  end
  if
   i32.const -1
   return
  end
  local.get $0
  local.get $1
  f32.lt
  if
   i32.const -1
   return
  end
  block $~lib/math/NativeMath.floor|inlined.0 (result f64)
   local.get $0
   local.get $1
   f32.sub
   local.get $2
   f32.div
   f64.promote_f32
   local.set $5
   local.get $5
   f64.floor
   br $~lib/math/NativeMath.floor|inlined.0
  end
  i32.trunc_sat_f64_s
  local.set $6
  local.get $6
  i32.const 0
  i32.lt_s
  if (result i32)
   i32.const 1
  else
   local.get $6
   local.get $4
   i32.ge_s
  end
  if
   i32.const -1
   return
  end
  local.get $3
  local.get $6
  i32.add
  return
 )
 (func $assembly/index/visibleWindow (param $0 i32) (param $1 i32) (param $2 f32) (result i64)
  (local $3 f64)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  block $~lib/math/NativeMath.floor|inlined.1 (result f64)
   local.get $2
   f64.promote_f32
   local.set $3
   local.get $3
   f64.floor
   br $~lib/math/NativeMath.floor|inlined.1
  end
  i32.trunc_sat_f64_s
  i32.sub
  local.set $4
  local.get $4
  i32.const 0
  i32.lt_s
  if
   i32.const 0
   local.set $4
  end
  local.get $4
  local.get $0
  i32.gt_s
  if
   local.get $0
   local.set $4
  end
  local.get $4
  local.get $1
  i32.sub
  local.set $5
  local.get $5
  i32.const 0
  i32.lt_s
  if
   i32.const 0
   local.set $5
  end
  local.get $5
  i64.extend_i32_s
  i64.const 32
  i64.shl
  local.get $4
  i64.extend_i32_u
  i64.or
  return
 )
 (func $~lib/rt/itcms/__pin (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  if
   local.get $0
   i32.const 20
   i32.sub
   local.set $1
   local.get $1
   call $~lib/rt/itcms/Object#get:color
   i32.const 3
   i32.eq
   if
    i32.const 608
    i32.const 208
    i32.const 338
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   call $~lib/rt/itcms/Object#unlink
   local.get $1
   global.get $~lib/rt/itcms/pinSpace
   i32.const 3
   call $~lib/rt/itcms/Object#linkTo
  end
  local.get $0
  return
 )
 (func $~lib/rt/itcms/__unpin (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  local.get $0
  i32.const 20
  i32.sub
  local.set $1
  local.get $1
  call $~lib/rt/itcms/Object#get:color
  i32.const 3
  i32.ne
  if
   i32.const 672
   i32.const 208
   i32.const 352
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/state
  i32.const 1
  i32.eq
  if
   local.get $1
   call $~lib/rt/itcms/Object#makeGray
  else
   local.get $1
   call $~lib/rt/itcms/Object#unlink
   local.get $1
   global.get $~lib/rt/itcms/fromSpace
   global.get $~lib/rt/itcms/white
   call $~lib/rt/itcms/Object#linkTo
  end
 )
 (func $~lib/rt/itcms/__collect
  i32.const 0
  drop
  global.get $~lib/rt/itcms/state
  i32.const 0
  i32.gt_s
  if
   loop $while-continue|0
    global.get $~lib/rt/itcms/state
    i32.const 0
    i32.ne
    if
     call $~lib/rt/itcms/step
     drop
     br $while-continue|0
    end
   end
  end
  call $~lib/rt/itcms/step
  drop
  loop $while-continue|1
   global.get $~lib/rt/itcms/state
   i32.const 0
   i32.ne
   if
    call $~lib/rt/itcms/step
    drop
    br $while-continue|1
   end
  end
  global.get $~lib/rt/itcms/total
  i64.extend_i32_u
  i32.const 200
  i64.extend_i32_u
  i64.mul
  i64.const 100
  i64.div_u
  i32.wrap_i64
  i32.const 1024
  i32.add
  global.set $~lib/rt/itcms/threshold
  i32.const 0
  drop
  i32.const 0
  drop
 )
 (func $~lib/rt/__visit_globals (param $0 i32)
  (local $1 i32)
  global.get $assembly/index/candleData
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $assembly/index/workData
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $assembly/index/triVerts
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $assembly/index/lineVerts
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  i32.const 336
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 32
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 144
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 608
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 672
  local.get $0
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/arraybuffer/ArrayBufferView~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load
  local.tee $2
  if
   local.get $2
   local.get $1
   call $~lib/rt/itcms/__visit
  end
 )
 (func $~lib/object/Object~visit (param $0 i32) (param $1 i32)
 )
 (func $~lib/typedarray/Float64Array~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/arraybuffer/ArrayBufferView~visit
 )
 (func $~lib/typedarray/Float32Array~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/arraybuffer/ArrayBufferView~visit
 )
 (func $~lib/rt/__visit_members (param $0 i32) (param $1 i32)
  block $invalid
   block $~lib/typedarray/Float32Array
    block $~lib/typedarray/Float64Array
     block $~lib/arraybuffer/ArrayBufferView
      block $~lib/string/String
       block $~lib/arraybuffer/ArrayBuffer
        block $~lib/object/Object
         local.get $0
         i32.const 8
         i32.sub
         i32.load
         br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $~lib/arraybuffer/ArrayBufferView $~lib/typedarray/Float64Array $~lib/typedarray/Float32Array $invalid
        end
        return
       end
       return
      end
      return
     end
     local.get $0
     local.get $1
     call $~lib/arraybuffer/ArrayBufferView~visit
     return
    end
    local.get $0
    local.get $1
    call $~lib/typedarray/Float64Array~visit
    return
   end
   local.get $0
   local.get $1
   call $~lib/typedarray/Float32Array~visit
   return
  end
  unreachable
 )
 (func $~setArgumentsLength (param $0 i32)
  local.get $0
  global.set $~argumentsLength
 )
 (func $~start
  call $start:assembly/index
 )
 (func $~stack_check
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__data_end
  i32.lt_s
  if
   i32.const 33536
   i32.const 33584
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $~lib/arraybuffer/ArrayBufferView#constructor (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.const 3
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
  end
  local.get $0
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#set:buffer
  local.get $0
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#set:dataStart
  local.get $0
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#set:byteLength
  local.get $1
  i32.const 1073741820
  local.get $2
  i32.shr_u
  i32.gt_u
  if
   i32.const 32
   i32.const 80
   i32.const 19
   i32.const 57
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $1
  local.get $2
  i32.shl
  local.tee $1
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $3
  i32.store offset=8
  i32.const 2
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $0
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $3
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=12
  local.get $4
  call $~lib/arraybuffer/ArrayBufferView#set:buffer
  local.get $0
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $3
  call $~lib/arraybuffer/ArrayBufferView#set:dataStart
  local.get $0
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $1
  call $~lib/arraybuffer/ArrayBufferView#set:byteLength
  local.get $0
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
 )
 (func $~lib/typedarray/Float64Array#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $0
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.const 4
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $1
  i32.const 3
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $0
  i32.store
  local.get $0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/typedarray/Float32Array#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $0
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.const 5
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $1
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $0
  i32.store
  local.get $0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:byteOffset (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $0
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $~lib/arraybuffer/ArrayBufferView#get:dataStart
  local.get $0
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $~lib/arraybuffer/ArrayBufferView#get:buffer
  i32.sub
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $assembly/index/candleDataPtr (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $assembly/index/candleData
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:buffer
  global.get $assembly/index/candleData
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteOffset
  i32.add
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $assembly/index/triVertsPtr (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $assembly/index/triVerts
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:buffer
  global.get $assembly/index/triVerts
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteOffset
  i32.add
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $assembly/index/lineVertsPtr (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $assembly/index/lineVerts
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:buffer
  global.get $assembly/index/lineVerts
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteOffset
  i32.add
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $~lib/typedarray/Float64Array#__get (param $0 i32) (param $1 i32) (result f64)
  (local $2 i32)
  (local $3 f64)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $1
  local.get $0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
  i32.ge_u
  if
   i32.const 336
   i32.const 544
   i32.const 1446
   i32.const 64
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/arraybuffer/ArrayBufferView#get:dataStart
  local.get $1
  i32.const 3
  i32.shl
  i32.add
  f64.load
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $~lib/typedarray/Float64Array#__set (param $0 i32) (param $1 i32) (param $2 f64)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $1
  local.get $0
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
  i32.ge_u
  if
   i32.const 336
   i32.const 544
   i32.const 1457
   i32.const 64
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/arraybuffer/ArrayBufferView#get:dataStart
  local.get $1
  i32.const 3
  i32.shl
  i32.add
  local.get $2
  f64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/index/ensureCandles (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $0
  global.get $assembly/index/candleCap
  i32.le_s
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $assembly/index/candleCap
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 256
  else
   global.get $assembly/index/candleCap
  end
  local.set $1
  loop $while-continue|0
   local.get $1
   local.get $0
   i32.lt_s
   if
    local.get $1
    i32.const 1
    i32.shl
    local.set $1
    br $while-continue|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  local.get $1
  global.get $assembly/index/STRIDE
  i32.mul
  call $~lib/typedarray/Float64Array#constructor
  local.tee $2
  i32.store
  i32.const 0
  local.set $3
  loop $for-loop|1
   local.get $3
   global.get $assembly/index/candleCount
   global.get $assembly/index/STRIDE
   i32.mul
   i32.lt_s
   if
    local.get $2
    local.set $4
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=4
    local.get $4
    local.get $3
    global.get $assembly/index/candleData
    local.set $4
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=8
    local.get $4
    local.get $3
    call $~lib/typedarray/Float64Array#__get
    call $~lib/typedarray/Float64Array#__set
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|1
   end
  end
  local.get $2
  global.set $assembly/index/candleData
  local.get $1
  global.set $assembly/index/candleCap
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/index/setCandle (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (param $4 f64) (param $5 f64) (param $6 f64)
  (local $7 i32)
  (local $8 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $0
  i32.const 1
  i32.add
  call $assembly/index/ensureCandles
  local.get $0
  i32.const 1
  i32.add
  global.get $assembly/index/candleCount
  i32.gt_s
  if
   local.get $0
   i32.const 1
   i32.add
   global.set $assembly/index/candleCount
  end
  local.get $0
  global.get $assembly/index/STRIDE
  i32.mul
  local.set $7
  global.get $assembly/index/candleData
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $7
  local.get $1
  call $~lib/typedarray/Float64Array#__set
  global.get $assembly/index/candleData
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $7
  i32.const 1
  i32.add
  local.get $2
  call $~lib/typedarray/Float64Array#__set
  global.get $assembly/index/candleData
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $7
  i32.const 2
  i32.add
  local.get $3
  call $~lib/typedarray/Float64Array#__set
  global.get $assembly/index/candleData
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $7
  i32.const 3
  i32.add
  local.get $4
  call $~lib/typedarray/Float64Array#__set
  global.get $assembly/index/candleData
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $7
  i32.const 4
  i32.add
  local.get $5
  call $~lib/typedarray/Float64Array#__set
  global.get $assembly/index/candleData
  local.set $8
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store
  local.get $8
  local.get $7
  i32.const 5
  i32.add
  local.get $6
  call $~lib/typedarray/Float64Array#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/index/copyRawToWork (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $1
  local.get $0
  i32.sub
  local.set $2
  local.get $2
  call $assembly/index/ensureWork
  i32.const 0
  local.set $3
  loop $for-loop|0
   local.get $3
   local.get $2
   i32.lt_s
   if
    local.get $0
    local.get $3
    i32.add
    global.get $assembly/index/STRIDE
    i32.mul
    local.set $4
    local.get $3
    global.get $assembly/index/STRIDE
    i32.mul
    local.set $5
    global.get $assembly/index/workData
    local.set $6
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store
    local.get $6
    local.get $5
    global.get $assembly/index/candleData
    local.set $6
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store offset=4
    local.get $6
    local.get $4
    call $~lib/typedarray/Float64Array#__get
    call $~lib/typedarray/Float64Array#__set
    global.get $assembly/index/workData
    local.set $6
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store
    local.get $6
    local.get $5
    i32.const 1
    i32.add
    global.get $assembly/index/candleData
    local.set $6
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store offset=4
    local.get $6
    local.get $4
    i32.const 1
    i32.add
    call $~lib/typedarray/Float64Array#__get
    call $~lib/typedarray/Float64Array#__set
    global.get $assembly/index/workData
    local.set $6
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store
    local.get $6
    local.get $5
    i32.const 2
    i32.add
    global.get $assembly/index/candleData
    local.set $6
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store offset=4
    local.get $6
    local.get $4
    i32.const 2
    i32.add
    call $~lib/typedarray/Float64Array#__get
    call $~lib/typedarray/Float64Array#__set
    global.get $assembly/index/workData
    local.set $6
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store
    local.get $6
    local.get $5
    i32.const 3
    i32.add
    global.get $assembly/index/candleData
    local.set $6
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store offset=4
    local.get $6
    local.get $4
    i32.const 3
    i32.add
    call $~lib/typedarray/Float64Array#__get
    call $~lib/typedarray/Float64Array#__set
    global.get $assembly/index/workData
    local.set $6
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store
    local.get $6
    local.get $5
    i32.const 4
    i32.add
    global.get $assembly/index/candleData
    local.set $6
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store offset=4
    local.get $6
    local.get $4
    i32.const 4
    i32.add
    call $~lib/typedarray/Float64Array#__get
    call $~lib/typedarray/Float64Array#__set
    global.get $assembly/index/workData
    local.set $6
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store
    local.get $6
    local.get $5
    i32.const 5
    i32.add
    global.get $assembly/index/candleData
    local.set $6
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store offset=4
    local.get $6
    local.get $4
    i32.const 5
    i32.add
    call $~lib/typedarray/Float64Array#__get
    call $~lib/typedarray/Float64Array#__set
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  local.get $2
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
  return
 )
 (func $assembly/index/toHeikenAshi (param $0 i32)
  (local $1 f64)
  (local $2 f64)
  (local $3 i32)
  (local $4 i32)
  (local $5 f64)
  (local $6 f64)
  (local $7 f64)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  (local $11 f64)
  (local $12 f64)
  (local $13 f64)
  (local $14 f64)
  (local $15 f64)
  (local $16 f64)
  (local $17 f64)
  (local $18 f64)
  (local $19 f64)
  (local $20 f64)
  (local $21 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.le_s
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $assembly/index/workData
  local.set $21
  global.get $~lib/memory/__stack_pointer
  local.get $21
  i32.store
  local.get $21
  i32.const 1
  call $~lib/typedarray/Float64Array#__get
  global.get $assembly/index/workData
  local.set $21
  global.get $~lib/memory/__stack_pointer
  local.get $21
  i32.store
  local.get $21
  i32.const 4
  call $~lib/typedarray/Float64Array#__get
  f64.add
  f64.const 0.5
  f64.mul
  local.set $1
  global.get $assembly/index/workData
  local.set $21
  global.get $~lib/memory/__stack_pointer
  local.get $21
  i32.store
  local.get $21
  i32.const 1
  call $~lib/typedarray/Float64Array#__get
  global.get $assembly/index/workData
  local.set $21
  global.get $~lib/memory/__stack_pointer
  local.get $21
  i32.store
  local.get $21
  i32.const 2
  call $~lib/typedarray/Float64Array#__get
  f64.add
  global.get $assembly/index/workData
  local.set $21
  global.get $~lib/memory/__stack_pointer
  local.get $21
  i32.store
  local.get $21
  i32.const 3
  call $~lib/typedarray/Float64Array#__get
  f64.add
  global.get $assembly/index/workData
  local.set $21
  global.get $~lib/memory/__stack_pointer
  local.get $21
  i32.store
  local.get $21
  i32.const 4
  call $~lib/typedarray/Float64Array#__get
  f64.add
  f64.const 0.25
  f64.mul
  local.set $2
  i32.const 0
  local.set $3
  loop $for-loop|0
   local.get $3
   local.get $0
   i32.lt_s
   if
    local.get $3
    global.get $assembly/index/STRIDE
    i32.mul
    local.set $4
    global.get $assembly/index/workData
    local.set $21
    global.get $~lib/memory/__stack_pointer
    local.get $21
    i32.store
    local.get $21
    local.get $4
    i32.const 1
    i32.add
    call $~lib/typedarray/Float64Array#__get
    local.set $5
    global.get $assembly/index/workData
    local.set $21
    global.get $~lib/memory/__stack_pointer
    local.get $21
    i32.store
    local.get $21
    local.get $4
    i32.const 2
    i32.add
    call $~lib/typedarray/Float64Array#__get
    local.set $6
    global.get $assembly/index/workData
    local.set $21
    global.get $~lib/memory/__stack_pointer
    local.get $21
    i32.store
    local.get $21
    local.get $4
    i32.const 3
    i32.add
    call $~lib/typedarray/Float64Array#__get
    local.set $7
    global.get $assembly/index/workData
    local.set $21
    global.get $~lib/memory/__stack_pointer
    local.get $21
    i32.store
    local.get $21
    local.get $4
    i32.const 4
    i32.add
    call $~lib/typedarray/Float64Array#__get
    local.set $8
    local.get $5
    local.get $6
    f64.add
    local.get $7
    f64.add
    local.get $8
    f64.add
    f64.const 0.25
    f64.mul
    local.set $9
    local.get $3
    i32.const 0
    i32.eq
    if (result f64)
     local.get $5
     local.get $8
     f64.add
     f64.const 0.5
     f64.mul
    else
     local.get $1
     local.get $2
     f64.add
     f64.const 0.5
     f64.mul
    end
    local.set $10
    block $~lib/math/NativeMath.max|inlined.1 (result f64)
     local.get $6
     local.set $13
     block $~lib/math/NativeMath.max|inlined.0 (result f64)
      local.get $10
      local.set $11
      local.get $9
      local.set $12
      local.get $11
      local.get $12
      f64.max
      br $~lib/math/NativeMath.max|inlined.0
     end
     local.set $14
     local.get $13
     local.get $14
     f64.max
     br $~lib/math/NativeMath.max|inlined.1
    end
    local.set $15
    block $~lib/math/NativeMath.min|inlined.1 (result f64)
     local.get $7
     local.set $18
     block $~lib/math/NativeMath.min|inlined.0 (result f64)
      local.get $10
      local.set $16
      local.get $9
      local.set $17
      local.get $16
      local.get $17
      f64.min
      br $~lib/math/NativeMath.min|inlined.0
     end
     local.set $19
     local.get $18
     local.get $19
     f64.min
     br $~lib/math/NativeMath.min|inlined.1
    end
    local.set $20
    global.get $assembly/index/workData
    local.set $21
    global.get $~lib/memory/__stack_pointer
    local.get $21
    i32.store
    local.get $21
    local.get $4
    i32.const 1
    i32.add
    local.get $10
    call $~lib/typedarray/Float64Array#__set
    global.get $assembly/index/workData
    local.set $21
    global.get $~lib/memory/__stack_pointer
    local.get $21
    i32.store
    local.get $21
    local.get $4
    i32.const 2
    i32.add
    local.get $15
    call $~lib/typedarray/Float64Array#__set
    global.get $assembly/index/workData
    local.set $21
    global.get $~lib/memory/__stack_pointer
    local.get $21
    i32.store
    local.get $21
    local.get $4
    i32.const 3
    i32.add
    local.get $20
    call $~lib/typedarray/Float64Array#__set
    global.get $assembly/index/workData
    local.set $21
    global.get $~lib/memory/__stack_pointer
    local.get $21
    i32.store
    local.get $21
    local.get $4
    i32.const 4
    i32.add
    local.get $9
    call $~lib/typedarray/Float64Array#__set
    local.get $10
    local.set $1
    local.get $9
    local.set $2
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/index/computeRange (param $0 i32) (param $1 f64)
  (local $2 f64)
  (local $3 f64)
  (local $4 i32)
  (local $5 i32)
  (local $6 f64)
  (local $7 f64)
  (local $8 f64)
  (local $9 f64)
  (local $10 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.le_s
  if
   f64.const 0
   global.set $assembly/index/priceMin
   f64.const 1
   global.set $assembly/index/priceMax
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  f64.const inf
  local.set $2
  f64.const inf
  f64.neg
  local.set $3
  i32.const 0
  local.set $4
  loop $for-loop|0
   local.get $4
   local.get $0
   i32.lt_s
   if
    local.get $4
    global.get $assembly/index/STRIDE
    i32.mul
    local.set $5
    global.get $assembly/index/workData
    local.set $10
    global.get $~lib/memory/__stack_pointer
    local.get $10
    i32.store
    local.get $10
    local.get $5
    i32.const 2
    i32.add
    call $~lib/typedarray/Float64Array#__get
    local.set $6
    global.get $assembly/index/workData
    local.set $10
    global.get $~lib/memory/__stack_pointer
    local.get $10
    i32.store
    local.get $10
    local.get $5
    i32.const 3
    i32.add
    call $~lib/typedarray/Float64Array#__get
    local.set $7
    local.get $7
    local.get $2
    f64.lt
    if
     local.get $7
     local.set $2
    end
    local.get $6
    local.get $3
    f64.gt
    if
     local.get $6
     local.set $3
    end
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $3
  local.get $2
  f64.sub
  local.set $8
  local.get $8
  f64.const 0
  f64.eq
  if (result f64)
   f64.const 0.0005
  else
   local.get $8
   local.get $1
   f64.mul
  end
  local.set $9
  local.get $2
  local.get $9
  f64.sub
  global.set $assembly/index/priceMin
  local.get $3
  local.get $9
  f64.add
  global.set $assembly/index/priceMax
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/typedarray/Float32Array#__set (param $0 i32) (param $1 i32) (param $2 f32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $1
  local.get $0
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 336
   i32.const 544
   i32.const 1315
   i32.const 64
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/arraybuffer/ArrayBufferView#get:dataStart
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  f32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/index/pushLine (param $0 f32) (param $1 f32) (param $2 f32) (param $3 f32) (param $4 f32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $assembly/index/lineCount
  i32.const 1
  i32.add
  call $assembly/index/ensureLines
  global.get $assembly/index/lineCount
  global.get $assembly/index/VERT_STRIDE
  i32.mul
  local.set $5
  global.get $assembly/index/lineVerts
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $5
  local.get $0
  call $~lib/typedarray/Float32Array#__set
  global.get $assembly/index/lineVerts
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $5
  i32.const 1
  i32.add
  local.get $1
  call $~lib/typedarray/Float32Array#__set
  global.get $assembly/index/lineVerts
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $5
  i32.const 2
  i32.add
  local.get $2
  call $~lib/typedarray/Float32Array#__set
  global.get $assembly/index/lineVerts
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $5
  i32.const 3
  i32.add
  local.get $3
  call $~lib/typedarray/Float32Array#__set
  global.get $assembly/index/lineVerts
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $5
  i32.const 4
  i32.add
  local.get $4
  call $~lib/typedarray/Float32Array#__set
  global.get $assembly/index/lineCount
  i32.const 1
  i32.add
  global.set $assembly/index/lineCount
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/index/pushTri (param $0 f32) (param $1 f32) (param $2 f32) (param $3 f32) (param $4 f32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $assembly/index/triCount
  i32.const 1
  i32.add
  call $assembly/index/ensureTris
  global.get $assembly/index/triCount
  global.get $assembly/index/VERT_STRIDE
  i32.mul
  local.set $5
  global.get $assembly/index/triVerts
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $5
  local.get $0
  call $~lib/typedarray/Float32Array#__set
  global.get $assembly/index/triVerts
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $5
  i32.const 1
  i32.add
  local.get $1
  call $~lib/typedarray/Float32Array#__set
  global.get $assembly/index/triVerts
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $5
  i32.const 2
  i32.add
  local.get $2
  call $~lib/typedarray/Float32Array#__set
  global.get $assembly/index/triVerts
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $5
  i32.const 3
  i32.add
  local.get $3
  call $~lib/typedarray/Float32Array#__set
  global.get $assembly/index/triVerts
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $5
  i32.const 4
  i32.add
  local.get $4
  call $~lib/typedarray/Float32Array#__set
  global.get $assembly/index/triCount
  i32.const 1
  i32.add
  global.set $assembly/index/triCount
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/index/buildGeometry (param $0 i32) (param $1 i32) (param $2 i32) (param $3 f32) (param $4 f32) (param $5 f32) (param $6 f32) (param $7 f32) (param $8 f64) (param $9 f32) (result i32)
  (local $10 i32)
  (local $11 f64)
  (local $12 f64)
  (local $13 f64)
  (local $14 f32)
  (local $15 i32)
  (local $16 i32)
  (local $17 f32)
  (local $18 f64)
  (local $19 f32)
  (local $20 f32)
  (local $21 f64)
  (local $22 f64)
  (local $23 f64)
  (local $24 f32)
  (local $25 i32)
  (local $26 f32)
  (local $27 f64)
  (local $28 f32)
  (local $29 f32)
  (local $30 f64)
  (local $31 f64)
  (local $32 f64)
  (local $33 f32)
  (local $34 f32)
  (local $35 i32)
  (local $36 i32)
  (local $37 f64)
  (local $38 f64)
  (local $39 f64)
  (local $40 f64)
  (local $41 i32)
  (local $42 f32)
  (local $43 f32)
  (local $44 f32)
  (local $45 f32)
  (local $46 f64)
  (local $47 f32)
  (local $48 f32)
  (local $49 f64)
  (local $50 f64)
  (local $51 f64)
  (local $52 f32)
  (local $53 f64)
  (local $54 f32)
  (local $55 f32)
  (local $56 f64)
  (local $57 f64)
  (local $58 f64)
  (local $59 f32)
  (local $60 f64)
  (local $61 f32)
  (local $62 f32)
  (local $63 f64)
  (local $64 f64)
  (local $65 f64)
  (local $66 f32)
  (local $67 f64)
  (local $68 f32)
  (local $69 f32)
  (local $70 f64)
  (local $71 f64)
  (local $72 f64)
  (local $73 f32)
  (local $74 f32)
  (local $75 f32)
  (local $76 f32)
  (local $77 f32)
  (local $78 f32)
  (local $79 f32)
  (local $80 f32)
  (local $81 f32)
  (local $82 f32)
  (local $83 f32)
  (local $84 f32)
  (local $85 f32)
  (local $86 f32)
  (local $87 f32)
  (local $88 f32)
  (local $89 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  i32.const 0
  global.set $assembly/index/triCount
  i32.const 0
  global.set $assembly/index/lineCount
  local.get $2
  global.get $assembly/index/candleCount
  i32.gt_s
  if
   global.get $assembly/index/candleCount
   local.set $2
  end
  local.get $1
  i32.const 0
  i32.lt_s
  if
   i32.const 0
   local.set $1
  end
  local.get $2
  local.get $1
  i32.le_s
  if (result i32)
   i32.const 1
  else
   local.get $7
   f32.const 0
   f32.le
  end
  if (result i32)
   i32.const 1
  else
   local.get $5
   f32.const 0
   f32.le
  end
  if (result i32)
   i32.const 1
  else
   local.get $6
   f32.const 0
   f32.le
  end
  if
   i32.const 0
   local.set $89
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $89
   return
  end
  local.get $1
  local.get $2
  call $assembly/index/copyRawToWork
  local.set $10
  local.get $0
  i32.const 3
  i32.eq
  if
   local.get $10
   call $assembly/index/toHeikenAshi
  end
  local.get $10
  local.get $8
  call $assembly/index/computeRange
  local.get $9
  f32.const 0.009999999776482582
  f32.le
  if (result f64)
   f64.const 1
  else
   local.get $9
   f64.promote_f32
  end
  local.set $11
  local.get $11
  f64.const 1
  f64.ne
  if
   global.get $assembly/index/priceMin
   global.get $assembly/index/priceMax
   f64.add
   f64.const 0.5
   f64.mul
   local.set $12
   global.get $assembly/index/priceMax
   global.get $assembly/index/priceMin
   f64.sub
   f64.const 0.5
   f64.mul
   local.get $11
   f64.div
   local.set $13
   local.get $12
   local.get $13
   f64.sub
   global.set $assembly/index/priceMin
   local.get $12
   local.get $13
   f64.add
   global.set $assembly/index/priceMax
  end
  local.get $5
  local.get $7
  f32.div
  local.set $14
  local.get $0
  i32.const 2
  i32.eq
  if
   i32.const 0
   local.set $15
   loop $for-loop|0
    local.get $15
    local.get $10
    i32.lt_s
    if
     local.get $15
     global.get $assembly/index/STRIDE
     i32.mul
     local.set $16
     local.get $3
     local.get $15
     f32.convert_i32_s
     local.get $14
     f32.mul
     f32.add
     local.get $14
     f32.const 0.5
     f32.mul
     f32.add
     local.set $17
     block $assembly/index/yFor|inlined.0 (result f32)
      global.get $assembly/index/workData
      local.set $89
      global.get $~lib/memory/__stack_pointer
      local.get $89
      i32.store
      local.get $89
      local.get $16
      i32.const 4
      i32.add
      call $~lib/typedarray/Float64Array#__get
      local.set $18
      local.get $4
      local.set $19
      local.get $6
      local.set $20
      global.get $assembly/index/priceMin
      local.set $21
      global.get $assembly/index/priceMax
      local.set $22
      local.get $18
      local.get $21
      f64.sub
      local.get $22
      local.get $21
      f64.sub
      f64.const 0
      f64.eq
      if (result f64)
       f64.const 1
      else
       local.get $22
       local.get $21
       f64.sub
      end
      f64.div
      local.set $23
      local.get $19
      local.get $20
      f32.const 1
      f64.promote_f32
      local.get $23
      f64.sub
      f32.demote_f64
      f32.mul
      f32.add
      br $assembly/index/yFor|inlined.0
     end
     local.set $24
     local.get $15
     i32.const 0
     i32.gt_s
     if
      local.get $15
      i32.const 1
      i32.sub
      global.get $assembly/index/STRIDE
      i32.mul
      local.set $25
      local.get $3
      local.get $15
      i32.const 1
      i32.sub
      f32.convert_i32_s
      local.get $14
      f32.mul
      f32.add
      local.get $14
      f32.const 0.5
      f32.mul
      f32.add
      local.set $26
      block $assembly/index/yFor|inlined.1 (result f32)
       global.get $assembly/index/workData
       local.set $89
       global.get $~lib/memory/__stack_pointer
       local.get $89
       i32.store
       local.get $89
       local.get $25
       i32.const 4
       i32.add
       call $~lib/typedarray/Float64Array#__get
       local.set $27
       local.get $4
       local.set $28
       local.get $6
       local.set $29
       global.get $assembly/index/priceMin
       local.set $30
       global.get $assembly/index/priceMax
       local.set $31
       local.get $27
       local.get $30
       f64.sub
       local.get $31
       local.get $30
       f64.sub
       f64.const 0
       f64.eq
       if (result f64)
        f64.const 1
       else
        local.get $31
        local.get $30
        f64.sub
       end
       f64.div
       local.set $32
       local.get $28
       local.get $29
       f32.const 1
       f64.promote_f32
       local.get $32
       f64.sub
       f32.demote_f64
       f32.mul
       f32.add
       br $assembly/index/yFor|inlined.1
      end
      local.set $33
      local.get $26
      local.get $33
      f32.const 0.3100000023841858
      f32.const 0.5490000247955322
      f32.const 1
      call $assembly/index/pushLine
      local.get $17
      local.get $24
      f32.const 0.3100000023841858
      f32.const 0.5490000247955322
      f32.const 1
      call $assembly/index/pushLine
      local.get $4
      local.get $6
      f32.add
      local.set $34
      local.get $26
      local.get $33
      f32.const 0.3100000023841858
      f32.const 0.5490000247955322
      f32.const 1
      call $assembly/index/pushTri
      local.get $17
      local.get $24
      f32.const 0.3100000023841858
      f32.const 0.5490000247955322
      f32.const 1
      call $assembly/index/pushTri
      local.get $26
      local.get $34
      f32.const 0.3100000023841858
      f32.const 0.5490000247955322
      f32.const 1
      call $assembly/index/pushTri
      local.get $17
      local.get $24
      f32.const 0.3100000023841858
      f32.const 0.5490000247955322
      f32.const 1
      call $assembly/index/pushTri
      local.get $17
      local.get $34
      f32.const 0.3100000023841858
      f32.const 0.5490000247955322
      f32.const 1
      call $assembly/index/pushTri
      local.get $26
      local.get $34
      f32.const 0.3100000023841858
      f32.const 0.5490000247955322
      f32.const 1
      call $assembly/index/pushTri
     end
     local.get $15
     i32.const 1
     i32.add
     local.set $15
     br $for-loop|0
    end
   end
   global.get $assembly/index/triCount
   local.set $89
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $89
   return
  end
  i32.const 0
  local.set $35
  loop $for-loop|1
   local.get $35
   local.get $10
   i32.lt_s
   if
    local.get $35
    global.get $assembly/index/STRIDE
    i32.mul
    local.set $36
    global.get $assembly/index/workData
    local.set $89
    global.get $~lib/memory/__stack_pointer
    local.get $89
    i32.store
    local.get $89
    local.get $36
    i32.const 1
    i32.add
    call $~lib/typedarray/Float64Array#__get
    local.set $37
    global.get $assembly/index/workData
    local.set $89
    global.get $~lib/memory/__stack_pointer
    local.get $89
    i32.store
    local.get $89
    local.get $36
    i32.const 2
    i32.add
    call $~lib/typedarray/Float64Array#__get
    local.set $38
    global.get $assembly/index/workData
    local.set $89
    global.get $~lib/memory/__stack_pointer
    local.get $89
    i32.store
    local.get $89
    local.get $36
    i32.const 3
    i32.add
    call $~lib/typedarray/Float64Array#__get
    local.set $39
    global.get $assembly/index/workData
    local.set $89
    global.get $~lib/memory/__stack_pointer
    local.get $89
    i32.store
    local.get $89
    local.get $36
    i32.const 4
    i32.add
    call $~lib/typedarray/Float64Array#__get
    local.set $40
    local.get $40
    local.get $37
    f64.ge
    local.set $41
    local.get $41
    if (result f32)
     f32.const 0.13300000131130219
    else
     f32.const 0.9369999766349792
    end
    local.set $42
    local.get $41
    if (result f32)
     f32.const 0.7730000019073486
    else
     f32.const 0.2669999897480011
    end
    local.set $43
    local.get $41
    if (result f32)
     f32.const 0.36899998784065247
    else
     f32.const 0.2669999897480011
    end
    local.set $44
    local.get $3
    local.get $35
    f32.convert_i32_s
    local.get $14
    f32.mul
    f32.add
    local.get $14
    f32.const 0.5
    f32.mul
    f32.add
    local.set $45
    block $assembly/index/yFor|inlined.2 (result f32)
     local.get $38
     local.set $46
     local.get $4
     local.set $47
     local.get $6
     local.set $48
     global.get $assembly/index/priceMin
     local.set $49
     global.get $assembly/index/priceMax
     local.set $50
     local.get $46
     local.get $49
     f64.sub
     local.get $50
     local.get $49
     f64.sub
     f64.const 0
     f64.eq
     if (result f64)
      f64.const 1
     else
      local.get $50
      local.get $49
      f64.sub
     end
     f64.div
     local.set $51
     local.get $47
     local.get $48
     f32.const 1
     f64.promote_f32
     local.get $51
     f64.sub
     f32.demote_f64
     f32.mul
     f32.add
     br $assembly/index/yFor|inlined.2
    end
    local.set $52
    block $assembly/index/yFor|inlined.3 (result f32)
     local.get $39
     local.set $53
     local.get $4
     local.set $54
     local.get $6
     local.set $55
     global.get $assembly/index/priceMin
     local.set $56
     global.get $assembly/index/priceMax
     local.set $57
     local.get $53
     local.get $56
     f64.sub
     local.get $57
     local.get $56
     f64.sub
     f64.const 0
     f64.eq
     if (result f64)
      f64.const 1
     else
      local.get $57
      local.get $56
      f64.sub
     end
     f64.div
     local.set $58
     local.get $54
     local.get $55
     f32.const 1
     f64.promote_f32
     local.get $58
     f64.sub
     f32.demote_f64
     f32.mul
     f32.add
     br $assembly/index/yFor|inlined.3
    end
    local.set $59
    block $assembly/index/yFor|inlined.4 (result f32)
     local.get $37
     local.set $60
     local.get $4
     local.set $61
     local.get $6
     local.set $62
     global.get $assembly/index/priceMin
     local.set $63
     global.get $assembly/index/priceMax
     local.set $64
     local.get $60
     local.get $63
     f64.sub
     local.get $64
     local.get $63
     f64.sub
     f64.const 0
     f64.eq
     if (result f64)
      f64.const 1
     else
      local.get $64
      local.get $63
      f64.sub
     end
     f64.div
     local.set $65
     local.get $61
     local.get $62
     f32.const 1
     f64.promote_f32
     local.get $65
     f64.sub
     f32.demote_f64
     f32.mul
     f32.add
     br $assembly/index/yFor|inlined.4
    end
    local.set $66
    block $assembly/index/yFor|inlined.5 (result f32)
     local.get $40
     local.set $67
     local.get $4
     local.set $68
     local.get $6
     local.set $69
     global.get $assembly/index/priceMin
     local.set $70
     global.get $assembly/index/priceMax
     local.set $71
     local.get $67
     local.get $70
     f64.sub
     local.get $71
     local.get $70
     f64.sub
     f64.const 0
     f64.eq
     if (result f64)
      f64.const 1
     else
      local.get $71
      local.get $70
      f64.sub
     end
     f64.div
     local.set $72
     local.get $68
     local.get $69
     f32.const 1
     f64.promote_f32
     local.get $72
     f64.sub
     f32.demote_f64
     f32.mul
     f32.add
     br $assembly/index/yFor|inlined.5
    end
    local.set $73
    local.get $45
    local.get $52
    local.get $42
    local.get $43
    local.get $44
    call $assembly/index/pushLine
    local.get $45
    local.get $59
    local.get $42
    local.get $43
    local.get $44
    call $assembly/index/pushLine
    local.get $0
    i32.const 1
    i32.eq
    if
     block $~lib/math/NativeMathf.max|inlined.0 (result f32)
      f32.const 3
      local.set $74
      local.get $14
      f32.const 0.2800000011920929
      f32.mul
      local.set $75
      local.get $74
      local.get $75
      f32.max
      br $~lib/math/NativeMathf.max|inlined.0
     end
     local.set $76
     local.get $45
     local.get $76
     f32.sub
     local.get $66
     local.get $42
     local.get $43
     local.get $44
     call $assembly/index/pushLine
     local.get $45
     local.get $66
     local.get $42
     local.get $43
     local.get $44
     call $assembly/index/pushLine
     local.get $45
     local.get $73
     local.get $42
     local.get $43
     local.get $44
     call $assembly/index/pushLine
     local.get $45
     local.get $76
     f32.add
     local.get $73
     local.get $42
     local.get $43
     local.get $44
     call $assembly/index/pushLine
    else
     block $~lib/math/NativeMathf.max|inlined.1 (result f32)
      f32.const 2
      local.set $77
      local.get $14
      f32.const 0.6200000047683716
      f32.mul
      local.set $78
      local.get $77
      local.get $78
      f32.max
      br $~lib/math/NativeMathf.max|inlined.1
     end
     local.set $79
     block $~lib/math/NativeMathf.min|inlined.0 (result f32)
      local.get $66
      local.set $80
      local.get $73
      local.set $81
      local.get $80
      local.get $81
      f32.min
      br $~lib/math/NativeMathf.min|inlined.0
     end
     local.set $82
     block $~lib/math/NativeMathf.max|inlined.2 (result f32)
      local.get $66
      local.set $83
      local.get $73
      local.set $84
      local.get $83
      local.get $84
      f32.max
      br $~lib/math/NativeMathf.max|inlined.2
     end
     local.set $85
     block $~lib/math/NativeMathf.max|inlined.3 (result f32)
      f32.const 1
      local.set $86
      local.get $85
      local.get $82
      f32.sub
      local.set $87
      local.get $86
      local.get $87
      f32.max
      br $~lib/math/NativeMathf.max|inlined.3
     end
     local.set $88
     local.get $45
     local.get $79
     f32.const 0.5
     f32.mul
     f32.sub
     local.get $82
     local.get $45
     local.get $79
     f32.const 0.5
     f32.mul
     f32.add
     local.get $82
     local.get $88
     f32.add
     local.get $42
     local.get $43
     local.get $44
     call $assembly/index/pushQuad
    end
    local.get $35
    i32.const 1
    i32.add
    local.set $35
    br $for-loop|1
   end
  end
  global.get $assembly/index/triCount
  local.set $89
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $89
  return
 )
)

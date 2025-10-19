; ModuleID = '/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/stencil/stencil3d/prj/solution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_stencil3d_ir(i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="2" %C, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="16384" %orig, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="16384" %sol) local_unnamed_addr #1 {
entry:
  %C_copy = alloca [2 x i32], align 512
  %malloccall_0 = call i8* @malloc(i64 32768)
  %malloccall_1 = call i8* @malloc(i64 32768)
  %orig_copy_04 = bitcast i8* %malloccall_0 to [4096 x i64]*
  %orig_copy_15 = bitcast i8* %malloccall_1 to [4096 x i64]*
  %malloccall1_0 = call i8* @malloc(i64 32768)
  %malloccall1_1 = call i8* @malloc(i64 32768)
  %sol_copy_06 = bitcast i8* %malloccall1_0 to [4096 x i64]*
  %sol_copy_17 = bitcast i8* %malloccall1_1 to [4096 x i64]*
  %0 = bitcast i32* %C to [2 x i32]*
  %1 = bitcast i32* %orig to [16384 x i32]*
  %2 = bitcast i32* %sol to [16384 x i32]*
  call void @copy_in([2 x i32]* nonnull %0, [2 x i32]* nonnull align 512 %C_copy, [16384 x i32]* nonnull %1, [4096 x i64]* %orig_copy_04, [4096 x i64]* %orig_copy_15, [16384 x i32]* nonnull %2, [4096 x i64]* %sol_copy_06, [4096 x i64]* %sol_copy_17)
  %3 = getelementptr inbounds [2 x i32], [2 x i32]* %C_copy, i32 0, i32 0
  %_08 = getelementptr [4096 x i64], [4096 x i64]* %orig_copy_04, i32 0, i32 0
  %_19 = getelementptr [4096 x i64], [4096 x i64]* %orig_copy_15, i32 0, i32 0
  %_0210 = getelementptr [4096 x i64], [4096 x i64]* %sol_copy_06, i32 0, i32 0
  %_1311 = getelementptr [4096 x i64], [4096 x i64]* %sol_copy_17, i32 0, i32 0
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i64* %_08, i32 0, i32 1, i32 0, i1 false) ], !dbg !5
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i64* %_19, i32 0, i32 1, i32 0, i1 false) ], !dbg !5
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i64* %_0210, i32 0, i32 1, i32 0, i1 false) ], !dbg !20
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i64* %_1311, i32 0, i32 1, i32 0, i1 false) ], !dbg !20
  call void @apatb_stencil3d_hw(i32* %3, [4096 x i64]* %orig_copy_04, [4096 x i64]* %orig_copy_15, [4096 x i64]* %sol_copy_06, [4096 x i64]* %sol_copy_17)
  call void @copy_back([2 x i32]* %0, [2 x i32]* %C_copy, [16384 x i32]* %1, [4096 x i64]* %orig_copy_04, [4096 x i64]* %orig_copy_15, [16384 x i32]* %2, [4096 x i64]* %sol_copy_06, [4096 x i64]* %sol_copy_17)
  call void @free(i8* %malloccall_0)
  call void @free(i8* %malloccall_1)
  call void @free(i8* %malloccall1_0)
  call void @free(i8* %malloccall1_1)
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %_08, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %_19, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %_0210, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %_1311, i32 0, i32 1, i32 0) ]
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a2i32([2 x i32]* noalias align 512, [2 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [2 x i32]* %0, null
  %3 = icmp eq [2 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2 x i32], [2 x i32]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [2 x i32], [2 x i32]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i32, i32* %src.addr, align 4
  store i32 %5, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 2
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

declare void @free(i8*) local_unnamed_addr

; Function Attrs: nounwind
declare void @llvm.assume(i1) #3

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a16384i32.3.4([4096 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, [4096 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, [16384 x i32]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %1 = icmp eq [4096 x i64]* %_0, null
  %2 = icmp eq [16384 x i32]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %4 = udiv i64 %for.loop.idx1, 8192
  %5 = urem i64 %for.loop.idx1, 8192
  %6 = udiv i64 %5, 4096
  %7 = mul i64 32, %6
  %8 = urem i64 %5, 4096
  %dst.addr_01 = getelementptr [4096 x i64], [4096 x i64]* %_0, i64 0, i64 %8
  %dst.addr_12 = getelementptr [4096 x i64], [4096 x i64]* %_1, i64 0, i64 %8
  %src.addr = getelementptr [16384 x i32], [16384 x i32]* %0, i64 0, i64 %for.loop.idx1
  %9 = load i32, i32* %src.addr, align 4
  %10 = trunc i64 %4 to i1
  %cond = icmp eq i1 %10, false
  %11 = shl i64 4294967295, %7
  %12 = zext i32 %9 to i64
  %13 = shl i64 %12, %7
  %14 = xor i64 %11, -1
  br i1 %cond, label %dst.addr.case.0, label %dst.addr.case.1

dst.addr.case.0:                                  ; preds = %for.loop
  %15 = load i64, i64* %dst.addr_01, align 8
  %16 = and i64 %15, %14
  %17 = or i64 %16, %13
  store i64 %17, i64* %dst.addr_01, align 8
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  call void @llvm.assume(i1 %10)
  %18 = load i64, i64* %dst.addr_12, align 8
  %19 = and i64 %18, %14
  %20 = or i64 %19, %13
  store i64 %20, i64* %dst.addr_12, align 8
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 16384
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_in([2 x i32]* noalias readonly "orig.arg.no"="0", [2 x i32]* noalias align 512 "orig.arg.no"="1", [16384 x i32]* noalias readonly "orig.arg.no"="2", [4096 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_0, [4096 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_1, [16384 x i32]* noalias readonly "orig.arg.no"="4", [4096 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_01, [4096 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_12) #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a2i32([2 x i32]* align 512 %1, [2 x i32]* %0)
  call void @onebyonecpy_hls.p0a16384i32.3.4([4096 x i64]* %_0, [4096 x i64]* %_1, [16384 x i32]* %2)
  call void @onebyonecpy_hls.p0a16384i32.3.4([4096 x i64]* %_01, [4096 x i64]* %_12, [16384 x i32]* %3)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a16384i32.9.10([16384 x i32]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [4096 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [4096 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1) #2 {
entry:
  %1 = icmp eq [16384 x i32]* %0, null
  %2 = icmp eq [4096 x i64]* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [16384 x i32], [16384 x i32]* %0, i64 0, i64 %for.loop.idx1
  %4 = udiv i64 %for.loop.idx1, 8192
  %5 = urem i64 %for.loop.idx1, 8192
  %6 = udiv i64 %5, 4096
  %7 = mul i64 32, %6
  %8 = urem i64 %5, 4096
  %src.addr_01 = getelementptr [4096 x i64], [4096 x i64]* %_0, i64 0, i64 %8
  %src.addr_12 = getelementptr [4096 x i64], [4096 x i64]* %_1, i64 0, i64 %8
  %9 = trunc i64 %4 to i1
  %cond = icmp eq i1 %9, false
  br i1 %cond, label %src.addr.case.0, label %src.addr.case.1

src.addr.case.0:                                  ; preds = %for.loop
  %_013 = load i64, i64* %src.addr_01, align 8
  %10 = lshr i64 %_013, %7
  %11 = trunc i64 %10 to i32
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  call void @llvm.assume(i1 %9)
  %_124 = load i64, i64* %src.addr_12, align 8
  %12 = lshr i64 %_124, %7
  %13 = trunc i64 %12 to i32
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.1, %src.addr.case.0
  %14 = phi i32 [ %11, %src.addr.case.0 ], [ %13, %src.addr.case.1 ]
  store i32 %14, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 16384
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_out([2 x i32]* noalias "orig.arg.no"="0", [2 x i32]* noalias readonly align 512 "orig.arg.no"="1", [16384 x i32]* noalias "orig.arg.no"="2", [4096 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_0, [4096 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_1, [16384 x i32]* noalias "orig.arg.no"="4", [4096 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_01, [4096 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_12) #5 {
entry:
  call fastcc void @onebyonecpy_hls.p0a2i32([2 x i32]* %0, [2 x i32]* align 512 %1)
  call void @onebyonecpy_hls.p0a16384i32.9.10([16384 x i32]* %2, [4096 x i64]* %_0, [4096 x i64]* %_1)
  call void @onebyonecpy_hls.p0a16384i32.9.10([16384 x i32]* %3, [4096 x i64]* %_01, [4096 x i64]* %_12)
  ret void
}

declare void @apatb_stencil3d_hw(i32*, [4096 x i64]*, [4096 x i64]*, [4096 x i64]*, [4096 x i64]*)

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_back([2 x i32]* noalias "orig.arg.no"="0", [2 x i32]* noalias readonly align 512 "orig.arg.no"="1", [16384 x i32]* noalias "orig.arg.no"="2", [4096 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_0, [4096 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_1, [16384 x i32]* noalias "orig.arg.no"="4", [4096 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_01, [4096 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_12) #5 {
entry:
  call void @onebyonecpy_hls.p0a16384i32.9.10([16384 x i32]* %3, [4096 x i64]* %_01, [4096 x i64]* %_12)
  ret void
}

define void @stencil3d_hw_stub_wrapper(i32*, [4096 x i64]*, [4096 x i64]*, [4096 x i64]*, [4096 x i64]*) #6 {
entry:
  %malloccall = tail call i8* @malloc(i64 65536)
  %5 = bitcast i8* %malloccall to [16384 x i32]*
  %malloccall1 = tail call i8* @malloc(i64 65536)
  %6 = bitcast i8* %malloccall1 to [16384 x i32]*
  %7 = bitcast i32* %0 to [2 x i32]*
  call void @copy_out([2 x i32]* null, [2 x i32]* %7, [16384 x i32]* %5, [4096 x i64]* %1, [4096 x i64]* %2, [16384 x i32]* %6, [4096 x i64]* %3, [4096 x i64]* %4)
  %8 = bitcast [2 x i32]* %7 to i32*
  %9 = bitcast [16384 x i32]* %5 to i32*
  %10 = bitcast [16384 x i32]* %6 to i32*
  call void @stencil3d_hw_stub(i32* %8, i32* %9, i32* %10)
  call void @copy_in([2 x i32]* null, [2 x i32]* %7, [16384 x i32]* %5, [4096 x i64]* %1, [4096 x i64]* %2, [16384 x i32]* %6, [4096 x i64]* %3, [4096 x i64]* %4)
  ret void
}

declare void @stencil3d_hw_stub(i32*, i32*, i32*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #5 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }
attributes #7 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="576460752303423487" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = !DILocation(line: 10, column: 9, scope: !6)
!6 = !DILexicalBlockFile(scope: !8, file: !7, discriminator: 0)
!7 = !DIFile(filename: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/stencil/stencil3d/dir_test.tcl", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/stencil/stencil3d")
!8 = distinct !DISubprogram(name: "stencil3d", scope: !9, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, scopeLine: 10, flags: DIFlagPrototyped, isOptimized: false, unit: !18, variables: !4)
!9 = !DIFile(filename: "stencil.c", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/stencil/stencil3d")
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12, !12, !12}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !14, line: 26, baseType: !15)
!14 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/stencil/stencil3d")
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !16, line: 41, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/stencil/stencil3d")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = distinct !DICompileUnit(language: DW_LANG_C99, file: !19, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4)
!19 = !DIFile(filename: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/stencil/stencil3d/prj/solution/.autopilot/db/stencil.pp.0.c", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/stencil/stencil3d")
!20 = !DILocation(line: 12, column: 9, scope: !6)

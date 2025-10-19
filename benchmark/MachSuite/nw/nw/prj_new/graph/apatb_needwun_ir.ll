; ModuleID = '/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/nw/nw/prj/solution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_needwun_ir(i8* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="128" %SEQA, i8* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="128" %SEQB, i8* noalias nocapture nonnull "fpga.decayed.dim.hint"="256" %alignedA, i8* noalias nocapture nonnull "fpga.decayed.dim.hint"="256" %alignedB, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="16641" %M, i8* noalias nocapture nonnull "fpga.decayed.dim.hint"="16641" %ptr) local_unnamed_addr #1 {
entry:
  %SEQA_copy_02 = alloca [32 x i16], align 512
  %SEQA_copy_13 = alloca [32 x i16], align 512
  %SEQB_copy4 = alloca [64 x i16], align 512
  %alignedA_copy = alloca [256 x i8], align 512
  %alignedB_copy = alloca [256 x i8], align 512
  %malloccall_0 = call i8* @malloc(i64 33288)
  %malloccall_1 = call i8* @malloc(i64 33288)
  %M_copy_05 = bitcast i8* %malloccall_0 to [4161 x i64]*
  %M_copy_16 = bitcast i8* %malloccall_1 to [4161 x i64]*
  %malloccall1 = call i8* @malloc(i64 16642)
  %ptr_copy7 = bitcast i8* %malloccall1 to [8321 x i16]*
  %0 = bitcast i8* %SEQA to [128 x i8]*
  %1 = bitcast i8* %SEQB to [128 x i8]*
  %2 = bitcast i8* %alignedA to [256 x i8]*
  %3 = bitcast i8* %alignedB to [256 x i8]*
  %4 = bitcast i32* %M to [16641 x i32]*
  %5 = bitcast i8* %ptr to [16641 x i8]*
  call void @copy_in([128 x i8]* nonnull %0, [32 x i16]* nonnull align 512 %SEQA_copy_02, [32 x i16]* nonnull align 512 %SEQA_copy_13, [128 x i8]* nonnull %1, [64 x i16]* nonnull align 512 %SEQB_copy4, [256 x i8]* nonnull %2, [256 x i8]* nonnull align 512 %alignedA_copy, [256 x i8]* nonnull %3, [256 x i8]* nonnull align 512 %alignedB_copy, [16641 x i32]* nonnull %4, [4161 x i64]* %M_copy_05, [4161 x i64]* %M_copy_16, [16641 x i8]* nonnull %5, [8321 x i16]* %ptr_copy7)
  %SEQA_copy.gep_08 = getelementptr [32 x i16], [32 x i16]* %SEQA_copy_02, i64 0, i32 0
  %SEQA_copy.gep_19 = getelementptr [32 x i16], [32 x i16]* %SEQA_copy_13, i64 0, i32 0
  %SEQB_copy.gep10 = getelementptr [64 x i16], [64 x i16]* %SEQB_copy4, i64 0, i32 0
  %6 = getelementptr inbounds [256 x i8], [256 x i8]* %alignedA_copy, i32 0, i32 0
  %7 = getelementptr inbounds [256 x i8], [256 x i8]* %alignedB_copy, i32 0, i32 0
  %_011 = getelementptr [4161 x i64], [4161 x i64]* %M_copy_05, i32 0, i32 0
  %_112 = getelementptr [4161 x i64], [4161 x i64]* %M_copy_16, i32 0, i32 0
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i16* %SEQA_copy.gep_08, i32 0, i32 1, i32 0, i1 false) ], !dbg !5
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i16* %SEQA_copy.gep_19, i32 0, i32 1, i32 0, i1 false) ], !dbg !5
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i16* %SEQB_copy.gep10, i32 0, i32 1, i32 0) ], !dbg !18
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i64* %_011, i32 0, i32 1, i32 0, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i64* %_112, i32 0, i32 1, i32 0, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i8* %malloccall1, i32 0, i32 1, i32 0) ], !dbg !20
  call void @apatb_needwun_hw([32 x i16]* %SEQA_copy_02, [32 x i16]* %SEQA_copy_13, [64 x i16]* %SEQB_copy4, i8* %6, i8* %7, [4161 x i64]* %M_copy_05, [4161 x i64]* %M_copy_16, [8321 x i16]* %ptr_copy7)
  call void @copy_back([128 x i8]* %0, [32 x i16]* %SEQA_copy_02, [32 x i16]* %SEQA_copy_13, [128 x i8]* %1, [64 x i16]* %SEQB_copy4, [256 x i8]* %2, [256 x i8]* %alignedA_copy, [256 x i8]* %3, [256 x i8]* %alignedB_copy, [16641 x i32]* %4, [4161 x i64]* %M_copy_05, [4161 x i64]* %M_copy_16, [16641 x i8]* %5, [8321 x i16]* %ptr_copy7)
  call void @free(i8* %malloccall_0)
  call void @free(i8* %malloccall_1)
  call void @free(i8* %malloccall1)
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i16* %SEQA_copy.gep_08, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i16* %SEQA_copy.gep_19, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %_011, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %_112, i32 0, i32 1, i32 0) ]
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a256i8([256 x i8]* noalias align 512, [256 x i8]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [256 x i8]* %0, null
  %3 = icmp eq [256 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [256 x i8], [256 x i8]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [256 x i8], [256 x i8]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i8, i8* %src.addr, align 1
  store i8 %5, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 256
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

declare void @free(i8*) local_unnamed_addr

; Function Attrs: nounwind
declare void @llvm.assume(i1) #3

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a128i8.3.4([32 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, [32 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, [128 x i8]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %1 = icmp eq [32 x i16]* %_0, null
  %2 = icmp eq [128 x i8]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %4 = udiv i64 %for.loop.idx1, 64
  %5 = urem i64 %for.loop.idx1, 64
  %6 = udiv i64 %5, 32
  %7 = mul i64 8, %6
  %8 = urem i64 %5, 32
  %dst.addr_01 = getelementptr [32 x i16], [32 x i16]* %_0, i64 0, i64 %8
  %dst.addr_12 = getelementptr [32 x i16], [32 x i16]* %_1, i64 0, i64 %8
  %src.addr = getelementptr [128 x i8], [128 x i8]* %0, i64 0, i64 %for.loop.idx1
  %9 = load i8, i8* %src.addr, align 1
  %10 = trunc i64 %4 to i1
  %cond = icmp eq i1 %10, false
  %11 = trunc i64 %7 to i16
  %12 = shl i16 255, %11
  %13 = zext i8 %9 to i16
  %14 = shl i16 %13, %11
  %15 = xor i16 %12, -1
  br i1 %cond, label %dst.addr.case.0, label %dst.addr.case.1

dst.addr.case.0:                                  ; preds = %for.loop
  %16 = load i16, i16* %dst.addr_01, align 2
  %17 = and i16 %16, %15
  %18 = or i16 %17, %14
  store i16 %18, i16* %dst.addr_01, align 2
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  call void @llvm.assume(i1 %10)
  %19 = load i16, i16* %dst.addr_12, align 2
  %20 = and i16 %19, %15
  %21 = or i16 %20, %14
  store i16 %21, i16* %dst.addr_12, align 2
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 128
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a128i8.19.20([64 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [128 x i8]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %2 = icmp eq [64 x i16]* %0, null
  %3 = icmp eq [128 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %5 = udiv i64 %for.loop.idx1, 64
  %6 = mul i64 8, %5
  %7 = urem i64 %for.loop.idx1, 64
  %dst.addr1 = getelementptr [64 x i16], [64 x i16]* %0, i64 0, i64 %7
  %src.addr = getelementptr [128 x i8], [128 x i8]* %1, i64 0, i64 %for.loop.idx1
  %8 = load i8, i8* %src.addr, align 1
  %9 = load i16, i16* %dst.addr1, align 2
  %10 = trunc i64 %6 to i16
  %11 = shl i16 255, %10
  %12 = zext i8 %8 to i16
  %13 = shl i16 %12, %10
  %14 = xor i16 %11, -1
  %15 = and i16 %9, %14
  %16 = or i16 %15, %13
  store i16 %16, i16* %dst.addr1, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 128
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a16641i32.5.6([4161 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, [4161 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, [16641 x i32]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %1 = icmp eq [4161 x i64]* %_0, null
  %2 = icmp eq [16641 x i32]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %4 = udiv i64 %for.loop.idx1, 8321
  %5 = urem i64 %for.loop.idx1, 8321
  %6 = udiv i64 %5, 4161
  %7 = mul i64 32, %6
  %8 = urem i64 %5, 4161
  %dst.addr_01 = getelementptr [4161 x i64], [4161 x i64]* %_0, i64 0, i64 %8
  %dst.addr_12 = getelementptr [4161 x i64], [4161 x i64]* %_1, i64 0, i64 %8
  %src.addr = getelementptr [16641 x i32], [16641 x i32]* %0, i64 0, i64 %for.loop.idx1
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 16641
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a16641i8.23.24([8321 x i16]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [16641 x i8]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %2 = icmp eq [8321 x i16]* %0, null
  %3 = icmp eq [16641 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %5 = udiv i64 %for.loop.idx1, 8321
  %6 = mul i64 8, %5
  %7 = urem i64 %for.loop.idx1, 8321
  %dst.addr1 = getelementptr [8321 x i16], [8321 x i16]* %0, i64 0, i64 %7
  %src.addr = getelementptr [16641 x i8], [16641 x i8]* %1, i64 0, i64 %for.loop.idx1
  %8 = load i8, i8* %src.addr, align 1
  %9 = load i16, i16* %dst.addr1, align 2
  %10 = trunc i64 %6 to i16
  %11 = shl i16 255, %10
  %12 = zext i8 %8 to i16
  %13 = shl i16 %12, %10
  %14 = xor i16 %11, -1
  %15 = and i16 %9, %14
  %16 = or i16 %15, %13
  store i16 %16, i16* %dst.addr1, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 16641
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_in([128 x i8]* noalias readonly "orig.arg.no"="0", [32 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [32 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [128 x i8]* noalias readonly "orig.arg.no"="2", [64 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3", [256 x i8]* noalias readonly "orig.arg.no"="4", [256 x i8]* noalias align 512 "orig.arg.no"="5", [256 x i8]* noalias readonly "orig.arg.no"="6", [256 x i8]* noalias align 512 "orig.arg.no"="7", [16641 x i32]* noalias readonly "orig.arg.no"="8", [4161 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_01, [4161 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_12, [16641 x i8]* noalias readonly "orig.arg.no"="10", [8321 x i16]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="11") #4 {
entry:
  call void @onebyonecpy_hls.p0a128i8.3.4([32 x i16]* align 512 %_0, [32 x i16]* align 512 %_1, [128 x i8]* %0)
  call void @onebyonecpy_hls.p0a128i8.19.20([64 x i16]* align 512 %2, [128 x i8]* %1)
  call fastcc void @onebyonecpy_hls.p0a256i8([256 x i8]* align 512 %4, [256 x i8]* %3)
  call fastcc void @onebyonecpy_hls.p0a256i8([256 x i8]* align 512 %6, [256 x i8]* %5)
  call void @onebyonecpy_hls.p0a16641i32.5.6([4161 x i64]* %_01, [4161 x i64]* %_12, [16641 x i32]* %7)
  call void @onebyonecpy_hls.p0a16641i8.23.24([8321 x i16]* %9, [16641 x i8]* %8)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a128i8.11.12([128 x i8]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [32 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [32 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1) #2 {
entry:
  %1 = icmp eq [128 x i8]* %0, null
  %2 = icmp eq [32 x i16]* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [128 x i8], [128 x i8]* %0, i64 0, i64 %for.loop.idx1
  %4 = udiv i64 %for.loop.idx1, 64
  %5 = urem i64 %for.loop.idx1, 64
  %6 = udiv i64 %5, 32
  %7 = mul i64 8, %6
  %8 = urem i64 %5, 32
  %src.addr_01 = getelementptr [32 x i16], [32 x i16]* %_0, i64 0, i64 %8
  %src.addr_12 = getelementptr [32 x i16], [32 x i16]* %_1, i64 0, i64 %8
  %9 = trunc i64 %4 to i1
  %cond = icmp eq i1 %9, false
  %10 = trunc i64 %7 to i16
  br i1 %cond, label %src.addr.case.0, label %src.addr.case.1

src.addr.case.0:                                  ; preds = %for.loop
  %_013 = load i16, i16* %src.addr_01, align 2
  %11 = lshr i16 %_013, %10
  %12 = trunc i16 %11 to i8
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  call void @llvm.assume(i1 %9)
  %_124 = load i16, i16* %src.addr_12, align 2
  %13 = lshr i16 %_124, %10
  %14 = trunc i16 %13 to i8
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.1, %src.addr.case.0
  %15 = phi i8 [ %12, %src.addr.case.0 ], [ %14, %src.addr.case.1 ]
  store i8 %15, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 128
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a128i8.31.32([128 x i8]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [64 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %2 = icmp eq [128 x i8]* %0, null
  %3 = icmp eq [64 x i16]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [128 x i8], [128 x i8]* %0, i64 0, i64 %for.loop.idx1
  %5 = udiv i64 %for.loop.idx1, 64
  %6 = mul i64 8, %5
  %7 = urem i64 %for.loop.idx1, 64
  %src.addr1 = getelementptr [64 x i16], [64 x i16]* %1, i64 0, i64 %7
  %8 = load i16, i16* %src.addr1, align 2
  %9 = trunc i64 %6 to i16
  %10 = lshr i16 %8, %9
  %11 = trunc i16 %10 to i8
  store i8 %11, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 128
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a16641i32.13.14([16641 x i32]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [4161 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [4161 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1) #2 {
entry:
  %1 = icmp eq [16641 x i32]* %0, null
  %2 = icmp eq [4161 x i64]* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [16641 x i32], [16641 x i32]* %0, i64 0, i64 %for.loop.idx1
  %4 = udiv i64 %for.loop.idx1, 8321
  %5 = urem i64 %for.loop.idx1, 8321
  %6 = udiv i64 %5, 4161
  %7 = mul i64 32, %6
  %8 = urem i64 %5, 4161
  %src.addr_01 = getelementptr [4161 x i64], [4161 x i64]* %_0, i64 0, i64 %8
  %src.addr_12 = getelementptr [4161 x i64], [4161 x i64]* %_1, i64 0, i64 %8
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 16641
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a16641i8.35.36([16641 x i8]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [8321 x i16]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %2 = icmp eq [16641 x i8]* %0, null
  %3 = icmp eq [8321 x i16]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [16641 x i8], [16641 x i8]* %0, i64 0, i64 %for.loop.idx1
  %5 = udiv i64 %for.loop.idx1, 8321
  %6 = mul i64 8, %5
  %7 = urem i64 %for.loop.idx1, 8321
  %src.addr1 = getelementptr [8321 x i16], [8321 x i16]* %1, i64 0, i64 %7
  %8 = load i16, i16* %src.addr1, align 2
  %9 = trunc i64 %6 to i16
  %10 = lshr i16 %8, %9
  %11 = trunc i16 %10 to i8
  store i8 %11, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 16641
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_out([128 x i8]* noalias "orig.arg.no"="0", [32 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [32 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [128 x i8]* noalias "orig.arg.no"="2", [64 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3", [256 x i8]* noalias "orig.arg.no"="4", [256 x i8]* noalias readonly align 512 "orig.arg.no"="5", [256 x i8]* noalias "orig.arg.no"="6", [256 x i8]* noalias readonly align 512 "orig.arg.no"="7", [16641 x i32]* noalias "orig.arg.no"="8", [4161 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_01, [4161 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_12, [16641 x i8]* noalias "orig.arg.no"="10", [8321 x i16]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="11") #5 {
entry:
  call void @onebyonecpy_hls.p0a128i8.11.12([128 x i8]* %0, [32 x i16]* align 512 %_0, [32 x i16]* align 512 %_1)
  call void @onebyonecpy_hls.p0a128i8.31.32([128 x i8]* %1, [64 x i16]* align 512 %2)
  call fastcc void @onebyonecpy_hls.p0a256i8([256 x i8]* %3, [256 x i8]* align 512 %4)
  call fastcc void @onebyonecpy_hls.p0a256i8([256 x i8]* %5, [256 x i8]* align 512 %6)
  call void @onebyonecpy_hls.p0a16641i32.13.14([16641 x i32]* %7, [4161 x i64]* %_01, [4161 x i64]* %_12)
  call void @onebyonecpy_hls.p0a16641i8.35.36([16641 x i8]* %8, [8321 x i16]* %9)
  ret void
}

declare void @apatb_needwun_hw([32 x i16]*, [32 x i16]*, [64 x i16]*, i8*, i8*, [4161 x i64]*, [4161 x i64]*, [8321 x i16]*)

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_back([128 x i8]* noalias "orig.arg.no"="0", [32 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [32 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [128 x i8]* noalias "orig.arg.no"="2", [64 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3", [256 x i8]* noalias "orig.arg.no"="4", [256 x i8]* noalias readonly align 512 "orig.arg.no"="5", [256 x i8]* noalias "orig.arg.no"="6", [256 x i8]* noalias readonly align 512 "orig.arg.no"="7", [16641 x i32]* noalias "orig.arg.no"="8", [4161 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_01, [4161 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_12, [16641 x i8]* noalias "orig.arg.no"="10", [8321 x i16]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="11") #5 {
entry:
  call fastcc void @onebyonecpy_hls.p0a256i8([256 x i8]* %3, [256 x i8]* align 512 %4)
  call fastcc void @onebyonecpy_hls.p0a256i8([256 x i8]* %5, [256 x i8]* align 512 %6)
  call void @onebyonecpy_hls.p0a16641i32.13.14([16641 x i32]* %7, [4161 x i64]* %_01, [4161 x i64]* %_12)
  call void @onebyonecpy_hls.p0a16641i8.35.36([16641 x i8]* %8, [8321 x i16]* %9)
  ret void
}

define void @needwun_hw_stub_wrapper([32 x i16]*, [32 x i16]*, [64 x i16]*, i8*, i8*, [4161 x i64]*, [4161 x i64]*, [8321 x i16]*) #6 {
entry:
  %8 = alloca [128 x i8]
  %9 = alloca [128 x i8]
  %malloccall = tail call i8* @malloc(i64 66564)
  %10 = bitcast i8* %malloccall to [16641 x i32]*
  %malloccall1 = tail call i8* @malloc(i64 16641)
  %11 = bitcast i8* %malloccall1 to [16641 x i8]*
  %12 = bitcast i8* %3 to [256 x i8]*
  %13 = bitcast i8* %4 to [256 x i8]*
  call void @copy_out([128 x i8]* %8, [32 x i16]* %0, [32 x i16]* %1, [128 x i8]* %9, [64 x i16]* %2, [256 x i8]* null, [256 x i8]* %12, [256 x i8]* null, [256 x i8]* %13, [16641 x i32]* %10, [4161 x i64]* %5, [4161 x i64]* %6, [16641 x i8]* %11, [8321 x i16]* %7)
  %14 = bitcast [128 x i8]* %8 to i8*
  %15 = bitcast [128 x i8]* %9 to i8*
  %16 = bitcast [256 x i8]* %12 to i8*
  %17 = bitcast [256 x i8]* %13 to i8*
  %18 = bitcast [16641 x i32]* %10 to i32*
  %19 = bitcast [16641 x i8]* %11 to i8*
  call void @needwun_hw_stub(i8* %14, i8* %15, i8* %16, i8* %17, i32* %18, i8* %19)
  call void @copy_in([128 x i8]* %8, [32 x i16]* %0, [32 x i16]* %1, [128 x i8]* %9, [64 x i16]* %2, [256 x i8]* null, [256 x i8]* %12, [256 x i8]* null, [256 x i8]* %13, [16641 x i32]* %10, [4161 x i64]* %5, [4161 x i64]* %6, [16641 x i8]* %11, [8321 x i16]* %7)
  ret void
}

declare void @needwun_hw_stub(i8*, i8*, i8*, i8*, i32*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #5 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }
attributes #7 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="2305843009213693951" }
attributes #8 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="576460752303423487" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = !DILocation(line: 11, column: 9, scope: !6)
!6 = !DILexicalBlockFile(scope: !8, file: !7, discriminator: 0)
!7 = !DIFile(filename: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/nw/nw/dir_test.tcl", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/nw/nw")
!8 = distinct !DISubprogram(name: "needwun", scope: !9, file: !9, line: 13, type: !10, isLocal: false, isDefinition: true, scopeLine: 15, flags: DIFlagPrototyped, isOptimized: false, unit: !16, variables: !4)
!9 = !DIFile(filename: "nw.c", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/nw/nw")
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12, !12, !12, !12, !14, !12}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = distinct !DICompileUnit(language: DW_LANG_C99, file: !17, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4)
!17 = !DIFile(filename: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/nw/nw/prj/solution/.autopilot/db/nw.pp.0.c", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/nw/nw")
!18 = !DILocation(line: 13, column: 9, scope: !6)
!19 = !DILocation(line: 18, column: 9, scope: !6)
!20 = !DILocation(line: 20, column: 9, scope: !6)

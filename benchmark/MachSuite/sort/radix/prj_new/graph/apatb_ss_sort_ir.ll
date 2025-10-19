; ModuleID = '/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/sort/radix/prj/solution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_ss_sort_ir(i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="2048" %a, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="2048" %b, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="2048" %bucket, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="128" %sum) local_unnamed_addr #1 {
entry:
  %malloccall_0 = call i8* @malloc(i64 4096)
  %malloccall_1 = call i8* @malloc(i64 4096)
  %a_copy_07 = bitcast i8* %malloccall_0 to [512 x i64]*
  %a_copy_18 = bitcast i8* %malloccall_1 to [512 x i64]*
  %malloccall1_0 = call i8* @malloc(i64 4096)
  %malloccall1_1 = call i8* @malloc(i64 4096)
  %b_copy_09 = bitcast i8* %malloccall1_0 to [512 x i64]*
  %b_copy_110 = bitcast i8* %malloccall1_1 to [512 x i64]*
  %malloccall2_0 = call i8* @malloc(i64 4096)
  %malloccall2_1 = call i8* @malloc(i64 4096)
  %bucket_copy_011 = bitcast i8* %malloccall2_0 to [512 x i64]*
  %bucket_copy_112 = bitcast i8* %malloccall2_1 to [512 x i64]*
  %sum_copy_013 = alloca [32 x i64], align 512
  %sum_copy_114 = alloca [32 x i64], align 512
  %0 = bitcast i32* %a to [2048 x i32]*
  %1 = bitcast i32* %b to [2048 x i32]*
  %2 = bitcast i32* %bucket to [2048 x i32]*
  %3 = bitcast i32* %sum to [128 x i32]*
  call void @copy_in([2048 x i32]* nonnull %0, [512 x i64]* %a_copy_07, [512 x i64]* %a_copy_18, [2048 x i32]* nonnull %1, [512 x i64]* %b_copy_09, [512 x i64]* %b_copy_110, [2048 x i32]* nonnull %2, [512 x i64]* %bucket_copy_011, [512 x i64]* %bucket_copy_112, [128 x i32]* nonnull %3, [32 x i64]* nonnull align 512 %sum_copy_013, [32 x i64]* nonnull align 512 %sum_copy_114)
  %_015 = getelementptr [512 x i64], [512 x i64]* %a_copy_07, i32 0, i32 0
  %_116 = getelementptr [512 x i64], [512 x i64]* %a_copy_18, i32 0, i32 0
  %_0317 = getelementptr [512 x i64], [512 x i64]* %b_copy_09, i32 0, i32 0
  %_1418 = getelementptr [512 x i64], [512 x i64]* %b_copy_110, i32 0, i32 0
  %_0519 = getelementptr [512 x i64], [512 x i64]* %bucket_copy_011, i32 0, i32 0
  %_1620 = getelementptr [512 x i64], [512 x i64]* %bucket_copy_112, i32 0, i32 0
  %sum_copy.gep_021 = getelementptr [32 x i64], [32 x i64]* %sum_copy_013, i64 0, i32 0
  %sum_copy.gep_122 = getelementptr [32 x i64], [32 x i64]* %sum_copy_114, i64 0, i32 0
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i64* %_015, i32 0, i32 1, i32 0, i1 false) ], !dbg !5
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i64* %_116, i32 0, i32 1, i32 0, i1 false) ], !dbg !5
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i64* %_0317, i32 0, i32 1, i32 0, i1 false) ], !dbg !16
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i64* %_1418, i32 0, i32 1, i32 0, i1 false) ], !dbg !16
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i64* %_0519, i32 0, i32 1, i32 0, i1 false) ], !dbg !17
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i64* %_1620, i32 0, i32 1, i32 0, i1 false) ], !dbg !17
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i64* %sum_copy.gep_021, i32 0, i32 1, i32 0, i1 false) ], !dbg !18
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i64* %sum_copy.gep_122, i32 0, i32 1, i32 0, i1 false) ], !dbg !18
  call void @apatb_ss_sort_hw([512 x i64]* %a_copy_07, [512 x i64]* %a_copy_18, [512 x i64]* %b_copy_09, [512 x i64]* %b_copy_110, [512 x i64]* %bucket_copy_011, [512 x i64]* %bucket_copy_112, [32 x i64]* %sum_copy_013, [32 x i64]* %sum_copy_114)
  call void @copy_back([2048 x i32]* %0, [512 x i64]* %a_copy_07, [512 x i64]* %a_copy_18, [2048 x i32]* %1, [512 x i64]* %b_copy_09, [512 x i64]* %b_copy_110, [2048 x i32]* %2, [512 x i64]* %bucket_copy_011, [512 x i64]* %bucket_copy_112, [128 x i32]* %3, [32 x i64]* %sum_copy_013, [32 x i64]* %sum_copy_114)
  call void @free(i8* %malloccall_0)
  call void @free(i8* %malloccall_1)
  call void @free(i8* %malloccall1_0)
  call void @free(i8* %malloccall1_1)
  call void @free(i8* %malloccall2_0)
  call void @free(i8* %malloccall2_1)
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %_015, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %_116, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %_0317, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %_1418, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %_0519, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %_1620, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %sum_copy.gep_021, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %sum_copy.gep_122, i32 0, i32 1, i32 0) ]
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: nounwind
declare void @llvm.assume(i1) #2

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a2048i32.9.10([512 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, [512 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, [2048 x i32]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #3 {
entry:
  %1 = icmp eq [512 x i64]* %_0, null
  %2 = icmp eq [2048 x i32]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %4 = udiv i64 %for.loop.idx1, 1024
  %5 = urem i64 %for.loop.idx1, 1024
  %6 = udiv i64 %5, 512
  %7 = mul i64 32, %6
  %8 = urem i64 %5, 512
  %dst.addr_01 = getelementptr [512 x i64], [512 x i64]* %_0, i64 0, i64 %8
  %dst.addr_12 = getelementptr [512 x i64], [512 x i64]* %_1, i64 0, i64 %8
  %src.addr = getelementptr [2048 x i32], [2048 x i32]* %0, i64 0, i64 %for.loop.idx1
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 2048
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a128i32.11.12([32 x i64]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, [32 x i64]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, [128 x i32]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #3 {
entry:
  %1 = icmp eq [32 x i64]* %_0, null
  %2 = icmp eq [128 x i32]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %4 = udiv i64 %for.loop.idx1, 64
  %5 = urem i64 %for.loop.idx1, 64
  %6 = udiv i64 %5, 32
  %7 = mul i64 32, %6
  %8 = urem i64 %5, 32
  %dst.addr_01 = getelementptr [32 x i64], [32 x i64]* %_0, i64 0, i64 %8
  %dst.addr_12 = getelementptr [32 x i64], [32 x i64]* %_1, i64 0, i64 %8
  %src.addr = getelementptr [128 x i32], [128 x i32]* %0, i64 0, i64 %for.loop.idx1
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 128
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_in([2048 x i32]* noalias readonly "orig.arg.no"="0", [512 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [512 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [2048 x i32]* noalias readonly "orig.arg.no"="2", [512 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_01, [512 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_12, [2048 x i32]* noalias readonly "orig.arg.no"="4", [512 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_03, [512 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_14, [128 x i32]* noalias readonly "orig.arg.no"="6", [32 x i64]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_05, [32 x i64]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_16) #4 {
entry:
  call void @onebyonecpy_hls.p0a2048i32.9.10([512 x i64]* %_0, [512 x i64]* %_1, [2048 x i32]* %0)
  call void @onebyonecpy_hls.p0a2048i32.9.10([512 x i64]* %_01, [512 x i64]* %_12, [2048 x i32]* %1)
  call void @onebyonecpy_hls.p0a2048i32.9.10([512 x i64]* %_03, [512 x i64]* %_14, [2048 x i32]* %2)
  call void @onebyonecpy_hls.p0a128i32.11.12([32 x i64]* align 512 %_05, [32 x i64]* align 512 %_16, [128 x i32]* %3)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a2048i32.29.30([2048 x i32]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [512 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [512 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1) #3 {
entry:
  %1 = icmp eq [2048 x i32]* %0, null
  %2 = icmp eq [512 x i64]* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [2048 x i32], [2048 x i32]* %0, i64 0, i64 %for.loop.idx1
  %4 = udiv i64 %for.loop.idx1, 1024
  %5 = urem i64 %for.loop.idx1, 1024
  %6 = udiv i64 %5, 512
  %7 = mul i64 32, %6
  %8 = urem i64 %5, 512
  %src.addr_01 = getelementptr [512 x i64], [512 x i64]* %_0, i64 0, i64 %8
  %src.addr_12 = getelementptr [512 x i64], [512 x i64]* %_1, i64 0, i64 %8
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 2048
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a128i32.31.32([128 x i32]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [32 x i64]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [32 x i64]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1) #3 {
entry:
  %1 = icmp eq [128 x i32]* %0, null
  %2 = icmp eq [32 x i64]* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [128 x i32], [128 x i32]* %0, i64 0, i64 %for.loop.idx1
  %4 = udiv i64 %for.loop.idx1, 64
  %5 = urem i64 %for.loop.idx1, 64
  %6 = udiv i64 %5, 32
  %7 = mul i64 32, %6
  %8 = urem i64 %5, 32
  %src.addr_01 = getelementptr [32 x i64], [32 x i64]* %_0, i64 0, i64 %8
  %src.addr_12 = getelementptr [32 x i64], [32 x i64]* %_1, i64 0, i64 %8
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 128
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_out([2048 x i32]* noalias "orig.arg.no"="0", [512 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [512 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [2048 x i32]* noalias "orig.arg.no"="2", [512 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_01, [512 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_12, [2048 x i32]* noalias "orig.arg.no"="4", [512 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_03, [512 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_14, [128 x i32]* noalias "orig.arg.no"="6", [32 x i64]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_05, [32 x i64]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_16) #5 {
entry:
  call void @onebyonecpy_hls.p0a2048i32.29.30([2048 x i32]* %0, [512 x i64]* %_0, [512 x i64]* %_1)
  call void @onebyonecpy_hls.p0a2048i32.29.30([2048 x i32]* %1, [512 x i64]* %_01, [512 x i64]* %_12)
  call void @onebyonecpy_hls.p0a2048i32.29.30([2048 x i32]* %2, [512 x i64]* %_03, [512 x i64]* %_14)
  call void @onebyonecpy_hls.p0a128i32.31.32([128 x i32]* %3, [32 x i64]* align 512 %_05, [32 x i64]* align 512 %_16)
  ret void
}

declare void @apatb_ss_sort_hw([512 x i64]*, [512 x i64]*, [512 x i64]*, [512 x i64]*, [512 x i64]*, [512 x i64]*, [32 x i64]*, [32 x i64]*)

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_back([2048 x i32]* noalias "orig.arg.no"="0", [512 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [512 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [2048 x i32]* noalias "orig.arg.no"="2", [512 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_01, [512 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_12, [2048 x i32]* noalias "orig.arg.no"="4", [512 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_03, [512 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_14, [128 x i32]* noalias "orig.arg.no"="6", [32 x i64]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_05, [32 x i64]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_16) #5 {
entry:
  call void @onebyonecpy_hls.p0a2048i32.29.30([2048 x i32]* %0, [512 x i64]* %_0, [512 x i64]* %_1)
  call void @onebyonecpy_hls.p0a2048i32.29.30([2048 x i32]* %1, [512 x i64]* %_01, [512 x i64]* %_12)
  call void @onebyonecpy_hls.p0a2048i32.29.30([2048 x i32]* %2, [512 x i64]* %_03, [512 x i64]* %_14)
  call void @onebyonecpy_hls.p0a128i32.31.32([128 x i32]* %3, [32 x i64]* align 512 %_05, [32 x i64]* align 512 %_16)
  ret void
}

define void @ss_sort_hw_stub_wrapper([512 x i64]*, [512 x i64]*, [512 x i64]*, [512 x i64]*, [512 x i64]*, [512 x i64]*, [32 x i64]*, [32 x i64]*) #6 {
entry:
  %malloccall = tail call i8* @malloc(i64 8192)
  %8 = bitcast i8* %malloccall to [2048 x i32]*
  %malloccall1 = tail call i8* @malloc(i64 8192)
  %9 = bitcast i8* %malloccall1 to [2048 x i32]*
  %malloccall2 = tail call i8* @malloc(i64 8192)
  %10 = bitcast i8* %malloccall2 to [2048 x i32]*
  %11 = alloca [128 x i32]
  call void @copy_out([2048 x i32]* %8, [512 x i64]* %0, [512 x i64]* %1, [2048 x i32]* %9, [512 x i64]* %2, [512 x i64]* %3, [2048 x i32]* %10, [512 x i64]* %4, [512 x i64]* %5, [128 x i32]* %11, [32 x i64]* %6, [32 x i64]* %7)
  %12 = bitcast [2048 x i32]* %8 to i32*
  %13 = bitcast [2048 x i32]* %9 to i32*
  %14 = bitcast [2048 x i32]* %10 to i32*
  %15 = bitcast [128 x i32]* %11 to i32*
  call void @ss_sort_hw_stub(i32* %12, i32* %13, i32* %14, i32* %15)
  call void @copy_in([2048 x i32]* %8, [512 x i64]* %0, [512 x i64]* %1, [2048 x i32]* %9, [512 x i64]* %2, [512 x i64]* %3, [2048 x i32]* %10, [512 x i64]* %4, [512 x i64]* %5, [128 x i32]* %11, [32 x i64]* %6, [32 x i64]* %7)
  ret void
}

declare void @ss_sort_hw_stub(i32*, i32*, i32*, i32*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { nounwind }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
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
!5 = !DILocation(line: 22, column: 9, scope: !6)
!6 = !DILexicalBlockFile(scope: !8, file: !7, discriminator: 0)
!7 = !DIFile(filename: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/sort/radix/dir_test.tcl", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/sort/radix")
!8 = distinct !DISubprogram(name: "ss_sort", scope: !9, file: !9, line: 78, type: !10, isLocal: false, isDefinition: true, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false, unit: !14, variables: !4)
!9 = !DIFile(filename: "sort.c", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/sort/radix")
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12, !12, !12, !12}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = distinct !DICompileUnit(language: DW_LANG_C99, file: !15, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4)
!15 = !DIFile(filename: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/sort/radix/prj/solution/.autopilot/db/sort.pp.0.c", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/sort/radix")
!16 = !DILocation(line: 24, column: 9, scope: !6)
!17 = !DILocation(line: 26, column: 9, scope: !6)
!18 = !DILocation(line: 28, column: 9, scope: !6)

; ModuleID = '/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/viterbi/viterbi/prj/solution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define i32 @apatb_viterbi_ir(i8* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="140" %obs, double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="64" %init, double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %transition, double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %emission, i8* noalias nocapture nonnull "fpga.decayed.dim.hint"="140" %path) local_unnamed_addr #1 {
entry:
  %obs_copy4 = alloca [70 x i16], align 512
  %init_copy_05 = alloca [16 x i128], align 512
  %init_copy_16 = alloca [16 x i128], align 512
  %malloccall_0 = call i8* @malloc(i64 16384)
  %malloccall_1 = call i8* @malloc(i64 16384)
  %transition_copy_07 = bitcast i8* %malloccall_0 to [1024 x i128]*
  %transition_copy_18 = bitcast i8* %malloccall_1 to [1024 x i128]*
  %malloccall1_0 = call i8* @malloc(i64 16384)
  %malloccall1_1 = call i8* @malloc(i64 16384)
  %emission_copy_09 = bitcast i8* %malloccall1_0 to [1024 x i128]*
  %emission_copy_110 = bitcast i8* %malloccall1_1 to [1024 x i128]*
  %path_copy11 = alloca [70 x i16], align 512
  %0 = bitcast i8* %obs to [140 x i8]*
  %1 = bitcast double* %init to [64 x double]*
  %2 = bitcast double* %transition to [4096 x double]*
  %3 = bitcast double* %emission to [4096 x double]*
  %4 = bitcast i8* %path to [140 x i8]*
  call void @copy_in([140 x i8]* nonnull %0, [70 x i16]* nonnull align 512 %obs_copy4, [64 x double]* nonnull %1, [16 x i128]* nonnull align 512 %init_copy_05, [16 x i128]* nonnull align 512 %init_copy_16, [4096 x double]* nonnull %2, [1024 x i128]* %transition_copy_07, [1024 x i128]* %transition_copy_18, [4096 x double]* nonnull %3, [1024 x i128]* %emission_copy_09, [1024 x i128]* %emission_copy_110, [140 x i8]* nonnull %4, [70 x i16]* nonnull align 512 %path_copy11)
  %obs_copy.gep12 = getelementptr [70 x i16], [70 x i16]* %obs_copy4, i64 0, i32 0
  %init_copy.gep_013 = getelementptr [16 x i128], [16 x i128]* %init_copy_05, i64 0, i32 0
  %init_copy.gep_114 = getelementptr [16 x i128], [16 x i128]* %init_copy_16, i64 0, i32 0
  %_015 = getelementptr [1024 x i128], [1024 x i128]* %transition_copy_07, i32 0, i32 0
  %_116 = getelementptr [1024 x i128], [1024 x i128]* %transition_copy_18, i32 0, i32 0
  %_0217 = getelementptr [1024 x i128], [1024 x i128]* %emission_copy_09, i32 0, i32 0
  %_1318 = getelementptr [1024 x i128], [1024 x i128]* %emission_copy_110, i32 0, i32 0
  %path_copy.gep19 = getelementptr [70 x i16], [70 x i16]* %path_copy11, i64 0, i32 0
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i16* %obs_copy.gep12, i32 0, i32 1, i32 0) ], !dbg !5
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %init_copy.gep_013, i32 0, i32 1, i32 0, i1 false) ], !dbg !28
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %init_copy.gep_114, i32 0, i32 1, i32 0, i1 false) ], !dbg !28
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %_015, i32 0, i32 1, i32 0, i1 false) ], !dbg !29
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %_116, i32 0, i32 1, i32 0, i1 false) ], !dbg !29
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %_0217, i32 0, i32 1, i32 0, i1 false) ], !dbg !30
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %_1318, i32 0, i32 1, i32 0, i1 false) ], !dbg !30
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i16* %path_copy.gep19, i32 0, i32 1, i32 0) ], !dbg !31
  %5 = call i32 @apatb_viterbi_hw([70 x i16]* %obs_copy4, [16 x i128]* %init_copy_05, [16 x i128]* %init_copy_16, [1024 x i128]* %transition_copy_07, [1024 x i128]* %transition_copy_18, [1024 x i128]* %emission_copy_09, [1024 x i128]* %emission_copy_110, [70 x i16]* %path_copy11)
  call void @copy_back([140 x i8]* %0, [70 x i16]* %obs_copy4, [64 x double]* %1, [16 x i128]* %init_copy_05, [16 x i128]* %init_copy_16, [4096 x double]* %2, [1024 x i128]* %transition_copy_07, [1024 x i128]* %transition_copy_18, [4096 x double]* %3, [1024 x i128]* %emission_copy_09, [1024 x i128]* %emission_copy_110, [140 x i8]* %4, [70 x i16]* %path_copy11)
  call void @free(i8* %malloccall_0)
  call void @free(i8* %malloccall_1)
  call void @free(i8* %malloccall1_0)
  call void @free(i8* %malloccall1_1)
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %init_copy.gep_013, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %init_copy.gep_114, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %_015, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %_116, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %_0217, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %_1318, i32 0, i32 1, i32 0) ]
  ret i32 %5
}

declare noalias i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: nounwind
declare void @llvm.assume(i1) #2

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a140i8.17.18([70 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [140 x i8]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #3 {
entry:
  %2 = icmp eq [70 x i16]* %0, null
  %3 = icmp eq [140 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %5 = udiv i64 %for.loop.idx1, 70
  %6 = mul i64 8, %5
  %7 = urem i64 %for.loop.idx1, 70
  %dst.addr1 = getelementptr [70 x i16], [70 x i16]* %0, i64 0, i64 %7
  %src.addr = getelementptr [140 x i8], [140 x i8]* %1, i64 0, i64 %for.loop.idx1
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 140
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a64f64.3.4([16 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, [16 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, [64 x double]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #3 {
entry:
  %1 = icmp eq [16 x i128]* %_0, null
  %2 = icmp eq [64 x double]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %4 = udiv i64 %for.loop.idx1, 32
  %5 = urem i64 %for.loop.idx1, 32
  %6 = udiv i64 %5, 16
  %7 = mul i64 64, %6
  %8 = urem i64 %5, 16
  %dst.addr_01 = getelementptr [16 x i128], [16 x i128]* %_0, i64 0, i64 %8
  %dst.addr_12 = getelementptr [16 x i128], [16 x i128]* %_1, i64 0, i64 %8
  %src.addr = getelementptr [64 x double], [64 x double]* %0, i64 0, i64 %for.loop.idx1
  %9 = load double, double* %src.addr, align 8
  %10 = trunc i64 %4 to i1
  %cond = icmp eq i1 %10, false
  %11 = bitcast double %9 to i64
  %12 = zext i64 %7 to i128
  %13 = shl i128 18446744073709551615, %12
  %14 = zext i64 %11 to i128
  %15 = shl i128 %14, %12
  %16 = xor i128 %13, -1
  br i1 %cond, label %dst.addr.case.0, label %dst.addr.case.1

dst.addr.case.0:                                  ; preds = %for.loop
  %17 = load i128, i128* %dst.addr_01, align 16
  %18 = and i128 %17, %16
  %19 = or i128 %18, %15
  store i128 %19, i128* %dst.addr_01, align 16
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  call void @llvm.assume(i1 %10)
  %20 = load i128, i128* %dst.addr_12, align 16
  %21 = and i128 %20, %16
  %22 = or i128 %21, %15
  store i128 %22, i128* %dst.addr_12, align 16
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 64
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a4096f64.5.6([1024 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, [1024 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, [4096 x double]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #3 {
entry:
  %1 = icmp eq [1024 x i128]* %_0, null
  %2 = icmp eq [4096 x double]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %4 = udiv i64 %for.loop.idx1, 2048
  %5 = urem i64 %for.loop.idx1, 2048
  %6 = udiv i64 %5, 1024
  %7 = mul i64 64, %6
  %8 = urem i64 %5, 1024
  %dst.addr_01 = getelementptr [1024 x i128], [1024 x i128]* %_0, i64 0, i64 %8
  %dst.addr_12 = getelementptr [1024 x i128], [1024 x i128]* %_1, i64 0, i64 %8
  %src.addr = getelementptr [4096 x double], [4096 x double]* %0, i64 0, i64 %for.loop.idx1
  %9 = load double, double* %src.addr, align 8
  %10 = trunc i64 %4 to i1
  %cond = icmp eq i1 %10, false
  %11 = bitcast double %9 to i64
  %12 = zext i64 %7 to i128
  %13 = shl i128 18446744073709551615, %12
  %14 = zext i64 %11 to i128
  %15 = shl i128 %14, %12
  %16 = xor i128 %13, -1
  br i1 %cond, label %dst.addr.case.0, label %dst.addr.case.1

dst.addr.case.0:                                  ; preds = %for.loop
  %17 = load i128, i128* %dst.addr_01, align 16
  %18 = and i128 %17, %16
  %19 = or i128 %18, %15
  store i128 %19, i128* %dst.addr_01, align 16
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  call void @llvm.assume(i1 %10)
  %20 = load i128, i128* %dst.addr_12, align 16
  %21 = and i128 %20, %16
  %22 = or i128 %21, %15
  store i128 %22, i128* %dst.addr_12, align 16
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4096
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_in([140 x i8]* noalias readonly "orig.arg.no"="0", [70 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1", [64 x double]* noalias readonly "orig.arg.no"="2", [16 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_0, [16 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_1, [4096 x double]* noalias readonly "orig.arg.no"="4", [1024 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_01, [1024 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_12, [4096 x double]* noalias readonly "orig.arg.no"="6", [1024 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_03, [1024 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_14, [140 x i8]* noalias readonly "orig.arg.no"="8", [70 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9") #4 {
entry:
  call void @onebyonecpy_hls.p0a140i8.17.18([70 x i16]* align 512 %1, [140 x i8]* %0)
  call void @onebyonecpy_hls.p0a64f64.3.4([16 x i128]* align 512 %_0, [16 x i128]* align 512 %_1, [64 x double]* %2)
  call void @onebyonecpy_hls.p0a4096f64.5.6([1024 x i128]* %_01, [1024 x i128]* %_12, [4096 x double]* %3)
  call void @onebyonecpy_hls.p0a4096f64.5.6([1024 x i128]* %_03, [1024 x i128]* %_14, [4096 x double]* %4)
  call void @onebyonecpy_hls.p0a140i8.17.18([70 x i16]* align 512 %6, [140 x i8]* %5)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a140i8.27.28([140 x i8]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [70 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #3 {
entry:
  %2 = icmp eq [140 x i8]* %0, null
  %3 = icmp eq [70 x i16]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [140 x i8], [140 x i8]* %0, i64 0, i64 %for.loop.idx1
  %5 = udiv i64 %for.loop.idx1, 70
  %6 = mul i64 8, %5
  %7 = urem i64 %for.loop.idx1, 70
  %src.addr1 = getelementptr [70 x i16], [70 x i16]* %1, i64 0, i64 %7
  %8 = load i16, i16* %src.addr1, align 2
  %9 = trunc i64 %6 to i16
  %10 = lshr i16 %8, %9
  %11 = trunc i16 %10 to i8
  store i8 %11, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 140
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a64f64.11.12([64 x double]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [16 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [16 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1) #3 {
entry:
  %1 = icmp eq [64 x double]* %0, null
  %2 = icmp eq [16 x i128]* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [64 x double], [64 x double]* %0, i64 0, i64 %for.loop.idx1
  %4 = udiv i64 %for.loop.idx1, 32
  %5 = urem i64 %for.loop.idx1, 32
  %6 = udiv i64 %5, 16
  %7 = mul i64 64, %6
  %8 = urem i64 %5, 16
  %src.addr_01 = getelementptr [16 x i128], [16 x i128]* %_0, i64 0, i64 %8
  %src.addr_12 = getelementptr [16 x i128], [16 x i128]* %_1, i64 0, i64 %8
  %9 = trunc i64 %4 to i1
  %cond = icmp eq i1 %9, false
  %10 = zext i64 %7 to i128
  br i1 %cond, label %src.addr.case.0, label %src.addr.case.1

src.addr.case.0:                                  ; preds = %for.loop
  %_013 = load i128, i128* %src.addr_01, align 16
  %11 = lshr i128 %_013, %10
  %12 = trunc i128 %11 to i64
  %13 = bitcast i64 %12 to double
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  call void @llvm.assume(i1 %9)
  %_124 = load i128, i128* %src.addr_12, align 16
  %14 = lshr i128 %_124, %10
  %15 = trunc i128 %14 to i64
  %16 = bitcast i64 %15 to double
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.1, %src.addr.case.0
  %17 = phi double [ %13, %src.addr.case.0 ], [ %16, %src.addr.case.1 ]
  store double %17, double* %dst.addr, align 8
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 64
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a4096f64.13.14([4096 x double]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [1024 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [1024 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1) #3 {
entry:
  %1 = icmp eq [4096 x double]* %0, null
  %2 = icmp eq [1024 x i128]* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [4096 x double], [4096 x double]* %0, i64 0, i64 %for.loop.idx1
  %4 = udiv i64 %for.loop.idx1, 2048
  %5 = urem i64 %for.loop.idx1, 2048
  %6 = udiv i64 %5, 1024
  %7 = mul i64 64, %6
  %8 = urem i64 %5, 1024
  %src.addr_01 = getelementptr [1024 x i128], [1024 x i128]* %_0, i64 0, i64 %8
  %src.addr_12 = getelementptr [1024 x i128], [1024 x i128]* %_1, i64 0, i64 %8
  %9 = trunc i64 %4 to i1
  %cond = icmp eq i1 %9, false
  %10 = zext i64 %7 to i128
  br i1 %cond, label %src.addr.case.0, label %src.addr.case.1

src.addr.case.0:                                  ; preds = %for.loop
  %_013 = load i128, i128* %src.addr_01, align 16
  %11 = lshr i128 %_013, %10
  %12 = trunc i128 %11 to i64
  %13 = bitcast i64 %12 to double
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  call void @llvm.assume(i1 %9)
  %_124 = load i128, i128* %src.addr_12, align 16
  %14 = lshr i128 %_124, %10
  %15 = trunc i128 %14 to i64
  %16 = bitcast i64 %15 to double
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.1, %src.addr.case.0
  %17 = phi double [ %13, %src.addr.case.0 ], [ %16, %src.addr.case.1 ]
  store double %17, double* %dst.addr, align 8
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4096
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_out([140 x i8]* noalias "orig.arg.no"="0", [70 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1", [64 x double]* noalias "orig.arg.no"="2", [16 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_0, [16 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_1, [4096 x double]* noalias "orig.arg.no"="4", [1024 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_01, [1024 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_12, [4096 x double]* noalias "orig.arg.no"="6", [1024 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_03, [1024 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_14, [140 x i8]* noalias "orig.arg.no"="8", [70 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9") #5 {
entry:
  call void @onebyonecpy_hls.p0a140i8.27.28([140 x i8]* %0, [70 x i16]* align 512 %1)
  call void @onebyonecpy_hls.p0a64f64.11.12([64 x double]* %2, [16 x i128]* align 512 %_0, [16 x i128]* align 512 %_1)
  call void @onebyonecpy_hls.p0a4096f64.13.14([4096 x double]* %3, [1024 x i128]* %_01, [1024 x i128]* %_12)
  call void @onebyonecpy_hls.p0a4096f64.13.14([4096 x double]* %4, [1024 x i128]* %_03, [1024 x i128]* %_14)
  call void @onebyonecpy_hls.p0a140i8.27.28([140 x i8]* %5, [70 x i16]* align 512 %6)
  ret void
}

declare i32 @apatb_viterbi_hw([70 x i16]*, [16 x i128]*, [16 x i128]*, [1024 x i128]*, [1024 x i128]*, [1024 x i128]*, [1024 x i128]*, [70 x i16]*)

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_back([140 x i8]* noalias "orig.arg.no"="0", [70 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1", [64 x double]* noalias "orig.arg.no"="2", [16 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_0, [16 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_1, [4096 x double]* noalias "orig.arg.no"="4", [1024 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_01, [1024 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_12, [4096 x double]* noalias "orig.arg.no"="6", [1024 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_03, [1024 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_14, [140 x i8]* noalias "orig.arg.no"="8", [70 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9") #5 {
entry:
  call void @onebyonecpy_hls.p0a140i8.27.28([140 x i8]* %5, [70 x i16]* align 512 %6)
  ret void
}

define i32 @viterbi_hw_stub_wrapper([70 x i16]*, [16 x i128]*, [16 x i128]*, [1024 x i128]*, [1024 x i128]*, [1024 x i128]*, [1024 x i128]*, [70 x i16]*) #6 {
entry:
  %8 = alloca [140 x i8]
  %9 = alloca [64 x double]
  %malloccall = tail call i8* @malloc(i64 32768)
  %10 = bitcast i8* %malloccall to [4096 x double]*
  %malloccall1 = tail call i8* @malloc(i64 32768)
  %11 = bitcast i8* %malloccall1 to [4096 x double]*
  %12 = alloca [140 x i8]
  call void @copy_out([140 x i8]* %8, [70 x i16]* %0, [64 x double]* %9, [16 x i128]* %1, [16 x i128]* %2, [4096 x double]* %10, [1024 x i128]* %3, [1024 x i128]* %4, [4096 x double]* %11, [1024 x i128]* %5, [1024 x i128]* %6, [140 x i8]* %12, [70 x i16]* %7)
  %13 = bitcast [140 x i8]* %8 to i8*
  %14 = bitcast [64 x double]* %9 to double*
  %15 = bitcast [4096 x double]* %10 to double*
  %16 = bitcast [4096 x double]* %11 to double*
  %17 = bitcast [140 x i8]* %12 to i8*
  %18 = call i32 @viterbi_hw_stub(i8* %13, double* %14, double* %15, double* %16, i8* %17)
  call void @copy_in([140 x i8]* %8, [70 x i16]* %0, [64 x double]* %9, [16 x i128]* %1, [16 x i128]* %2, [4096 x double]* %10, [1024 x i128]* %3, [1024 x i128]* %4, [4096 x double]* %11, [1024 x i128]* %5, [1024 x i128]* %6, [140 x i8]* %12, [70 x i16]* %7)
  ret i32 %18
}

declare i32 @viterbi_hw_stub(i8*, double*, double*, double*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { nounwind }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #5 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }
attributes #7 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="288230376151711743" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = !DILocation(line: 9, column: 9, scope: !6)
!6 = !DILexicalBlockFile(scope: !8, file: !7, discriminator: 0)
!7 = !DIFile(filename: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/viterbi/viterbi/dir_test.tcl", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/viterbi/viterbi")
!8 = distinct !DISubprogram(name: "viterbi", scope: !9, file: !9, line: 3, type: !10, isLocal: false, isDefinition: true, scopeLine: 4, flags: DIFlagPrototyped, isOptimized: false, unit: !26, variables: !4)
!9 = !DIFile(filename: "viterbi.c", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/viterbi/viterbi")
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !13, !21, !21, !21, !24}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "tok_t", file: !15, line: 13, baseType: !16)
!15 = !DIFile(filename: "./viterbi.h", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/viterbi/viterbi")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !17, line: 24, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/viterbi/viterbi")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !19, line: 38, baseType: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/viterbi/viterbi")
!20 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "prob_t", file: !15, line: 14, baseType: !23)
!23 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "state_t", file: !15, line: 15, baseType: !16)
!26 = distinct !DICompileUnit(language: DW_LANG_C99, file: !27, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4)
!27 = !DIFile(filename: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/viterbi/viterbi/prj/solution/.autopilot/db/viterbi.pp.0.c", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/viterbi/viterbi")
!28 = !DILocation(line: 10, column: 9, scope: !6)
!29 = !DILocation(line: 12, column: 9, scope: !6)
!30 = !DILocation(line: 14, column: 9, scope: !6)
!31 = !DILocation(line: 16, column: 9, scope: !6)

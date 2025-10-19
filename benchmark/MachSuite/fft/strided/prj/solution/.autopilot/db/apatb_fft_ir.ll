; ModuleID = '/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/fft/strided/prj/solution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_fft_ir(double* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %real, double* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %img, double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="512" %real_twid, double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="512" %img_twid) local_unnamed_addr #1 {
entry:
  %malloccall_0 = call i8* @malloc(i64 4096)
  %malloccall_1 = call i8* @malloc(i64 4096)
  %real_copy_010 = bitcast i8* %malloccall_0 to [256 x i128]*
  %real_copy_111 = bitcast i8* %malloccall_1 to [256 x i128]*
  %malloccall1_0 = call i8* @malloc(i64 4096)
  %malloccall1_1 = call i8* @malloc(i64 4096)
  %img_copy_012 = bitcast i8* %malloccall1_0 to [256 x i128]*
  %img_copy_113 = bitcast i8* %malloccall1_1 to [256 x i128]*
  %malloccall2_0 = call i8* @malloc(i64 2048)
  %malloccall2_1 = call i8* @malloc(i64 2048)
  %real_twid_copy_014 = bitcast i8* %malloccall2_0 to [128 x i128]*
  %real_twid_copy_115 = bitcast i8* %malloccall2_1 to [128 x i128]*
  %malloccall3_0 = call i8* @malloc(i64 2048)
  %malloccall3_1 = call i8* @malloc(i64 2048)
  %img_twid_copy_016 = bitcast i8* %malloccall3_0 to [128 x i128]*
  %img_twid_copy_117 = bitcast i8* %malloccall3_1 to [128 x i128]*
  %0 = bitcast double* %real to [1024 x double]*
  %1 = bitcast double* %img to [1024 x double]*
  %2 = bitcast double* %real_twid to [512 x double]*
  %3 = bitcast double* %img_twid to [512 x double]*
  call void @copy_in([1024 x double]* nonnull %0, [256 x i128]* %real_copy_010, [256 x i128]* %real_copy_111, [1024 x double]* nonnull %1, [256 x i128]* %img_copy_012, [256 x i128]* %img_copy_113, [512 x double]* nonnull %2, [128 x i128]* %real_twid_copy_014, [128 x i128]* %real_twid_copy_115, [512 x double]* nonnull %3, [128 x i128]* %img_twid_copy_016, [128 x i128]* %img_twid_copy_117)
  %_018 = getelementptr [256 x i128], [256 x i128]* %real_copy_010, i32 0, i32 0
  %_119 = getelementptr [256 x i128], [256 x i128]* %real_copy_111, i32 0, i32 0
  %_0420 = getelementptr [256 x i128], [256 x i128]* %img_copy_012, i32 0, i32 0
  %_1521 = getelementptr [256 x i128], [256 x i128]* %img_copy_113, i32 0, i32 0
  %_0622 = getelementptr [128 x i128], [128 x i128]* %real_twid_copy_014, i32 0, i32 0
  %_1723 = getelementptr [128 x i128], [128 x i128]* %real_twid_copy_115, i32 0, i32 0
  %_0824 = getelementptr [128 x i128], [128 x i128]* %img_twid_copy_016, i32 0, i32 0
  %_1925 = getelementptr [128 x i128], [128 x i128]* %img_twid_copy_117, i32 0, i32 0
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %_018, i32 0, i32 1, i32 0, i1 false) ], !dbg !5
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %_119, i32 0, i32 1, i32 0, i1 false) ], !dbg !5
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %_0420, i32 0, i32 1, i32 0, i1 false) ], !dbg !16
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %_1521, i32 0, i32 1, i32 0, i1 false) ], !dbg !16
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %_0622, i32 0, i32 1, i32 0, i1 false) ], !dbg !17
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %_1723, i32 0, i32 1, i32 0, i1 false) ], !dbg !17
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %_0824, i32 0, i32 1, i32 0, i1 false) ], !dbg !18
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %_1925, i32 0, i32 1, i32 0, i1 false) ], !dbg !18
  call void @apatb_fft_hw([256 x i128]* %real_copy_010, [256 x i128]* %real_copy_111, [256 x i128]* %img_copy_012, [256 x i128]* %img_copy_113, [128 x i128]* %real_twid_copy_014, [128 x i128]* %real_twid_copy_115, [128 x i128]* %img_twid_copy_016, [128 x i128]* %img_twid_copy_117)
  call void @copy_back([1024 x double]* %0, [256 x i128]* %real_copy_010, [256 x i128]* %real_copy_111, [1024 x double]* %1, [256 x i128]* %img_copy_012, [256 x i128]* %img_copy_113, [512 x double]* %2, [128 x i128]* %real_twid_copy_014, [128 x i128]* %real_twid_copy_115, [512 x double]* %3, [128 x i128]* %img_twid_copy_016, [128 x i128]* %img_twid_copy_117)
  call void @free(i8* %malloccall_0)
  call void @free(i8* %malloccall_1)
  call void @free(i8* %malloccall1_0)
  call void @free(i8* %malloccall1_1)
  call void @free(i8* %malloccall2_0)
  call void @free(i8* %malloccall2_1)
  call void @free(i8* %malloccall3_0)
  call void @free(i8* %malloccall3_1)
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %_018, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %_119, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %_0420, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %_1521, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %_0622, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %_1723, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %_0824, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %_1925, i32 0, i32 1, i32 0) ]
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: nounwind
declare void @llvm.assume(i1) #2

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a1024f64.3.4([256 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, [256 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, [1024 x double]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #3 {
entry:
  %1 = icmp eq [256 x i128]* %_0, null
  %2 = icmp eq [1024 x double]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %4 = udiv i64 %for.loop.idx1, 512
  %5 = urem i64 %for.loop.idx1, 512
  %6 = udiv i64 %5, 256
  %7 = mul i64 64, %6
  %8 = urem i64 %5, 256
  %dst.addr_01 = getelementptr [256 x i128], [256 x i128]* %_0, i64 0, i64 %8
  %dst.addr_12 = getelementptr [256 x i128], [256 x i128]* %_1, i64 0, i64 %8
  %src.addr = getelementptr [1024 x double], [1024 x double]* %0, i64 0, i64 %for.loop.idx1
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 1024
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a512f64.5.6([128 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, [128 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, [512 x double]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #3 {
entry:
  %1 = icmp eq [128 x i128]* %_0, null
  %2 = icmp eq [512 x double]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %4 = udiv i64 %for.loop.idx1, 256
  %5 = urem i64 %for.loop.idx1, 256
  %6 = udiv i64 %5, 128
  %7 = mul i64 64, %6
  %8 = urem i64 %5, 128
  %dst.addr_01 = getelementptr [128 x i128], [128 x i128]* %_0, i64 0, i64 %8
  %dst.addr_12 = getelementptr [128 x i128], [128 x i128]* %_1, i64 0, i64 %8
  %src.addr = getelementptr [512 x double], [512 x double]* %0, i64 0, i64 %for.loop.idx1
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 512
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_in([1024 x double]* noalias readonly "orig.arg.no"="0", [256 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [256 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [1024 x double]* noalias readonly "orig.arg.no"="2", [256 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_01, [256 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_12, [512 x double]* noalias readonly "orig.arg.no"="4", [128 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_03, [128 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_14, [512 x double]* noalias readonly "orig.arg.no"="6", [128 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_05, [128 x i128]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_16) #4 {
entry:
  call void @onebyonecpy_hls.p0a1024f64.3.4([256 x i128]* %_0, [256 x i128]* %_1, [1024 x double]* %0)
  call void @onebyonecpy_hls.p0a1024f64.3.4([256 x i128]* %_01, [256 x i128]* %_12, [1024 x double]* %1)
  call void @onebyonecpy_hls.p0a512f64.5.6([128 x i128]* %_03, [128 x i128]* %_14, [512 x double]* %2)
  call void @onebyonecpy_hls.p0a512f64.5.6([128 x i128]* %_05, [128 x i128]* %_16, [512 x double]* %3)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a1024f64.11.12([1024 x double]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [256 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [256 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1) #3 {
entry:
  %1 = icmp eq [1024 x double]* %0, null
  %2 = icmp eq [256 x i128]* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [1024 x double], [1024 x double]* %0, i64 0, i64 %for.loop.idx1
  %4 = udiv i64 %for.loop.idx1, 512
  %5 = urem i64 %for.loop.idx1, 512
  %6 = udiv i64 %5, 256
  %7 = mul i64 64, %6
  %8 = urem i64 %5, 256
  %src.addr_01 = getelementptr [256 x i128], [256 x i128]* %_0, i64 0, i64 %8
  %src.addr_12 = getelementptr [256 x i128], [256 x i128]* %_1, i64 0, i64 %8
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 1024
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a512f64.13.14([512 x double]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [128 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [128 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1) #3 {
entry:
  %1 = icmp eq [512 x double]* %0, null
  %2 = icmp eq [128 x i128]* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [512 x double], [512 x double]* %0, i64 0, i64 %for.loop.idx1
  %4 = udiv i64 %for.loop.idx1, 256
  %5 = urem i64 %for.loop.idx1, 256
  %6 = udiv i64 %5, 128
  %7 = mul i64 64, %6
  %8 = urem i64 %5, 128
  %src.addr_01 = getelementptr [128 x i128], [128 x i128]* %_0, i64 0, i64 %8
  %src.addr_12 = getelementptr [128 x i128], [128 x i128]* %_1, i64 0, i64 %8
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 512
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_out([1024 x double]* noalias "orig.arg.no"="0", [256 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [256 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [1024 x double]* noalias "orig.arg.no"="2", [256 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_01, [256 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_12, [512 x double]* noalias "orig.arg.no"="4", [128 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_03, [128 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_14, [512 x double]* noalias "orig.arg.no"="6", [128 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_05, [128 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_16) #5 {
entry:
  call void @onebyonecpy_hls.p0a1024f64.11.12([1024 x double]* %0, [256 x i128]* %_0, [256 x i128]* %_1)
  call void @onebyonecpy_hls.p0a1024f64.11.12([1024 x double]* %1, [256 x i128]* %_01, [256 x i128]* %_12)
  call void @onebyonecpy_hls.p0a512f64.13.14([512 x double]* %2, [128 x i128]* %_03, [128 x i128]* %_14)
  call void @onebyonecpy_hls.p0a512f64.13.14([512 x double]* %3, [128 x i128]* %_05, [128 x i128]* %_16)
  ret void
}

declare void @apatb_fft_hw([256 x i128]*, [256 x i128]*, [256 x i128]*, [256 x i128]*, [128 x i128]*, [128 x i128]*, [128 x i128]*, [128 x i128]*)

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_back([1024 x double]* noalias "orig.arg.no"="0", [256 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [256 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [1024 x double]* noalias "orig.arg.no"="2", [256 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_01, [256 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_12, [512 x double]* noalias "orig.arg.no"="4", [128 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_03, [128 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_14, [512 x double]* noalias "orig.arg.no"="6", [128 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_05, [128 x i128]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_16) #5 {
entry:
  call void @onebyonecpy_hls.p0a1024f64.11.12([1024 x double]* %0, [256 x i128]* %_0, [256 x i128]* %_1)
  call void @onebyonecpy_hls.p0a1024f64.11.12([1024 x double]* %1, [256 x i128]* %_01, [256 x i128]* %_12)
  ret void
}

define void @fft_hw_stub_wrapper([256 x i128]*, [256 x i128]*, [256 x i128]*, [256 x i128]*, [128 x i128]*, [128 x i128]*, [128 x i128]*, [128 x i128]*) #6 {
entry:
  %malloccall = tail call i8* @malloc(i64 8192)
  %8 = bitcast i8* %malloccall to [1024 x double]*
  %malloccall1 = tail call i8* @malloc(i64 8192)
  %9 = bitcast i8* %malloccall1 to [1024 x double]*
  %malloccall2 = tail call i8* @malloc(i64 4096)
  %10 = bitcast i8* %malloccall2 to [512 x double]*
  %malloccall3 = tail call i8* @malloc(i64 4096)
  %11 = bitcast i8* %malloccall3 to [512 x double]*
  call void @copy_out([1024 x double]* %8, [256 x i128]* %0, [256 x i128]* %1, [1024 x double]* %9, [256 x i128]* %2, [256 x i128]* %3, [512 x double]* %10, [128 x i128]* %4, [128 x i128]* %5, [512 x double]* %11, [128 x i128]* %6, [128 x i128]* %7)
  %12 = bitcast [1024 x double]* %8 to double*
  %13 = bitcast [1024 x double]* %9 to double*
  %14 = bitcast [512 x double]* %10 to double*
  %15 = bitcast [512 x double]* %11 to double*
  call void @fft_hw_stub(double* %12, double* %13, double* %14, double* %15)
  call void @copy_in([1024 x double]* %8, [256 x i128]* %0, [256 x i128]* %1, [1024 x double]* %9, [256 x i128]* %2, [256 x i128]* %3, [512 x double]* %10, [128 x i128]* %4, [128 x i128]* %5, [512 x double]* %11, [128 x i128]* %6, [128 x i128]* %7)
  ret void
}

declare void @fft_hw_stub(double*, double*, double*, double*)

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
!5 = !DILocation(line: 3, column: 9, scope: !6)
!6 = !DILexicalBlockFile(scope: !8, file: !7, discriminator: 0)
!7 = !DIFile(filename: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/fft/strided/dir_test.tcl", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/fft/strided")
!8 = distinct !DISubprogram(name: "fft", scope: !9, file: !9, line: 3, type: !10, isLocal: false, isDefinition: true, scopeLine: 3, flags: DIFlagPrototyped, isOptimized: false, unit: !14, variables: !4)
!9 = !DIFile(filename: "fft.c", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/fft/strided")
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12, !12, !12, !12}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!14 = distinct !DICompileUnit(language: DW_LANG_C99, file: !15, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4)
!15 = !DIFile(filename: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/fft/strided/prj/solution/.autopilot/db/fft.pp.0.c", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/fft/strided")
!16 = !DILocation(line: 5, column: 9, scope: !6)
!17 = !DILocation(line: 7, column: 9, scope: !6)
!18 = !DILocation(line: 9, column: 9, scope: !6)

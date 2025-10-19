; ModuleID = '/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/md/knn/prj/solution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_md_kernel_ir(double* noalias nocapture nonnull "fpga.decayed.dim.hint"="256" %force_x, double* noalias nocapture nonnull "fpga.decayed.dim.hint"="256" %force_y, double* noalias nocapture nonnull "fpga.decayed.dim.hint"="256" %force_z, double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="256" %position_x, double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="256" %position_y, double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="256" %position_z, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %NL) local_unnamed_addr #1 {
entry:
  %force_x_copy_01 = alloca [64 x i128], align 512
  %force_x_copy_12 = alloca [64 x i128], align 512
  %force_y_copy_03 = alloca [64 x i128], align 512
  %force_y_copy_14 = alloca [64 x i128], align 512
  %force_z_copy_05 = alloca [64 x i128], align 512
  %force_z_copy_16 = alloca [64 x i128], align 512
  %position_x_copy_07 = alloca [64 x i128], align 512
  %position_x_copy_18 = alloca [64 x i128], align 512
  %position_y_copy_09 = alloca [64 x i128], align 512
  %position_y_copy_110 = alloca [64 x i128], align 512
  %position_z_copy_011 = alloca [64 x i128], align 512
  %position_z_copy_112 = alloca [64 x i128], align 512
  %malloccall_0 = call i8* @malloc(i64 8192)
  %malloccall_1 = call i8* @malloc(i64 8192)
  %NL_copy_013 = bitcast i8* %malloccall_0 to [1024 x i64]*
  %NL_copy_114 = bitcast i8* %malloccall_1 to [1024 x i64]*
  %0 = bitcast double* %force_x to [256 x double]*
  %1 = bitcast double* %force_y to [256 x double]*
  %2 = bitcast double* %force_z to [256 x double]*
  %3 = bitcast double* %position_x to [256 x double]*
  %4 = bitcast double* %position_y to [256 x double]*
  %5 = bitcast double* %position_z to [256 x double]*
  %6 = bitcast i32* %NL to [4096 x i32]*
  call void @copy_in([256 x double]* nonnull %0, [64 x i128]* nonnull align 512 %force_x_copy_01, [64 x i128]* nonnull align 512 %force_x_copy_12, [256 x double]* nonnull %1, [64 x i128]* nonnull align 512 %force_y_copy_03, [64 x i128]* nonnull align 512 %force_y_copy_14, [256 x double]* nonnull %2, [64 x i128]* nonnull align 512 %force_z_copy_05, [64 x i128]* nonnull align 512 %force_z_copy_16, [256 x double]* nonnull %3, [64 x i128]* nonnull align 512 %position_x_copy_07, [64 x i128]* nonnull align 512 %position_x_copy_18, [256 x double]* nonnull %4, [64 x i128]* nonnull align 512 %position_y_copy_09, [64 x i128]* nonnull align 512 %position_y_copy_110, [256 x double]* nonnull %5, [64 x i128]* nonnull align 512 %position_z_copy_011, [64 x i128]* nonnull align 512 %position_z_copy_112, [4096 x i32]* nonnull %6, [1024 x i64]* %NL_copy_013, [1024 x i64]* %NL_copy_114)
  %force_x_copy.gep_015 = getelementptr [64 x i128], [64 x i128]* %force_x_copy_01, i64 0, i32 0
  %force_x_copy.gep_116 = getelementptr [64 x i128], [64 x i128]* %force_x_copy_12, i64 0, i32 0
  %force_y_copy.gep_017 = getelementptr [64 x i128], [64 x i128]* %force_y_copy_03, i64 0, i32 0
  %force_y_copy.gep_118 = getelementptr [64 x i128], [64 x i128]* %force_y_copy_14, i64 0, i32 0
  %force_z_copy.gep_019 = getelementptr [64 x i128], [64 x i128]* %force_z_copy_05, i64 0, i32 0
  %force_z_copy.gep_120 = getelementptr [64 x i128], [64 x i128]* %force_z_copy_16, i64 0, i32 0
  %position_x_copy.gep_021 = getelementptr [64 x i128], [64 x i128]* %position_x_copy_07, i64 0, i32 0
  %position_x_copy.gep_122 = getelementptr [64 x i128], [64 x i128]* %position_x_copy_18, i64 0, i32 0
  %position_y_copy.gep_023 = getelementptr [64 x i128], [64 x i128]* %position_y_copy_09, i64 0, i32 0
  %position_y_copy.gep_124 = getelementptr [64 x i128], [64 x i128]* %position_y_copy_110, i64 0, i32 0
  %position_z_copy.gep_025 = getelementptr [64 x i128], [64 x i128]* %position_z_copy_011, i64 0, i32 0
  %position_z_copy.gep_126 = getelementptr [64 x i128], [64 x i128]* %position_z_copy_112, i64 0, i32 0
  %_027 = getelementptr [1024 x i64], [1024 x i64]* %NL_copy_013, i32 0, i32 0
  %_128 = getelementptr [1024 x i64], [1024 x i64]* %NL_copy_114, i32 0, i32 0
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %force_x_copy.gep_015, i32 0, i32 1, i32 0, i1 false) ], !dbg !5
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %force_x_copy.gep_116, i32 0, i32 1, i32 0, i1 false) ], !dbg !5
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %force_y_copy.gep_017, i32 0, i32 1, i32 0, i1 false) ], !dbg !22
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %force_y_copy.gep_118, i32 0, i32 1, i32 0, i1 false) ], !dbg !22
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %force_z_copy.gep_019, i32 0, i32 1, i32 0, i1 false) ], !dbg !23
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %force_z_copy.gep_120, i32 0, i32 1, i32 0, i1 false) ], !dbg !23
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %position_x_copy.gep_021, i32 0, i32 1, i32 0, i1 false) ], !dbg !24
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %position_x_copy.gep_122, i32 0, i32 1, i32 0, i1 false) ], !dbg !24
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %position_y_copy.gep_023, i32 0, i32 1, i32 0, i1 false) ], !dbg !25
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %position_y_copy.gep_124, i32 0, i32 1, i32 0, i1 false) ], !dbg !25
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %position_z_copy.gep_025, i32 0, i32 1, i32 0, i1 false) ], !dbg !26
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i128* %position_z_copy.gep_126, i32 0, i32 1, i32 0, i1 false) ], !dbg !26
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i64* %_027, i32 0, i32 1, i32 0, i1 false) ], !dbg !27
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i64* %_128, i32 0, i32 1, i32 0, i1 false) ], !dbg !27
  call void @apatb_md_kernel_hw([64 x i128]* %force_x_copy_01, [64 x i128]* %force_x_copy_12, [64 x i128]* %force_y_copy_03, [64 x i128]* %force_y_copy_14, [64 x i128]* %force_z_copy_05, [64 x i128]* %force_z_copy_16, [64 x i128]* %position_x_copy_07, [64 x i128]* %position_x_copy_18, [64 x i128]* %position_y_copy_09, [64 x i128]* %position_y_copy_110, [64 x i128]* %position_z_copy_011, [64 x i128]* %position_z_copy_112, [1024 x i64]* %NL_copy_013, [1024 x i64]* %NL_copy_114)
  call void @copy_back([256 x double]* %0, [64 x i128]* %force_x_copy_01, [64 x i128]* %force_x_copy_12, [256 x double]* %1, [64 x i128]* %force_y_copy_03, [64 x i128]* %force_y_copy_14, [256 x double]* %2, [64 x i128]* %force_z_copy_05, [64 x i128]* %force_z_copy_16, [256 x double]* %3, [64 x i128]* %position_x_copy_07, [64 x i128]* %position_x_copy_18, [256 x double]* %4, [64 x i128]* %position_y_copy_09, [64 x i128]* %position_y_copy_110, [256 x double]* %5, [64 x i128]* %position_z_copy_011, [64 x i128]* %position_z_copy_112, [4096 x i32]* %6, [1024 x i64]* %NL_copy_013, [1024 x i64]* %NL_copy_114)
  call void @free(i8* %malloccall_0)
  call void @free(i8* %malloccall_1)
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %force_x_copy.gep_015, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %force_x_copy.gep_116, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %force_y_copy.gep_017, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %force_y_copy.gep_118, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %force_z_copy.gep_019, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %force_z_copy.gep_120, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %position_x_copy.gep_021, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %position_x_copy.gep_122, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %position_y_copy.gep_023, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %position_y_copy.gep_124, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %position_z_copy.gep_025, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i128* %position_z_copy.gep_126, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %_027, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i64* %_128, i32 0, i32 1, i32 0) ]
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: nounwind
declare void @llvm.assume(i1) #2

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a256f64.3.4([64 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, [64 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, [256 x double]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #3 {
entry:
  %1 = icmp eq [64 x i128]* %_0, null
  %2 = icmp eq [256 x double]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %4 = udiv i64 %for.loop.idx1, 128
  %5 = urem i64 %for.loop.idx1, 128
  %6 = udiv i64 %5, 64
  %7 = mul i64 64, %6
  %8 = urem i64 %5, 64
  %dst.addr_01 = getelementptr [64 x i128], [64 x i128]* %_0, i64 0, i64 %8
  %dst.addr_12 = getelementptr [64 x i128], [64 x i128]* %_1, i64 0, i64 %8
  %src.addr = getelementptr [256 x double], [256 x double]* %0, i64 0, i64 %for.loop.idx1
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 256
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a4096i32.5.6([1024 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, [1024 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, [4096 x i32]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #3 {
entry:
  %1 = icmp eq [1024 x i64]* %_0, null
  %2 = icmp eq [4096 x i32]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %4 = udiv i64 %for.loop.idx1, 2048
  %5 = urem i64 %for.loop.idx1, 2048
  %6 = udiv i64 %5, 1024
  %7 = mul i64 32, %6
  %8 = urem i64 %5, 1024
  %dst.addr_01 = getelementptr [1024 x i64], [1024 x i64]* %_0, i64 0, i64 %8
  %dst.addr_12 = getelementptr [1024 x i64], [1024 x i64]* %_1, i64 0, i64 %8
  %src.addr = getelementptr [4096 x i32], [4096 x i32]* %0, i64 0, i64 %for.loop.idx1
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 4096
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_in([256 x double]* noalias readonly "orig.arg.no"="0", [64 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [64 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [256 x double]* noalias readonly "orig.arg.no"="2", [64 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_01, [64 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_12, [256 x double]* noalias readonly "orig.arg.no"="4", [64 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_03, [64 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_14, [256 x double]* noalias readonly "orig.arg.no"="6", [64 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_05, [64 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_16, [256 x double]* noalias readonly "orig.arg.no"="8", [64 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_07, [64 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_18, [256 x double]* noalias readonly "orig.arg.no"="10", [64 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="11" %_09, [64 x i128]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="11" %_110, [4096 x i32]* noalias readonly "orig.arg.no"="12", [1024 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="13" %_011, [1024 x i64]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="13" %_112) #4 {
entry:
  call void @onebyonecpy_hls.p0a256f64.3.4([64 x i128]* align 512 %_0, [64 x i128]* align 512 %_1, [256 x double]* %0)
  call void @onebyonecpy_hls.p0a256f64.3.4([64 x i128]* align 512 %_01, [64 x i128]* align 512 %_12, [256 x double]* %1)
  call void @onebyonecpy_hls.p0a256f64.3.4([64 x i128]* align 512 %_03, [64 x i128]* align 512 %_14, [256 x double]* %2)
  call void @onebyonecpy_hls.p0a256f64.3.4([64 x i128]* align 512 %_05, [64 x i128]* align 512 %_16, [256 x double]* %3)
  call void @onebyonecpy_hls.p0a256f64.3.4([64 x i128]* align 512 %_07, [64 x i128]* align 512 %_18, [256 x double]* %4)
  call void @onebyonecpy_hls.p0a256f64.3.4([64 x i128]* align 512 %_09, [64 x i128]* align 512 %_110, [256 x double]* %5)
  call void @onebyonecpy_hls.p0a4096i32.5.6([1024 x i64]* %_011, [1024 x i64]* %_112, [4096 x i32]* %6)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a256f64.11.12([256 x double]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1) #3 {
entry:
  %1 = icmp eq [256 x double]* %0, null
  %2 = icmp eq [64 x i128]* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [256 x double], [256 x double]* %0, i64 0, i64 %for.loop.idx1
  %4 = udiv i64 %for.loop.idx1, 128
  %5 = urem i64 %for.loop.idx1, 128
  %6 = udiv i64 %5, 64
  %7 = mul i64 64, %6
  %8 = urem i64 %5, 64
  %src.addr_01 = getelementptr [64 x i128], [64 x i128]* %_0, i64 0, i64 %8
  %src.addr_12 = getelementptr [64 x i128], [64 x i128]* %_1, i64 0, i64 %8
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 256
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a4096i32.13.14([4096 x i32]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [1024 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [1024 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1) #3 {
entry:
  %1 = icmp eq [4096 x i32]* %0, null
  %2 = icmp eq [1024 x i64]* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [4096 x i32], [4096 x i32]* %0, i64 0, i64 %for.loop.idx1
  %4 = udiv i64 %for.loop.idx1, 2048
  %5 = urem i64 %for.loop.idx1, 2048
  %6 = udiv i64 %5, 1024
  %7 = mul i64 32, %6
  %8 = urem i64 %5, 1024
  %src.addr_01 = getelementptr [1024 x i64], [1024 x i64]* %_0, i64 0, i64 %8
  %src.addr_12 = getelementptr [1024 x i64], [1024 x i64]* %_1, i64 0, i64 %8
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 4096
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_out([256 x double]* noalias "orig.arg.no"="0", [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [256 x double]* noalias "orig.arg.no"="2", [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_01, [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_12, [256 x double]* noalias "orig.arg.no"="4", [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_03, [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_14, [256 x double]* noalias "orig.arg.no"="6", [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_05, [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_16, [256 x double]* noalias "orig.arg.no"="8", [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_07, [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_18, [256 x double]* noalias "orig.arg.no"="10", [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="11" %_09, [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="11" %_110, [4096 x i32]* noalias "orig.arg.no"="12", [1024 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="13" %_011, [1024 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="13" %_112) #5 {
entry:
  call void @onebyonecpy_hls.p0a256f64.11.12([256 x double]* %0, [64 x i128]* align 512 %_0, [64 x i128]* align 512 %_1)
  call void @onebyonecpy_hls.p0a256f64.11.12([256 x double]* %1, [64 x i128]* align 512 %_01, [64 x i128]* align 512 %_12)
  call void @onebyonecpy_hls.p0a256f64.11.12([256 x double]* %2, [64 x i128]* align 512 %_03, [64 x i128]* align 512 %_14)
  call void @onebyonecpy_hls.p0a256f64.11.12([256 x double]* %3, [64 x i128]* align 512 %_05, [64 x i128]* align 512 %_16)
  call void @onebyonecpy_hls.p0a256f64.11.12([256 x double]* %4, [64 x i128]* align 512 %_07, [64 x i128]* align 512 %_18)
  call void @onebyonecpy_hls.p0a256f64.11.12([256 x double]* %5, [64 x i128]* align 512 %_09, [64 x i128]* align 512 %_110)
  call void @onebyonecpy_hls.p0a4096i32.13.14([4096 x i32]* %6, [1024 x i64]* %_011, [1024 x i64]* %_112)
  ret void
}

declare void @apatb_md_kernel_hw([64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [1024 x i64]*, [1024 x i64]*)

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_back([256 x double]* noalias "orig.arg.no"="0", [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [256 x double]* noalias "orig.arg.no"="2", [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_01, [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_12, [256 x double]* noalias "orig.arg.no"="4", [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_03, [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_14, [256 x double]* noalias "orig.arg.no"="6", [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_05, [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_16, [256 x double]* noalias "orig.arg.no"="8", [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_07, [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_18, [256 x double]* noalias "orig.arg.no"="10", [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="11" %_09, [64 x i128]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="11" %_110, [4096 x i32]* noalias "orig.arg.no"="12", [1024 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="13" %_011, [1024 x i64]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="13" %_112) #5 {
entry:
  call void @onebyonecpy_hls.p0a256f64.11.12([256 x double]* %0, [64 x i128]* align 512 %_0, [64 x i128]* align 512 %_1)
  call void @onebyonecpy_hls.p0a256f64.11.12([256 x double]* %1, [64 x i128]* align 512 %_01, [64 x i128]* align 512 %_12)
  call void @onebyonecpy_hls.p0a256f64.11.12([256 x double]* %2, [64 x i128]* align 512 %_03, [64 x i128]* align 512 %_14)
  ret void
}

define void @md_kernel_hw_stub_wrapper([64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [64 x i128]*, [1024 x i64]*, [1024 x i64]*) #6 {
entry:
  %14 = alloca [256 x double]
  %15 = alloca [256 x double]
  %16 = alloca [256 x double]
  %17 = alloca [256 x double]
  %18 = alloca [256 x double]
  %19 = alloca [256 x double]
  %malloccall = tail call i8* @malloc(i64 16384)
  %20 = bitcast i8* %malloccall to [4096 x i32]*
  call void @copy_out([256 x double]* %14, [64 x i128]* %0, [64 x i128]* %1, [256 x double]* %15, [64 x i128]* %2, [64 x i128]* %3, [256 x double]* %16, [64 x i128]* %4, [64 x i128]* %5, [256 x double]* %17, [64 x i128]* %6, [64 x i128]* %7, [256 x double]* %18, [64 x i128]* %8, [64 x i128]* %9, [256 x double]* %19, [64 x i128]* %10, [64 x i128]* %11, [4096 x i32]* %20, [1024 x i64]* %12, [1024 x i64]* %13)
  %21 = bitcast [256 x double]* %14 to double*
  %22 = bitcast [256 x double]* %15 to double*
  %23 = bitcast [256 x double]* %16 to double*
  %24 = bitcast [256 x double]* %17 to double*
  %25 = bitcast [256 x double]* %18 to double*
  %26 = bitcast [256 x double]* %19 to double*
  %27 = bitcast [4096 x i32]* %20 to i32*
  call void @md_kernel_hw_stub(double* %21, double* %22, double* %23, double* %24, double* %25, double* %26, i32* %27)
  call void @copy_in([256 x double]* %14, [64 x i128]* %0, [64 x i128]* %1, [256 x double]* %15, [64 x i128]* %2, [64 x i128]* %3, [256 x double]* %16, [64 x i128]* %4, [64 x i128]* %5, [256 x double]* %17, [64 x i128]* %6, [64 x i128]* %7, [256 x double]* %18, [64 x i128]* %8, [64 x i128]* %9, [256 x double]* %19, [64 x i128]* %10, [64 x i128]* %11, [4096 x i32]* %20, [1024 x i64]* %12, [1024 x i64]* %13)
  ret void
}

declare void @md_kernel_hw_stub(double*, double*, double*, double*, double*, double*, i32*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { nounwind }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #5 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }
attributes #7 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="288230376151711743" }
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
!5 = !DILocation(line: 3, column: 9, scope: !6)
!6 = !DILexicalBlockFile(scope: !8, file: !7, discriminator: 0)
!7 = !DIFile(filename: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/md/knn/dir_test.tcl", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/md/knn")
!8 = distinct !DISubprogram(name: "md_kernel", scope: !9, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, scopeLine: 17, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !4)
!9 = !DIFile(filename: "md.c", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/md/knn")
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12, !12, !12, !12, !12, !12, !14}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !16, line: 26, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/md/knn")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !18, line: 41, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/md/knn")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = distinct !DICompileUnit(language: DW_LANG_C99, file: !21, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4)
!21 = !DIFile(filename: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/md/knn/prj/solution/.autopilot/db/md.pp.0.c", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/md/knn")
!22 = !DILocation(line: 5, column: 9, scope: !6)
!23 = !DILocation(line: 7, column: 9, scope: !6)
!24 = !DILocation(line: 9, column: 9, scope: !6)
!25 = !DILocation(line: 11, column: 9, scope: !6)
!26 = !DILocation(line: 13, column: 9, scope: !6)
!27 = !DILocation(line: 15, column: 9, scope: !6)

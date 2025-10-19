; ModuleID = '/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/aes/aes/prj/solution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.aes256_context = type { [32 x i8], [32 x i8], [32 x i8] }

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: inaccessiblemem_or_argmemonly noinline
define void @apatb_aes256_encrypt_ecb_ir(%struct.aes256_context* noalias nonnull %ctx, i8* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="32" %k, i8* noalias nonnull "fpga.decayed.dim.hint"="16" %buf) local_unnamed_addr #1 {
entry:
  %ctx_copy = alloca i768, align 512
  %k_copy_02 = alloca [8 x i16], align 512
  %k_copy_13 = alloca [8 x i16], align 512
  %buf_copy_04 = alloca [4 x i16], align 512
  %buf_copy_15 = alloca [4 x i16], align 512
  %0 = bitcast i8* %k to [32 x i8]*
  %1 = bitcast i8* %buf to [16 x i8]*
  call void @copy_in(%struct.aes256_context* nonnull %ctx, i768* nonnull align 512 %ctx_copy, [32 x i8]* nonnull %0, [8 x i16]* nonnull align 512 %k_copy_02, [8 x i16]* nonnull align 512 %k_copy_13, [16 x i8]* nonnull %1, [4 x i16]* nonnull align 512 %buf_copy_04, [4 x i16]* nonnull align 512 %buf_copy_15)
  %k_copy.gep_06 = getelementptr [8 x i16], [8 x i16]* %k_copy_02, i64 0, i32 0
  %k_copy.gep_17 = getelementptr [8 x i16], [8 x i16]* %k_copy_13, i64 0, i32 0
  %buf_copy.gep_08 = getelementptr [4 x i16], [4 x i16]* %buf_copy_04, i64 0, i32 0
  %buf_copy.gep_19 = getelementptr [4 x i16], [4 x i16]* %buf_copy_15, i64 0, i32 0
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i16* %k_copy.gep_06, i32 0, i32 1, i32 0, i1 false) ], !dbg !5
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i16* %k_copy.gep_17, i32 0, i32 1, i32 0, i1 false) ], !dbg !5
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i16* %buf_copy.gep_08, i32 0, i32 1, i32 0, i1 false) ], !dbg !38
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"(i16* %buf_copy.gep_19, i32 0, i32 1, i32 0, i1 false) ], !dbg !38
  call void @apatb_aes256_encrypt_ecb_hw(i768* %ctx_copy, [8 x i16]* %k_copy_02, [8 x i16]* %k_copy_13, [4 x i16]* %buf_copy_04, [4 x i16]* %buf_copy_15)
  call void @copy_back(%struct.aes256_context* %ctx, i768* %ctx_copy, [32 x i8]* %0, [8 x i16]* %k_copy_02, [8 x i16]* %k_copy_13, [16 x i8]* %1, [4 x i16]* %buf_copy_04, [4 x i16]* %buf_copy_15)
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i16* %k_copy.gep_06, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i16* %k_copy.gep_17, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i16* %buf_copy.gep_08, i32 0, i32 1, i32 0) ]
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"(i16* %buf_copy.gep_19, i32 0, i32 1, i32 0) ]
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.aes256_context(i768* noalias align 512, %struct.aes256_context* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i768* %0, null
  %3 = icmp eq %struct.aes256_context* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.promoted = load i768, i768* %0, align 512
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %5 = phi i768 [ %.promoted, %copy ], [ %.partset, %for.loop ]
  %for.loop.idx24 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %6 = mul nuw nsw i64 8, %for.loop.idx24
  %src.addr21 = getelementptr %struct.aes256_context, %struct.aes256_context* %1, i32 0, i32 0, i64 %for.loop.idx24
  %7 = load i8, i8* %src.addr21, align 1
  %8 = zext i64 %6 to i768
  %9 = shl i768 255, %8
  %10 = zext i8 %7 to i768
  %11 = shl i768 %10, %8
  %12 = xor i768 %9, -1
  %13 = and i768 %5, %12
  %.partset = or i768 %13, %11
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx24, 1
  %exitcond26 = icmp ne i64 %for.loop.idx.next, 32
  br i1 %exitcond26, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop
  store i768 %.partset, i768* %0, align 512
  br label %for.loop4

for.loop4:                                        ; preds = %for.loop4, %copy.split
  %14 = phi i768 [ %.partset, %copy.split ], [ %.partset1, %for.loop4 ]
  %for.loop.idx523 = phi i64 [ 0, %copy.split ], [ %for.loop.idx5.next, %for.loop4 ]
  %15 = mul nuw nsw i64 8, %for.loop.idx523
  %16 = add nuw nsw i64 256, %15
  %src.addr819 = getelementptr %struct.aes256_context, %struct.aes256_context* %1, i32 0, i32 1, i64 %for.loop.idx523
  %17 = load i8, i8* %src.addr819, align 1
  %18 = zext i64 %16 to i768
  %19 = shl i768 255, %18
  %20 = zext i8 %17 to i768
  %21 = shl i768 %20, %18
  %22 = xor i768 %19, -1
  %23 = and i768 %14, %22
  %.partset1 = or i768 %23, %21
  %for.loop.idx5.next = add nuw nsw i64 %for.loop.idx523, 1
  %exitcond25 = icmp ne i64 %for.loop.idx5.next, 32
  br i1 %exitcond25, label %for.loop4, label %copy.split.split

copy.split.split:                                 ; preds = %for.loop4
  store i768 %.partset1, i768* %0, align 512
  br label %for.loop11

for.loop11:                                       ; preds = %for.loop11, %copy.split.split
  %24 = phi i768 [ %.partset1, %copy.split.split ], [ %.partset2, %for.loop11 ]
  %for.loop.idx1222 = phi i64 [ 0, %copy.split.split ], [ %for.loop.idx12.next, %for.loop11 ]
  %25 = mul nuw nsw i64 8, %for.loop.idx1222
  %26 = add nuw nsw i64 512, %25
  %src.addr1517 = getelementptr %struct.aes256_context, %struct.aes256_context* %1, i32 0, i32 2, i64 %for.loop.idx1222
  %27 = load i8, i8* %src.addr1517, align 1
  %28 = zext i64 %26 to i768
  %29 = shl i768 255, %28
  %30 = zext i8 %27 to i768
  %31 = shl i768 %30, %28
  %32 = xor i768 %29, -1
  %33 = and i768 %24, %32
  %.partset2 = or i768 %33, %31
  %for.loop.idx12.next = add nuw nsw i64 %for.loop.idx1222, 1
  %exitcond = icmp ne i64 %for.loop.idx12.next, 32
  br i1 %exitcond, label %for.loop11, label %ret.loopexit

ret.loopexit:                                     ; preds = %for.loop11
  store i768 %.partset2, i768* %0, align 512
  br label %ret

ret:                                              ; preds = %ret.loopexit, %entry
  ret void
}

; Function Attrs: nounwind
declare void @llvm.assume(i1) #3

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.aes256_context.34(%struct.aes256_context* noalias, i768* noalias readonly align 512) unnamed_addr #2 {
entry:
  %2 = icmp eq %struct.aes256_context* %0, null
  %3 = icmp eq i768* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = load i768, i768* %1, align 512
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx24 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr20 = getelementptr %struct.aes256_context, %struct.aes256_context* %0, i32 0, i32 0, i64 %for.loop.idx24
  %6 = mul nuw nsw i64 8, %for.loop.idx24
  %7 = zext i64 %6 to i768
  %8 = lshr i768 %5, %7
  %.partselect2 = trunc i768 %8 to i8
  store i8 %.partselect2, i8* %dst.addr20, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx24, 1
  %exitcond26 = icmp ne i64 %for.loop.idx.next, 32
  br i1 %exitcond26, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop
  br label %for.loop4

for.loop4:                                        ; preds = %for.loop4, %copy.split
  %for.loop.idx523 = phi i64 [ 0, %copy.split ], [ %for.loop.idx5.next, %for.loop4 ]
  %dst.addr718 = getelementptr %struct.aes256_context, %struct.aes256_context* %0, i32 0, i32 1, i64 %for.loop.idx523
  %9 = mul nuw nsw i64 8, %for.loop.idx523
  %10 = add nuw nsw i64 256, %9
  %11 = zext i64 %10 to i768
  %12 = lshr i768 %5, %11
  %.partselect1 = trunc i768 %12 to i8
  store i8 %.partselect1, i8* %dst.addr718, align 1
  %for.loop.idx5.next = add nuw nsw i64 %for.loop.idx523, 1
  %exitcond25 = icmp ne i64 %for.loop.idx5.next, 32
  br i1 %exitcond25, label %for.loop4, label %copy.split.split

copy.split.split:                                 ; preds = %for.loop4
  br label %for.loop11

for.loop11:                                       ; preds = %for.loop11, %copy.split.split
  %for.loop.idx1222 = phi i64 [ 0, %copy.split.split ], [ %for.loop.idx12.next, %for.loop11 ]
  %dst.addr1416 = getelementptr %struct.aes256_context, %struct.aes256_context* %0, i32 0, i32 2, i64 %for.loop.idx1222
  %13 = mul nuw nsw i64 8, %for.loop.idx1222
  %14 = add nuw nsw i64 512, %13
  %15 = zext i64 %14 to i768
  %16 = lshr i768 %5, %15
  %.partselect = trunc i768 %16 to i8
  store i8 %.partselect, i8* %dst.addr1416, align 1
  %for.loop.idx12.next = add nuw nsw i64 %for.loop.idx1222, 1
  %exitcond = icmp ne i64 %for.loop.idx12.next, 32
  br i1 %exitcond, label %for.loop11, label %ret

ret:                                              ; preds = %for.loop11, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a32i8.8.9([8 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, [8 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, [32 x i8]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %1 = icmp eq [8 x i16]* %_0, null
  %2 = icmp eq [32 x i8]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %4 = udiv i64 %for.loop.idx1, 16
  %5 = urem i64 %for.loop.idx1, 16
  %6 = udiv i64 %5, 8
  %7 = mul i64 8, %6
  %8 = urem i64 %5, 8
  %dst.addr_01 = getelementptr [8 x i16], [8 x i16]* %_0, i64 0, i64 %8
  %dst.addr_12 = getelementptr [8 x i16], [8 x i16]* %_1, i64 0, i64 %8
  %src.addr = getelementptr [32 x i8], [32 x i8]* %0, i64 0, i64 %for.loop.idx1
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 32
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a16i8.10.11([4 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, [4 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, [16 x i8]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %1 = icmp eq [4 x i16]* %_0, null
  %2 = icmp eq [16 x i8]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %4 = udiv i64 %for.loop.idx1, 8
  %5 = urem i64 %for.loop.idx1, 8
  %6 = udiv i64 %5, 4
  %7 = mul i64 8, %6
  %8 = urem i64 %5, 4
  %dst.addr_01 = getelementptr [4 x i16], [4 x i16]* %_0, i64 0, i64 %8
  %dst.addr_12 = getelementptr [4 x i16], [4 x i16]* %_1, i64 0, i64 %8
  %src.addr = getelementptr [16 x i8], [16 x i8]* %0, i64 0, i64 %for.loop.idx1
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 16
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_in(%struct.aes256_context* noalias readonly "orig.arg.no"="0", i768* noalias align 512 "orig.arg.no"="1", [32 x i8]* noalias readonly "orig.arg.no"="2", [8 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_0, [8 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_1, [16 x i8]* noalias readonly "orig.arg.no"="4", [4 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_01, [4 x i16]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_12) #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.aes256_context(i768* align 512 %1, %struct.aes256_context* %0)
  call void @onebyonecpy_hls.p0a32i8.8.9([8 x i16]* align 512 %_0, [8 x i16]* align 512 %_1, [32 x i8]* %2)
  call void @onebyonecpy_hls.p0a16i8.10.11([4 x i16]* align 512 %_01, [4 x i16]* align 512 %_12, [16 x i8]* %3)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a32i8.26.27([32 x i8]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [8 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [8 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1) #2 {
entry:
  %1 = icmp eq [32 x i8]* %0, null
  %2 = icmp eq [8 x i16]* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [32 x i8], [32 x i8]* %0, i64 0, i64 %for.loop.idx1
  %4 = udiv i64 %for.loop.idx1, 16
  %5 = urem i64 %for.loop.idx1, 16
  %6 = udiv i64 %5, 8
  %7 = mul i64 8, %6
  %8 = urem i64 %5, 8
  %src.addr_01 = getelementptr [8 x i16], [8 x i16]* %_0, i64 0, i64 %8
  %src.addr_12 = getelementptr [8 x i16], [8 x i16]* %_1, i64 0, i64 %8
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 32
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a16i8.28.29([16 x i8]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [4 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [4 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1) #2 {
entry:
  %1 = icmp eq [16 x i8]* %0, null
  %2 = icmp eq [4 x i16]* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [16 x i8], [16 x i8]* %0, i64 0, i64 %for.loop.idx1
  %4 = udiv i64 %for.loop.idx1, 8
  %5 = urem i64 %for.loop.idx1, 8
  %6 = udiv i64 %5, 4
  %7 = mul i64 8, %6
  %8 = urem i64 %5, 4
  %src.addr_01 = getelementptr [4 x i16], [4 x i16]* %_0, i64 0, i64 %8
  %src.addr_12 = getelementptr [4 x i16], [4 x i16]* %_1, i64 0, i64 %8
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
  %exitcond = icmp ne i64 %for.loop.idx.next, 16
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_out(%struct.aes256_context* noalias "orig.arg.no"="0", i768* noalias readonly align 512 "orig.arg.no"="1", [32 x i8]* noalias "orig.arg.no"="2", [8 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_0, [8 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_1, [16 x i8]* noalias "orig.arg.no"="4", [4 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_01, [4 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_12) #5 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.aes256_context.34(%struct.aes256_context* %0, i768* align 512 %1)
  call void @onebyonecpy_hls.p0a32i8.26.27([32 x i8]* %2, [8 x i16]* align 512 %_0, [8 x i16]* align 512 %_1)
  call void @onebyonecpy_hls.p0a16i8.28.29([16 x i8]* %3, [4 x i16]* align 512 %_01, [4 x i16]* align 512 %_12)
  ret void
}

declare void @apatb_aes256_encrypt_ecb_hw(i768*, [8 x i16]*, [8 x i16]*, [4 x i16]*, [4 x i16]*)

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_back(%struct.aes256_context* noalias "orig.arg.no"="0", i768* noalias readonly align 512 "orig.arg.no"="1", [32 x i8]* noalias "orig.arg.no"="2", [8 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_0, [8 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_1, [16 x i8]* noalias "orig.arg.no"="4", [4 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_01, [4 x i16]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_12) #5 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.aes256_context.34(%struct.aes256_context* %0, i768* align 512 %1)
  call void @onebyonecpy_hls.p0a16i8.28.29([16 x i8]* %3, [4 x i16]* align 512 %_01, [4 x i16]* align 512 %_12)
  ret void
}

define void @aes256_encrypt_ecb_hw_stub_wrapper(i768*, [8 x i16]*, [8 x i16]*, [4 x i16]*, [4 x i16]*) #6 {
entry:
  %5 = alloca %struct.aes256_context
  %6 = alloca [32 x i8]
  %7 = alloca [16 x i8]
  call void @copy_out(%struct.aes256_context* %5, i768* %0, [32 x i8]* %6, [8 x i16]* %1, [8 x i16]* %2, [16 x i8]* %7, [4 x i16]* %3, [4 x i16]* %4)
  %8 = bitcast [32 x i8]* %6 to i8*
  %9 = bitcast [16 x i8]* %7 to i8*
  call void @aes256_encrypt_ecb_hw_stub(%struct.aes256_context* %5, i8* %8, i8* %9)
  call void @copy_in(%struct.aes256_context* %5, i768* %0, [32 x i8]* %6, [8 x i16]* %1, [8 x i16]* %2, [16 x i8]* %7, [4 x i16]* %3, [4 x i16]* %4)
  ret void
}

declare void @aes256_encrypt_ecb_hw_stub(%struct.aes256_context*, i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { inaccessiblemem_or_argmemonly noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #5 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }
attributes #7 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="2305843009213693951" }

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
!7 = !DIFile(filename: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/aes/aes/dir_test.tcl", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/aes/aes")
!8 = distinct !DISubprogram(name: "aes256_encrypt_ecb", scope: !9, file: !9, line: 176, type: !10, isLocal: false, isDefinition: true, scopeLine: 177, flags: DIFlagPrototyped, isOptimized: false, unit: !29, variables: !4)
!9 = !DIFile(filename: "aes.c", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/aes/aes")
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12, !28, !28}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "aes256_context", file: !14, line: 11, baseType: !15)
!14 = !DIFile(filename: "./aes.h", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/aes/aes")
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !14, line: 7, size: 768, elements: !16)
!16 = !{!17, !26, !27}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !15, file: !14, line: 8, baseType: !18, size: 256)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 256, elements: !24)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !20, line: 24, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/aes/aes")
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !22, line: 38, baseType: !23)
!22 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/aes/aes")
!23 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!24 = !{!25}
!25 = !DISubrange(count: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "enckey", scope: !15, file: !14, line: 9, baseType: !18, size: 256, offset: 256)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "deckey", scope: !15, file: !14, line: 10, baseType: !18, size: 256, offset: 512)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!29 = distinct !DICompileUnit(language: DW_LANG_C99, file: !30, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !31)
!30 = !DIFile(filename: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/aes/aes/prj/solution/.autopilot/db/aes.pp.0.c", directory: "/home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/aes/aes")
!31 = !{!32}
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "sbox", scope: !29, file: !9, line: 13, type: !34, isLocal: false, isDefinition: true)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 2048, elements: !36)
!35 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !19)
!36 = !{!37}
!37 = !DISubrange(count: 256)
!38 = !DILocation(line: 13, column: 9, scope: !6)

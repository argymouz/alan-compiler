; ModuleID = 'alan'
source_filename = "alan"

@strtmp = private unnamed_addr constant [8 x i8] c"Limit: \00"
@strtmp.1 = private unnamed_addr constant [9 x i8] c"Primes:\0A\00"
@strtmp.2 = private unnamed_addr constant [2 x i8] c"\0A\00"
@strtmp.3 = private unnamed_addr constant [2 x i8] c"\0A\00"
@strtmp.4 = private unnamed_addr constant [2 x i8] c"\0A\00"
@strtmp.5 = private unnamed_addr constant [2 x i8] c"\0A\00"
@strtmp.6 = private unnamed_addr constant [9 x i8] c"\0ATotal: \00"
@strtmp.7 = private unnamed_addr constant [2 x i8] c"\0A\00"

declare void @writeInteger(i16)

declare void @writeByte(i8)

declare void @writeChar(i8)

declare void @writeString(i8*)

declare i16 @readInteger()

declare i8 @readByte()

declare i8 @readChar()

declare void @readString(i16, i8*)

declare i16 @extend(i8)

declare i8 @shrink(i16)

declare i16 @strlen(i8*)

declare i16 @strcmp(i8*, i8*)

declare void @strcpy(i8*, i8*)

declare void @strcat(i8*, i8*)

define void @main() {
entry:
  %main.fr = alloca { i16, i16, i16 }
  call void @writeString(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @strtmp, i16 0, i16 0))
  %0 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 0
  %1 = call i16 @readInteger()
  store i16 %1, i16* %0
  call void @writeString(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @strtmp.1, i16 0, i16 0))
  %2 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 2
  store i16 0, i16* %2
  %3 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 0
  %loadtmp = load i16, i16* %3
  %morequtmp = icmp sge i16 %loadtmp, 2
  br i1 %morequtmp, label %then, label %ifcont

then:                                             ; preds = %entry
  %4 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 2
  %5 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 2
  %loadtmp1 = load i16, i16* %5
  %addtmp = add i16 %loadtmp1, 1
  store i16 %addtmp, i16* %4
  call void @writeInteger(i16 2)
  call void @writeString(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @strtmp.2, i16 0, i16 0))
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  %6 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 0
  %loadtmp2 = load i16, i16* %6
  %morequtmp3 = icmp sge i16 %loadtmp2, 3
  br i1 %morequtmp3, label %then4, label %ifcont7

then4:                                            ; preds = %ifcont
  %7 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 2
  %8 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 2
  %loadtmp5 = load i16, i16* %8
  %addtmp6 = add i16 %loadtmp5, 1
  store i16 %addtmp6, i16* %7
  call void @writeInteger(i16 3)
  call void @writeString(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @strtmp.3, i16 0, i16 0))
  br label %ifcont7

ifcont7:                                          ; preds = %then4, %ifcont
  %9 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 1
  store i16 6, i16* %9
  br label %cond

cond:                                             ; preds = %ifcont28, %ifcont7
  %10 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 1
  %loadtmp8 = load i16, i16* %10
  %11 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 0
  %loadtmp9 = load i16, i16* %11
  %lessequtmp = icmp sle i16 %loadtmp8, %loadtmp9
  br i1 %lessequtmp, label %do, label %after

after:                                            ; preds = %cond
  call void @writeString(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @strtmp.6, i16 0, i16 0))
  %12 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 2
  %loadtmp31 = load i16, i16* %12
  call void @writeInteger(i16 %loadtmp31)
  call void @writeString(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @strtmp.7, i16 0, i16 0))
  ret void

do:                                               ; preds = %cond
  %13 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 1
  %loadtmp10 = load i16, i16* %13
  %subtmp = sub i16 %loadtmp10, 1
  %14 = call i16 @main_prime({ i16, i16, i16 }* %main.fr, i16 %subtmp)
  %eqtmp = icmp eq i16 %14, 1
  br i1 %eqtmp, label %then11, label %ifcont16

then11:                                           ; preds = %do
  %15 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 2
  %16 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 2
  %loadtmp12 = load i16, i16* %16
  %addtmp13 = add i16 %loadtmp12, 1
  store i16 %addtmp13, i16* %15
  %17 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 1
  %loadtmp14 = load i16, i16* %17
  %subtmp15 = sub i16 %loadtmp14, 1
  call void @writeInteger(i16 %subtmp15)
  call void @writeString(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @strtmp.4, i16 0, i16 0))
  br label %ifcont16

ifcont16:                                         ; preds = %then11, %do
  %18 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 1
  %loadtmp17 = load i16, i16* %18
  %19 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 0
  %loadtmp18 = load i16, i16* %19
  %eqtmp19 = icmp ne i16 %loadtmp17, %loadtmp18
  %20 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 1
  %loadtmp20 = load i16, i16* %20
  %addtmp21 = add i16 %loadtmp20, 1
  %21 = call i16 @main_prime({ i16, i16, i16 }* %main.fr, i16 %addtmp21)
  %eqtmp22 = icmp eq i16 %21, 1
  %andtmp = and i1 %eqtmp19, %eqtmp22
  br i1 %andtmp, label %then23, label %ifcont28

then23:                                           ; preds = %ifcont16
  %22 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 2
  %23 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 2
  %loadtmp24 = load i16, i16* %23
  %addtmp25 = add i16 %loadtmp24, 1
  store i16 %addtmp25, i16* %22
  %24 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 1
  %loadtmp26 = load i16, i16* %24
  %addtmp27 = add i16 %loadtmp26, 1
  call void @writeInteger(i16 %addtmp27)
  call void @writeString(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @strtmp.5, i16 0, i16 0))
  br label %ifcont28

ifcont28:                                         ; preds = %then23, %ifcont16
  %25 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 1
  %26 = getelementptr inbounds { i16, i16, i16 }, { i16, i16, i16 }* %main.fr, i32 0, i32 1
  %loadtmp29 = load i16, i16* %26
  %addtmp30 = add i16 %loadtmp29, 6
  store i16 %addtmp30, i16* %25
  br label %cond
}

define i16 @main_prime({ i16, i16, i16 }* %fr_ptr, i16 %n) {
entry:
  %main_prime.fr = alloca { { i16, i16, i16 }*, i16, i16 }
  %0 = getelementptr inbounds { { i16, i16, i16 }*, i16, i16 }, { { i16, i16, i16 }*, i16, i16 }* %main_prime.fr, i32 0, i32 0
  store { i16, i16, i16 }* %fr_ptr, { i16, i16, i16 }** %0
  %1 = getelementptr inbounds { { i16, i16, i16 }*, i16, i16 }, { { i16, i16, i16 }*, i16, i16 }* %main_prime.fr, i32 0, i32 1
  store i16 %n, i16* %1
  %2 = getelementptr inbounds { { i16, i16, i16 }*, i16, i16 }, { { i16, i16, i16 }*, i16, i16 }* %main_prime.fr, i32 0, i32 1
  %loadtmp = load i16, i16* %2
  %lesstmp = icmp slt i16 %loadtmp, 0
  br i1 %lesstmp, label %then, label %else

then:                                             ; preds = %entry
  %3 = getelementptr inbounds { { i16, i16, i16 }*, i16, i16 }, { { i16, i16, i16 }*, i16, i16 }* %main_prime.fr, i32 0, i32 1
  %loadtmp1 = load i16, i16* %3
  %negmp = sub i16 0, %loadtmp1
  %4 = getelementptr inbounds { { i16, i16, i16 }*, i16, i16 }, { { i16, i16, i16 }*, i16, i16 }* %main_prime.fr, i32 0, i32 0
  %5 = load { i16, i16, i16 }*, { i16, i16, i16 }** %4
  %6 = call i16 @main_prime({ i16, i16, i16 }* %5, i16 %negmp)
  ret i16 %6

ifcont:                                           ; preds = %ifcont5
  ret i16 0

else:                                             ; preds = %entry
  %7 = getelementptr inbounds { { i16, i16, i16 }*, i16, i16 }, { { i16, i16, i16 }*, i16, i16 }* %main_prime.fr, i32 0, i32 1
  %loadtmp2 = load i16, i16* %7
  %lesstmp3 = icmp slt i16 %loadtmp2, 2
  br i1 %lesstmp3, label %then4, label %else6

then4:                                            ; preds = %else
  ret i16 0

ifcont5:                                          ; preds = %ifcont9
  br label %ifcont

else6:                                            ; preds = %else
  %8 = getelementptr inbounds { { i16, i16, i16 }*, i16, i16 }, { { i16, i16, i16 }*, i16, i16 }* %main_prime.fr, i32 0, i32 1
  %loadtmp7 = load i16, i16* %8
  %eqtmp = icmp eq i16 %loadtmp7, 2
  br i1 %eqtmp, label %then8, label %else10

then8:                                            ; preds = %else6
  ret i16 1

ifcont9:                                          ; preds = %ifcont14
  br label %ifcont5

else10:                                           ; preds = %else6
  %9 = getelementptr inbounds { { i16, i16, i16 }*, i16, i16 }, { { i16, i16, i16 }*, i16, i16 }* %main_prime.fr, i32 0, i32 1
  %loadtmp11 = load i16, i16* %9
  %modtmp = urem i16 %loadtmp11, 2
  %eqtmp12 = icmp eq i16 %modtmp, 0
  br i1 %eqtmp12, label %then13, label %else15

then13:                                           ; preds = %else10
  ret i16 0

ifcont14:                                         ; No predecessors!
  br label %ifcont9

else15:                                           ; preds = %else10
  %10 = getelementptr inbounds { { i16, i16, i16 }*, i16, i16 }, { { i16, i16, i16 }*, i16, i16 }* %main_prime.fr, i32 0, i32 2
  store i16 3, i16* %10
  br label %cond

cond:                                             ; preds = %ifcont23, %else15
  %11 = getelementptr inbounds { { i16, i16, i16 }*, i16, i16 }, { { i16, i16, i16 }*, i16, i16 }* %main_prime.fr, i32 0, i32 2
  %loadtmp16 = load i16, i16* %11
  %12 = getelementptr inbounds { { i16, i16, i16 }*, i16, i16 }, { { i16, i16, i16 }*, i16, i16 }* %main_prime.fr, i32 0, i32 1
  %loadtmp17 = load i16, i16* %12
  %divtmp = udiv i16 %loadtmp17, 2
  %lessequtmp = icmp sle i16 %loadtmp16, %divtmp
  br i1 %lessequtmp, label %do, label %after

after:                                            ; preds = %cond
  ret i16 1

do:                                               ; preds = %cond
  %13 = getelementptr inbounds { { i16, i16, i16 }*, i16, i16 }, { { i16, i16, i16 }*, i16, i16 }* %main_prime.fr, i32 0, i32 1
  %loadtmp18 = load i16, i16* %13
  %14 = getelementptr inbounds { { i16, i16, i16 }*, i16, i16 }, { { i16, i16, i16 }*, i16, i16 }* %main_prime.fr, i32 0, i32 2
  %loadtmp19 = load i16, i16* %14
  %modtmp20 = urem i16 %loadtmp18, %loadtmp19
  %eqtmp21 = icmp eq i16 %modtmp20, 0
  br i1 %eqtmp21, label %then22, label %ifcont23

then22:                                           ; preds = %do
  ret i16 0

ifcont23:                                         ; preds = %do
  %15 = getelementptr inbounds { { i16, i16, i16 }*, i16, i16 }, { { i16, i16, i16 }*, i16, i16 }* %main_prime.fr, i32 0, i32 2
  %16 = getelementptr inbounds { { i16, i16, i16 }*, i16, i16 }, { { i16, i16, i16 }*, i16, i16 }* %main_prime.fr, i32 0, i32 2
  %loadtmp24 = load i16, i16* %16
  %addtmp = add i16 %loadtmp24, 2
  store i16 %addtmp, i16* %15
  br label %cond
}

; ModuleID = 'alan'
source_filename = "alan"

@strtmp = private unnamed_addr constant [13 x i8] c"Moving from \00"
@strtmp.1 = private unnamed_addr constant [5 x i8] c" to \00"
@strtmp.2 = private unnamed_addr constant [3 x i8] c".\0A\00"
@strtmp.3 = private unnamed_addr constant [8 x i8] c"Rings: \00"
@strtmp.4 = private unnamed_addr constant [5 x i8] c"left\00"
@strtmp.5 = private unnamed_addr constant [6 x i8] c"right\00"
@strtmp.6 = private unnamed_addr constant [7 x i8] c"middle\00"

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
  %main.fr = alloca {}
  call void @main_solve({}* %main.fr)
  ret void
}

define void @main_solve({}* %fr_ptr) {
entry:
  %main_solve.fr = alloca { {}*, i16 }
  %0 = getelementptr inbounds { {}*, i16 }, { {}*, i16 }* %main_solve.fr, i32 0, i32 0
  store {}* %fr_ptr, {}** %0
  call void @writeString(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @strtmp.3, i16 0, i16 0))
  %1 = getelementptr inbounds { {}*, i16 }, { {}*, i16 }* %main_solve.fr, i32 0, i32 1
  %2 = call i16 @readInteger()
  store i16 %2, i16* %1
  %3 = getelementptr inbounds { {}*, i16 }, { {}*, i16 }* %main_solve.fr, i32 0, i32 1
  %loadtmp = load i16, i16* %3
  call void @main_solve_hanoi({ {}*, i16 }* %main_solve.fr, i16 %loadtmp, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @strtmp.4, i16 0, i16 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @strtmp.5, i16 0, i16 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @strtmp.6, i16 0, i16 0))
  ret void
}

define void @main_solve_hanoi({ {}*, i16 }* %fr_ptr, i16 %rings, i8* %source, i8* %target, i8* %auxiliary) {
entry:
  %main_solve_hanoi.fr = alloca { { {}*, i16 }*, i16, i8*, i8*, i8* }
  %0 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 0
  store { {}*, i16 }* %fr_ptr, { {}*, i16 }** %0
  %1 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 1
  store i16 %rings, i16* %1
  %2 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 2
  store i8* %source, i8** %2
  %3 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 3
  store i8* %target, i8** %3
  %4 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 4
  store i8* %auxiliary, i8** %4
  %5 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 1
  %loadtmp = load i16, i16* %5
  %morequtmp = icmp sge i16 %loadtmp, 1
  br i1 %morequtmp, label %then, label %ifcont

then:                                             ; preds = %entry
  %6 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 1
  %loadtmp1 = load i16, i16* %6
  %subtmp = sub i16 %loadtmp1, 1
  %7 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 2
  %8 = load i8*, i8** %7
  %9 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 4
  %10 = load i8*, i8** %9
  %11 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 3
  %12 = load i8*, i8** %11
  %13 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 0
  %14 = load { {}*, i16 }*, { {}*, i16 }** %13
  call void @main_solve_hanoi({ {}*, i16 }* %14, i16 %subtmp, i8* %8, i8* %10, i8* %12)
  %15 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 2
  %16 = load i8*, i8** %15
  %17 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 3
  %18 = load i8*, i8** %17
  call void @main_solve_hanoi_move({ { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i8* %16, i8* %18)
  %19 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 1
  %loadtmp2 = load i16, i16* %19
  %subtmp3 = sub i16 %loadtmp2, 1
  %20 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 4
  %21 = load i8*, i8** %20
  %22 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 3
  %23 = load i8*, i8** %22
  %24 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 2
  %25 = load i8*, i8** %24
  %26 = getelementptr inbounds { { {}*, i16 }*, i16, i8*, i8*, i8* }, { { {}*, i16 }*, i16, i8*, i8*, i8* }* %main_solve_hanoi.fr, i32 0, i32 0
  %27 = load { {}*, i16 }*, { {}*, i16 }** %26
  call void @main_solve_hanoi({ {}*, i16 }* %27, i16 %subtmp3, i8* %21, i8* %23, i8* %25)
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  ret void
}

define void @main_solve_hanoi_move({ { {}*, i16 }*, i16, i8*, i8*, i8* }* %fr_ptr, i8* %source, i8* %target) {
entry:
  %main_solve_hanoi_move.fr = alloca { { { {}*, i16 }*, i16, i8*, i8*, i8* }*, i8*, i8* }
  %0 = getelementptr inbounds { { { {}*, i16 }*, i16, i8*, i8*, i8* }*, i8*, i8* }, { { { {}*, i16 }*, i16, i8*, i8*, i8* }*, i8*, i8* }* %main_solve_hanoi_move.fr, i32 0, i32 0
  store { { {}*, i16 }*, i16, i8*, i8*, i8* }* %fr_ptr, { { {}*, i16 }*, i16, i8*, i8*, i8* }** %0
  %1 = getelementptr inbounds { { { {}*, i16 }*, i16, i8*, i8*, i8* }*, i8*, i8* }, { { { {}*, i16 }*, i16, i8*, i8*, i8* }*, i8*, i8* }* %main_solve_hanoi_move.fr, i32 0, i32 1
  store i8* %source, i8** %1
  %2 = getelementptr inbounds { { { {}*, i16 }*, i16, i8*, i8*, i8* }*, i8*, i8* }, { { { {}*, i16 }*, i16, i8*, i8*, i8* }*, i8*, i8* }* %main_solve_hanoi_move.fr, i32 0, i32 2
  store i8* %target, i8** %2
  call void @writeString(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @strtmp, i16 0, i16 0))
  %3 = getelementptr inbounds { { { {}*, i16 }*, i16, i8*, i8*, i8* }*, i8*, i8* }, { { { {}*, i16 }*, i16, i8*, i8*, i8* }*, i8*, i8* }* %main_solve_hanoi_move.fr, i32 0, i32 1
  %4 = load i8*, i8** %3
  call void @writeString(i8* %4)
  call void @writeString(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @strtmp.1, i16 0, i16 0))
  %5 = getelementptr inbounds { { { {}*, i16 }*, i16, i8*, i8*, i8* }*, i8*, i8* }, { { { {}*, i16 }*, i16, i8*, i8*, i8* }*, i8*, i8* }* %main_solve_hanoi_move.fr, i32 0, i32 2
  %6 = load i8*, i8** %5
  call void @writeString(i8* %6)
  call void @writeString(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @strtmp.2, i16 0, i16 0))
  ret void
}

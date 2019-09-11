; ModuleID = 'alan'
source_filename = "alan"

@strtmp = private unnamed_addr constant [26 x i8] c"I am in test1! Now x is: \00"
@strtmp.1 = private unnamed_addr constant [2 x i8] c"\0A\00"
@strtmp.2 = private unnamed_addr constant [2 x i8] c"\0A\00"

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
  call void @main_hello({}* %main.fr)
  ret void
}

define void @main_hello({}* %fr_ptr) {
entry:
  %main_hello.fr = alloca { {}*, i16 }
  %0 = getelementptr inbounds { {}*, i16 }, { {}*, i16 }* %main_hello.fr, i32 0, i32 0
  store {}* %fr_ptr, {}** %0
  %1 = getelementptr inbounds { {}*, i16 }, { {}*, i16 }* %main_hello.fr, i32 0, i32 1
  %2 = call i16 @readInteger()
  store i16 %2, i16* %1
  call void @main_hello_test({ {}*, i16 }* %main_hello.fr)
  ret void
}

define void @main_hello_test({ {}*, i16 }* %fr_ptr) {
entry:
  %main_hello_test.fr = alloca { { {}*, i16 }* }
  %0 = getelementptr inbounds { { {}*, i16 }* }, { { {}*, i16 }* }* %main_hello_test.fr, i32 0, i32 0
  store { {}*, i16 }* %fr_ptr, { {}*, i16 }** %0
  %1 = getelementptr inbounds { { {}*, i16 }* }, { { {}*, i16 }* }* %main_hello_test.fr, i32 0, i32 0
  %2 = load { {}*, i16 }*, { {}*, i16 }** %1
  %3 = getelementptr inbounds { {}*, i16 }, { {}*, i16 }* %2, i32 0, i32 1
  %loadtmp = load i16, i16* %3
  %morequtmp = icmp sge i16 %loadtmp, 0
  br i1 %morequtmp, label %then, label %ifcont

then:                                             ; preds = %entry
  %4 = getelementptr inbounds { { {}*, i16 }* }, { { {}*, i16 }* }* %main_hello_test.fr, i32 0, i32 0
  %5 = load { {}*, i16 }*, { {}*, i16 }** %4
  %6 = getelementptr inbounds { {}*, i16 }, { {}*, i16 }* %5, i32 0, i32 1
  %loadtmp1 = load i16, i16* %6
  call void @writeInteger(i16 %loadtmp1)
  call void @writeString(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @strtmp.2, i16 0, i16 0))
  %7 = getelementptr inbounds { { {}*, i16 }* }, { { {}*, i16 }* }* %main_hello_test.fr, i32 0, i32 0
  %8 = load { {}*, i16 }*, { {}*, i16 }** %7
  %9 = getelementptr inbounds { {}*, i16 }, { {}*, i16 }* %8, i32 0, i32 1
  %10 = getelementptr inbounds { { {}*, i16 }* }, { { {}*, i16 }* }* %main_hello_test.fr, i32 0, i32 0
  %11 = load { {}*, i16 }*, { {}*, i16 }** %10
  %12 = getelementptr inbounds { {}*, i16 }, { {}*, i16 }* %11, i32 0, i32 1
  %loadtmp2 = load i16, i16* %12
  %subtmp = sub i16 %loadtmp2, 1
  store i16 %subtmp, i16* %9
  call void @main_hello_test_test1({ { {}*, i16 }* }* %main_hello_test.fr)
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  ret void
}

define void @main_hello_test_test1({ { {}*, i16 }* }* %fr_ptr) {
entry:
  %main_hello_test_test1.fr = alloca { { { {}*, i16 }* }* }
  %0 = getelementptr inbounds { { { {}*, i16 }* }* }, { { { {}*, i16 }* }* }* %main_hello_test_test1.fr, i32 0, i32 0
  store { { {}*, i16 }* }* %fr_ptr, { { {}*, i16 }* }** %0
  %1 = getelementptr inbounds { { { {}*, i16 }* }* }, { { { {}*, i16 }* }* }* %main_hello_test_test1.fr, i32 0, i32 0
  %2 = load { { {}*, i16 }* }*, { { {}*, i16 }* }** %1
  %3 = getelementptr inbounds { { {}*, i16 }* }, { { {}*, i16 }* }* %2, i32 0, i32 0
  %4 = load { {}*, i16 }*, { {}*, i16 }** %3
  %5 = getelementptr inbounds { {}*, i16 }, { {}*, i16 }* %4, i32 0, i32 1
  %6 = getelementptr inbounds { { { {}*, i16 }* }* }, { { { {}*, i16 }* }* }* %main_hello_test_test1.fr, i32 0, i32 0
  %7 = load { { {}*, i16 }* }*, { { {}*, i16 }* }** %6
  %8 = getelementptr inbounds { { {}*, i16 }* }, { { {}*, i16 }* }* %7, i32 0, i32 0
  %9 = load { {}*, i16 }*, { {}*, i16 }** %8
  %10 = getelementptr inbounds { {}*, i16 }, { {}*, i16 }* %9, i32 0, i32 1
  %loadtmp = load i16, i16* %10
  %subtmp = sub i16 %loadtmp, 1
  store i16 %subtmp, i16* %5
  call void @writeString(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @strtmp, i16 0, i16 0))
  %11 = getelementptr inbounds { { { {}*, i16 }* }* }, { { { {}*, i16 }* }* }* %main_hello_test_test1.fr, i32 0, i32 0
  %12 = load { { {}*, i16 }* }*, { { {}*, i16 }* }** %11
  %13 = getelementptr inbounds { { {}*, i16 }* }, { { {}*, i16 }* }* %12, i32 0, i32 0
  %14 = load { {}*, i16 }*, { {}*, i16 }** %13
  %15 = getelementptr inbounds { {}*, i16 }, { {}*, i16 }* %14, i32 0, i32 1
  %loadtmp1 = load i16, i16* %15
  call void @writeInteger(i16 %loadtmp1)
  call void @writeString(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @strtmp.1, i16 0, i16 0))
  %16 = getelementptr inbounds { { { {}*, i16 }* }* }, { { { {}*, i16 }* }* }* %main_hello_test_test1.fr, i32 0, i32 0
  %17 = load { { {}*, i16 }* }*, { { {}*, i16 }* }** %16
  %18 = getelementptr inbounds { { {}*, i16 }* }, { { {}*, i16 }* }* %17, i32 0, i32 0
  %19 = load { {}*, i16 }*, { {}*, i16 }** %18
  call void @main_hello_test({ {}*, i16 }* %19)
  ret void
}

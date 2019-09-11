; ModuleID = 'alan'
source_filename = "alan"

@strtmp = private unnamed_addr constant [2 x i8] c"\0A\00"

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
  %main_hello.fr = alloca { {}*, [32 x i16] }
  %0 = getelementptr inbounds { {}*, [32 x i16] }, { {}*, [32 x i16] }* %main_hello.fr, i32 0, i32 0
  store {}* %fr_ptr, {}** %0
  %1 = getelementptr inbounds { {}*, [32 x i16] }, { {}*, [32 x i16] }* %main_hello.fr, i32 0, i32 1
  %arrtmp = getelementptr inbounds [32 x i16], [32 x i16]* %1, i16 0, i16 1
  store i16 2, i16* %arrtmp
  call void @main_hello_test({ {}*, [32 x i16] }* %main_hello.fr)
  ret void
}

define void @main_hello_test({ {}*, [32 x i16] }* %fr_ptr) {
entry:
  %main_hello_test.fr = alloca { { {}*, [32 x i16] }* }
  %0 = getelementptr inbounds { { {}*, [32 x i16] }* }, { { {}*, [32 x i16] }* }* %main_hello_test.fr, i32 0, i32 0
  store { {}*, [32 x i16] }* %fr_ptr, { {}*, [32 x i16] }** %0
  %1 = getelementptr inbounds { { {}*, [32 x i16] }* }, { { {}*, [32 x i16] }* }* %main_hello_test.fr, i32 0, i32 0
  %2 = load { {}*, [32 x i16] }*, { {}*, [32 x i16] }** %1
  %3 = getelementptr inbounds { {}*, [32 x i16] }, { {}*, [32 x i16] }* %2, i32 0, i32 1
  %arrtmp = getelementptr inbounds [32 x i16], [32 x i16]* %3, i16 0, i16 1
  %load_arr_elem_tmp = load i16, i16* %arrtmp
  call void @writeInteger(i16 %load_arr_elem_tmp)
  call void @writeString(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @strtmp, i16 0, i16 0))
  %4 = getelementptr inbounds { { {}*, [32 x i16] }* }, { { {}*, [32 x i16] }* }* %main_hello_test.fr, i32 0, i32 0
  %5 = load { {}*, [32 x i16] }*, { {}*, [32 x i16] }** %4
  %6 = getelementptr inbounds { {}*, [32 x i16] }, { {}*, [32 x i16] }* %5, i32 0, i32 1
  %arrtmp1 = getelementptr inbounds [32 x i16], [32 x i16]* %6, i16 0, i16 1
  %7 = getelementptr inbounds { { {}*, [32 x i16] }* }, { { {}*, [32 x i16] }* }* %main_hello_test.fr, i32 0, i32 0
  %8 = load { {}*, [32 x i16] }*, { {}*, [32 x i16] }** %7
  %9 = getelementptr inbounds { {}*, [32 x i16] }, { {}*, [32 x i16] }* %8, i32 0, i32 1
  %arrtmp2 = getelementptr inbounds [32 x i16], [32 x i16]* %9, i16 0, i16 1
  %load_arr_elem_tmp3 = load i16, i16* %arrtmp2
  %subtmp = sub i16 %load_arr_elem_tmp3, 1
  store i16 %subtmp, i16* %arrtmp1
  %10 = getelementptr inbounds { { {}*, [32 x i16] }* }, { { {}*, [32 x i16] }* }* %main_hello_test.fr, i32 0, i32 0
  %11 = load { {}*, [32 x i16] }*, { {}*, [32 x i16] }** %10
  %12 = getelementptr inbounds { {}*, [32 x i16] }, { {}*, [32 x i16] }* %11, i32 0, i32 1
  %arrtmp4 = getelementptr inbounds [32 x i16], [32 x i16]* %12, i16 0, i16 1
  %load_arr_elem_tmp5 = load i16, i16* %arrtmp4
  %morequtmp = icmp uge i16 %load_arr_elem_tmp5, 0
  br i1 %morequtmp, label %then, label %ifcont

then:                                             ; preds = %entry
  %13 = getelementptr inbounds { { {}*, [32 x i16] }* }, { { {}*, [32 x i16] }* }* %main_hello_test.fr, i32 0, i32 0
  %14 = load { {}*, [32 x i16] }*, { {}*, [32 x i16] }** %13
  call void @main_hello_test({ {}*, [32 x i16] }* %14)
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  ret void
}

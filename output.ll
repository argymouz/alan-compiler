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
  %main.fr = alloca { [32 x i16] }
  %0 = getelementptr inbounds { [32 x i16] }, { [32 x i16] }* %main.fr, i32 0, i32 0
  %arrtmp = getelementptr inbounds [32 x i16], [32 x i16]* %0, i16 0, i16 0
  store i16 1, i16* %arrtmp
  %1 = getelementptr inbounds { [32 x i16] }, { [32 x i16] }* %main.fr, i32 0, i32 0
  %arrtmp1 = getelementptr inbounds [32 x i16], [32 x i16]* %1, i16 0, i16 0
  %load_arr_elem_tmp = load i16, i16* %arrtmp1
  call void @writeInteger(i16 %load_arr_elem_tmp)
  call void @writeString(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @strtmp, i16 0, i16 0))
  ret void
}

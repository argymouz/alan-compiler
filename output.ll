; ModuleID = 'alan'
source_filename = "alan"

@strtmp = private unnamed_addr constant [25 x i8] c"Short-circuit works! :)\0A\00"
@strtmp.1 = private unnamed_addr constant [25 x i8] c"Short-circuit works! :)\0A\00"
@strtmp.2 = private unnamed_addr constant [25 x i8] c"Short-circuit works! :)\0A\00"
@strtmp.3 = private unnamed_addr constant [25 x i8] c"Short-circuit works! :)\0A\00"

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
  %main.fr = alloca { i16, i16 }
  %0 = getelementptr inbounds { i16, i16 }, { i16, i16 }* %main.fr, i32 0, i32 0
  %1 = call i16 @readInteger()
  store i16 %1, i16* %0
  %2 = getelementptr inbounds { i16, i16 }, { i16, i16 }* %main.fr, i32 0, i32 1
  %3 = call i16 @readInteger()
  store i16 %3, i16* %2
  %4 = getelementptr inbounds { i16, i16 }, { i16, i16 }* %main.fr, i32 0, i32 0
  %loadtmp = load i16, i16* %4
  %5 = getelementptr inbounds { i16, i16 }, { i16, i16 }* %main.fr, i32 0, i32 1
  %loadtmp1 = load i16, i16* %5
  %modtmp = srem i16 %loadtmp, %loadtmp1
  %eqtmp = icmp eq i16 %modtmp, 0
  br i1 %eqtmp, label %then, label %else13

then:                                             ; preds = %entry
  %6 = getelementptr inbounds { i16, i16 }, { i16, i16 }* %main.fr, i32 0, i32 0
  %loadtmp2 = load i16, i16* %6
  %7 = getelementptr inbounds { i16, i16 }, { i16, i16 }* %main.fr, i32 0, i32 1
  %loadtmp3 = load i16, i16* %7
  %subtmp = sub i16 %loadtmp3, 5
  %modtmp4 = srem i16 %loadtmp2, %subtmp
  %eqtmp5 = icmp eq i16 %modtmp4, 0
  br i1 %eqtmp5, label %then6, label %else11

then6:                                            ; preds = %then
  %8 = getelementptr inbounds { i16, i16 }, { i16, i16 }* %main.fr, i32 0, i32 0
  %loadtmp7 = load i16, i16* %8
  %eqtmp8 = icmp eq i16 %loadtmp7, 0
  br i1 %eqtmp8, label %then9, label %else

then9:                                            ; preds = %then6
  call void @writeString(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @strtmp, i16 0, i16 0))
  br label %ifcont

ifcont:                                           ; preds = %else, %then9
  br label %ifcont10

else:                                             ; preds = %then6
  call void @writeString(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @strtmp.1, i16 0, i16 0))
  br label %ifcont

ifcont10:                                         ; preds = %else11, %ifcont
  br label %ifcont12

else11:                                           ; preds = %then
  call void @writeString(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @strtmp.2, i16 0, i16 0))
  br label %ifcont10

ifcont12:                                         ; preds = %else13, %ifcont10
  ret void

else13:                                           ; preds = %entry
  call void @writeString(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @strtmp.3, i16 0, i16 0))
  br label %ifcont12
}

; ModuleID = 'alan'
source_filename = "alan"

@strtmp = private unnamed_addr constant [28 x i8] c"I am a multiple of 5 or 6!\0A\00"
@strtmp.1 = private unnamed_addr constant [32 x i8] c"I am not a multiple of either!\0A\00"

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

define i16 @main() {
entry:
  %main.fr = alloca { i16 }
  %0 = getelementptr inbounds { i16 }, { i16 }* %main.fr, i32 0, i32 0
  %1 = call i16 @readInteger()
  store i16 %1, i16* %0
  %2 = getelementptr inbounds { i16 }, { i16 }* %main.fr, i32 0, i32 0
  %loadtmp2 = load i16, i16* %2
  %modtmp3 = srem i16 %loadtmp2, 5
  %eqtmp4 = icmp eq i16 %modtmp3, 0
  br i1 %eqtmp4, label %then, label %else1

then:                                             ; preds = %entry, %else1
  call void @writeString(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @strtmp, i16 0, i16 0))
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  ret i16 0

else:                                             ; preds = %else1
  call void @writeString(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @strtmp.1, i16 0, i16 0))
  br label %ifcont

else1:                                            ; preds = %entry
  %3 = getelementptr inbounds { i16 }, { i16 }* %main.fr, i32 0, i32 0
  %loadtmp = load i16, i16* %3
  %modtmp = srem i16 %loadtmp, 6
  %eqtmp = icmp eq i16 %modtmp, 0
  br i1 %eqtmp, label %then, label %else
}

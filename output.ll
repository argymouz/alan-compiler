; ModuleID = 'alan'
source_filename = "alan"

@strtmp = private unnamed_addr constant [5 x i8] c"Hi!\0A\00"

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
  %loadtmp1 = load i16, i16* %2
  %modtmp2 = srem i16 %loadtmp1, 5
  %eqtmp3 = icmp eq i16 %modtmp2, 0
  br i1 %eqtmp3, label %then, label %else

then:                                             ; preds = %entry, %else
  call void @writeString(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @strtmp, i16 0, i16 0))
  ret i16 1

ifcont:                                           ; preds = %else
  ret i16 0

else:                                             ; preds = %entry
  %3 = getelementptr inbounds { i16 }, { i16 }* %main.fr, i32 0, i32 0
  %loadtmp = load i16, i16* %3
  %modtmp = srem i16 %loadtmp, 6
  %eqtmp = icmp eq i16 %modtmp, 0
  br i1 %eqtmp, label %then, label %ifcont
}

; ModuleID = 'alan'
source_filename = "alan"

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
  br label %cond

cond:                                             ; preds = %entry, %do
  %2 = getelementptr inbounds { i16 }, { i16 }* %main.fr, i32 0, i32 0
  %loadtmp3 = load i16, i16* %2
  %moretmp = icmp sgt i16 %loadtmp3, 0
  br i1 %moretmp, label %then, label %after

after:                                            ; preds = %cond, %then
  ret i16 0

do:                                               ; preds = %then
  %3 = getelementptr inbounds { i16 }, { i16 }* %main.fr, i32 0, i32 0
  %loadtmp = load i16, i16* %3
  call void @writeInteger(i16 %loadtmp)
  call void @writeChar(i8 10)
  %4 = getelementptr inbounds { i16 }, { i16 }* %main.fr, i32 0, i32 0
  %5 = getelementptr inbounds { i16 }, { i16 }* %main.fr, i32 0, i32 0
  %loadtmp1 = load i16, i16* %5
  %subtmp = sub i16 %loadtmp1, 1
  store i16 %subtmp, i16* %4
  br label %cond

then:                                             ; preds = %cond
  %6 = getelementptr inbounds { i16 }, { i16 }* %main.fr, i32 0, i32 0
  %loadtmp2 = load i16, i16* %6
  %eqtmp = icmp ne i16 %loadtmp2, 1
  br i1 %eqtmp, label %do, label %after
}

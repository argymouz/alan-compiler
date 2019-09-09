; ModuleID = 'alan'
source_filename = "alan"

declare void @writeInteger(i16)

declare void @writeByte(i8)

declare void @writeChar(i8)

declare void @writeString(i8*)

declare i16 @readInteger()

declare i8 @readByte()

declare i8 @readhar()

declare void @readString(i16, i8*)

declare i16 @extend(i8)

declare i8 @shrink(i16)

declare i16 @strlen(i8*)

declare i16 @strcmp(i8*, i8*)

declare void @strcpy(i8*, i8*)

declare void @strcat(i8*, i8*)

declare i64 @search_frames(i64, i16)

define i16 @main() {
entry:
  %main.fr = alloca { [16 x i16], i8 }
  br i1 true, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i16 0

ifcont:                                           ; preds = %entry
  ret i16 1
}

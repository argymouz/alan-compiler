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

define void @main() {
entry:
  %main.fr = alloca { i16 }
  %0 = getelementptr inbounds { i16 }, { i16 }* %main.fr, i32 0, i32 0
  %1 = call i16 @main_rettest({ i16 }* %main.fr)
  store i16 %1, i16* %0
  ret void
}

define i16 @main_rettest({ i16 }* %fr_ptr) {
entry:
  %main_rettest.fr = alloca { { i16 }* }
  %0 = getelementptr inbounds { { i16 }* }, { { i16 }* }* %main_rettest.fr, i32 0, i32 0
  store { i16 }* %fr_ptr, { i16 }** %0
  br i1 true, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i16 12

ifcont:                                           ; preds = %entry
  call void @writeInteger(i16 25)
  ret i16 0
}

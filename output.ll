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

define i16* @search_frames(i16* %fr_first_elem_addr, i16 %depth) {
entry:
  %moretmp = icmp ugt i16 %depth, 0
  br i1 %moretmp, label %then, label %else

then:                                             ; preds = %entry
  %new_depth = sub i16 %depth, 1
  br label %ifcont

ifcont:                                           ; preds = %else, %then

else:                                             ; preds = %entry
  br label %ifcont
}

define i16 @main() {
entry:
  %main.fr = alloca {}
  br i1 true, label %then, label %else

then:                                             ; preds = %entry
  ret i16 0

ifcont:                                           ; No predecessors!
  ret i16 2

else:                                             ; preds = %entry
  ret i16 1
}

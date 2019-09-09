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

define i64 @search_frames(i64 %fr_first_elem_addr, i16 %depth) {
entry:
  %moretmp = icmp ugt i16 %depth, 0

then:                                             ; No predecessors!
}

define void @main(i16 %i, i8 %j) {
entry:
  %main.fr = alloca { i16, i8, i8, [32 x i16] }
  ret void
}

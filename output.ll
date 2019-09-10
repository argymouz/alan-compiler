; ModuleID = 'alan'
source_filename = "alan"

@strtmp = private unnamed_addr constant [14 x i8] c"Hello world!\0A\00"

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

define i16* @search_frames(i16* %fr_addr, i16 %depth) {
entry:
  %moretmp = icmp ugt i16 %depth, 0
  br i1 %moretmp, label %then, label %else

then:                                             ; preds = %entry
  %new_depth = sub i16 %depth, 1
  %fr_first_pos = getelementptr inbounds i16, i16* %fr_addr, i16 0
  %new_fr = load i16, i16* %fr_first_pos
  %rec_call = call i16* @search_frames(i16 %new_fr, i16 %new_depth)
  ret i16* %rec_call

else:                                             ; preds = %entry
  ret i16* %fr_addr
}

define void @main() {
entry:
  %main.fr = alloca {}
  %0 = call i16* @search_frames({}* %main.fr, i16 1)
  call void @main_hello(i16* %0)
  ret void
}

define void @main_hello({}* %fr_ptr) {
entry:
  %main_hello.fr = alloca { {}*, i16 }
  call void @writeString(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @strtmp, i16 0, i16 0))
  ret void
}

; readByte () : byte;
; --------------------
; This function reads a byte from the standard input.
; An integer is read by a call to readInteger, and its
; 8 LSB are returned.

        section .code
        global  _readByte
        extern  _readInteger
	extern _shrink

_readByte push rbp
	mov rbp, rsp
	call _readInteger
	xor rdi, rdi
	mov di, ax
	call _shrink
	pop rbp

	ret

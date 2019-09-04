; writeByte (b : byte) : proc;
; ---------------------------------
; This function prints a byte to the standard output.
; It uses writeInteger.

        section .code
        global  _writeByte
	extern _writeInteger
	extern _extend

_writeByte push rbp
	mov rbp, rsp
	call _extend
	xor rdi, rdi
	mov di, ax
	call _writeInteger
	pop rbp

	ret

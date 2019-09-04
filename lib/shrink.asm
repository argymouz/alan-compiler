; shrink (i : byte) : byte
; -----------------
; This function takes an integer and converts it
; to a byte by omitting the 8 most significant bits.

	section .code
	global _shrink

_shrink  push rbp
	mov rbp, rsp
	mov ax, di
	and rax, 0xff
	pop rbp

	ret

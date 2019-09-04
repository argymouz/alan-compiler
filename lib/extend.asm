; extend (b : byte) : int
; -----------------
; This function takes a byte and converts it to integer.

	section .code
	global _extend

_extend push rbp
	mov rbp, rsp
	xor rax, rax
	mov al, dil
	pop rbp

	ret

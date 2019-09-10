	.text
	.file	"alan"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$.Lstrtmp, %edi
	callq	writeString
	popq	%rax
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.Lstrtmp,@object        # @strtmp
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrtmp:
	.asciz	"Hello world!\n"
	.size	.Lstrtmp, 14


	.section	".note.GNU-stack","",@progbits

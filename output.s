	.text
	.file	"alan"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movw	$1, 8(%rsp)
	movl	8(%rsp), %edi
	callq	writeInteger
	movl	$.Lstrtmp, %edi
	callq	writeString
	addq	$72, %rsp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.Lstrtmp,@object        # @strtmp
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrtmp:
	.asciz	"\n"
	.size	.Lstrtmp, 2


	.section	".note.GNU-stack","",@progbits

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
	movl	$2, %edi
	callq	writeInteger
	movl	$3, %edi
	callq	writeInteger
	movl	$6, %edi
	callq	writeInteger
	movl	$7, %edi
	callq	writeInteger
	movl	$10, %edi
	callq	writeInteger
	movq	%rsp, %rdi
	callq	main_correct
	popq	%rax
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	main_correct            # -- Begin function main_correct
	.p2align	4, 0x90
	.type	main_correct,@function
main_correct:                           # @main_correct
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$.Lstrtmp, %edi
	callq	writeString
	movl	$.Lstrtmp.1, %edi
	callq	writeString
	popq	%rax
	retq
.Lfunc_end1:
	.size	main_correct, .Lfunc_end1-main_correct
	.cfi_endproc
                                        # -- End function
	.type	.Lstrtmp,@object        # @strtmp
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrtmp:
	.asciz	"\n---\n"
	.size	.Lstrtmp, 6

	.type	.Lstrtmp.1,@object      # @strtmp.1
.Lstrtmp.1:
	.asciz	"236710\n"
	.size	.Lstrtmp.1, 8


	.section	".note.GNU-stack","",@progbits

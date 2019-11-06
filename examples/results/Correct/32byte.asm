	.text
	.file	"alan"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movw	$49, 8(%rsp)
	movl	$49, %edi
	callq	writeByte
	xorl	%edi, %edi
	callq	writeByte
	movl	$49, %edi
	callq	writeByte
	xorl	%edi, %edi
	callq	writeByte
	leaq	8(%rsp), %rbx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%rbx, %rdx
	callq	main_lala
	movzbl	%al, %edi
	callq	writeByte
	movq	%rbx, %rdi
	callq	main_correct
	addq	$16, %rsp
	popq	%rbx
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
	.globl	main_lala               # -- Begin function main_lala
	.p2align	4, 0x90
	.type	main_lala,@function
main_lala:                              # @main_lala
	.cfi_startproc
# %bb.0:                                # %entry
	movb	(%rdx), %al
	mulb	%sil
	retq
.Lfunc_end2:
	.size	main_lala, .Lfunc_end2-main_lala
	.cfi_endproc
                                        # -- End function
	.type	.Lstrtmp,@object        # @strtmp
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrtmp:
	.asciz	"\n---\n"
	.size	.Lstrtmp, 6

	.type	.Lstrtmp.1,@object      # @strtmp.1
.Lstrtmp.1:
	.asciz	"10100\n"
	.size	.Lstrtmp.1, 7


	.section	".note.GNU-stack","",@progbits

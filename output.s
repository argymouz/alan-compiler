	.text
	.file	"alan"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	$.Lstrtmp, %edi
	callq	writeString
	callq	readInteger
	movw	%ax, 8(%rsp)
	movl	$.Lstrtmp.1, %edi
	callq	writeString
	movw	$0, 12(%rsp)
	movswl	8(%rsp), %eax
	cmpl	$2, %eax
	jl	.LBB0_2
# %bb.1:                                # %then
	incw	12(%rsp)
	movl	$2, %edi
	callq	writeInteger
	movl	$.Lstrtmp.2, %edi
	callq	writeString
.LBB0_2:                                # %ifcont
	movswl	8(%rsp), %eax
	cmpl	$3, %eax
	jl	.LBB0_4
# %bb.3:                                # %then4
	incw	12(%rsp)
	movl	$3, %edi
	callq	writeInteger
	movl	$.Lstrtmp.3, %edi
	callq	writeString
.LBB0_4:                                # %ifcont7
	movw	$6, 10(%rsp)
	leaq	8(%rsp), %r14
	jmp	.LBB0_5
	.p2align	4, 0x90
.LBB0_11:                               # %ifcont28
                                        #   in Loop: Header=BB0_5 Depth=1
	addw	$6, 10(%rsp)
.LBB0_5:                                # %cond
                                        # =>This Inner Loop Header: Depth=1
	movzwl	10(%rsp), %eax
	cmpw	8(%rsp), %ax
	jg	.LBB0_12
# %bb.6:                                # %do
                                        #   in Loop: Header=BB0_5 Depth=1
	movzwl	10(%rsp), %esi
	decl	%esi
	movq	%r14, %rdi
	callq	main_prime
	movzwl	%ax, %eax
	cmpl	$1, %eax
	jne	.LBB0_8
# %bb.7:                                # %then11
                                        #   in Loop: Header=BB0_5 Depth=1
	incw	12(%rsp)
	movzwl	10(%rsp), %edi
	decl	%edi
	callq	writeInteger
	movl	$.Lstrtmp.4, %edi
	callq	writeString
.LBB0_8:                                # %ifcont16
                                        #   in Loop: Header=BB0_5 Depth=1
	movzwl	10(%rsp), %ebp
	movzwl	8(%rsp), %ebx
	movl	%ebp, %esi
	incl	%esi
	movq	%r14, %rdi
	callq	main_prime
	cmpw	%bx, %bp
	je	.LBB0_11
# %bb.9:                                # %ifcont16
                                        #   in Loop: Header=BB0_5 Depth=1
	movzwl	%ax, %eax
	cmpl	$1, %eax
	jne	.LBB0_11
# %bb.10:                               # %then23
                                        #   in Loop: Header=BB0_5 Depth=1
	incw	12(%rsp)
	movzwl	10(%rsp), %edi
	incl	%edi
	callq	writeInteger
	movl	$.Lstrtmp.5, %edi
	callq	writeString
	jmp	.LBB0_11
.LBB0_12:                               # %after
	movl	$.Lstrtmp.6, %edi
	callq	writeString
	movl	12(%rsp), %edi
	callq	writeInteger
	movl	$.Lstrtmp.7, %edi
	callq	writeString
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	main_prime              # -- Begin function main_prime
	.p2align	4, 0x90
	.type	main_prime,@function
main_prime:                             # @main_prime
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movw	%si, 16(%rsp)
	testw	%si, %si
	js	.LBB1_8
# %bb.1:                                # %else
	movswl	16(%rsp), %eax
	cmpl	$1, %eax
	jg	.LBB1_2
.LBB1_9:                                # %then4
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
.LBB1_8:                                # %then
	xorl	%esi, %esi
	subw	16(%rsp), %si
	movq	8(%rsp), %rdi
	callq	main_prime
	addq	$24, %rsp
	retq
.LBB1_2:                                # %else6
	movzwl	16(%rsp), %eax
	cmpl	$2, %eax
	je	.LBB1_10
# %bb.3:                                # %else10
	testb	$1, 16(%rsp)
	je	.LBB1_9
# %bb.4:                                # %else15
	movw	$3, 18(%rsp)
	jmp	.LBB1_5
	.p2align	4, 0x90
.LBB1_7:                                # %ifcont23
                                        #   in Loop: Header=BB1_5 Depth=1
	addw	$2, 18(%rsp)
.LBB1_5:                                # %cond
                                        # =>This Inner Loop Header: Depth=1
	movzwl	16(%rsp), %eax
	shrl	%eax
	cmpw	%ax, 18(%rsp)
	jg	.LBB1_10
# %bb.6:                                # %do
                                        #   in Loop: Header=BB1_5 Depth=1
	movzwl	16(%rsp), %eax
	xorl	%edx, %edx
	divw	18(%rsp)
	testw	%dx, %dx
	jne	.LBB1_7
	jmp	.LBB1_9
.LBB1_10:                               # %then8
	movw	$1, %ax
	addq	$24, %rsp
	retq
.Lfunc_end1:
	.size	main_prime, .Lfunc_end1-main_prime
	.cfi_endproc
                                        # -- End function
	.type	.Lstrtmp,@object        # @strtmp
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrtmp:
	.asciz	"Limit: "
	.size	.Lstrtmp, 8

	.type	.Lstrtmp.1,@object      # @strtmp.1
.Lstrtmp.1:
	.asciz	"Primes:\n"
	.size	.Lstrtmp.1, 9

	.type	.Lstrtmp.2,@object      # @strtmp.2
.Lstrtmp.2:
	.asciz	"\n"
	.size	.Lstrtmp.2, 2

	.type	.Lstrtmp.3,@object      # @strtmp.3
.Lstrtmp.3:
	.asciz	"\n"
	.size	.Lstrtmp.3, 2

	.type	.Lstrtmp.4,@object      # @strtmp.4
.Lstrtmp.4:
	.asciz	"\n"
	.size	.Lstrtmp.4, 2

	.type	.Lstrtmp.5,@object      # @strtmp.5
.Lstrtmp.5:
	.asciz	"\n"
	.size	.Lstrtmp.5, 2

	.type	.Lstrtmp.6,@object      # @strtmp.6
.Lstrtmp.6:
	.asciz	"\nTotal: "
	.size	.Lstrtmp.6, 9

	.type	.Lstrtmp.7,@object      # @strtmp.7
.Lstrtmp.7:
	.asciz	"\n"
	.size	.Lstrtmp.7, 2


	.section	".note.GNU-stack","",@progbits

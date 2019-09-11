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
	movq	%rsp, %rdi
	callq	main_hello
	popq	%rax
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	main_hello              # -- Begin function main_hello
	.p2align	4, 0x90
	.type	main_hello,@function
main_hello:                             # @main_hello
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	callq	readInteger
	movw	%ax, 16(%rsp)
	leaq	8(%rsp), %rdi
	callq	main_hello_test
	addq	$24, %rsp
	retq
.Lfunc_end1:
	.size	main_hello, .Lfunc_end1-main_hello
	.cfi_endproc
                                        # -- End function
	.globl	main_hello_test         # -- Begin function main_hello_test
	.p2align	4, 0x90
	.type	main_hello_test,@function
main_hello_test:                        # @main_hello_test
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	cmpw	$0, 8(%rdi)
	js	.LBB2_2
# %bb.1:                                # %then
	movq	(%rsp), %rax
	movzwl	8(%rax), %edi
	callq	writeInteger
	movl	$.Lstrtmp.2, %edi
	callq	writeString
	movq	(%rsp), %rax
	decw	8(%rax)
	movq	%rsp, %rdi
	callq	main_hello_test_test1
.LBB2_2:                                # %ifcont
	popq	%rax
	retq
.Lfunc_end2:
	.size	main_hello_test, .Lfunc_end2-main_hello_test
	.cfi_endproc
                                        # -- End function
	.globl	main_hello_test_test1   # -- Begin function main_hello_test_test1
	.p2align	4, 0x90
	.type	main_hello_test_test1,@function
main_hello_test_test1:                  # @main_hello_test_test1
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	movq	(%rdi), %rax
	decw	8(%rax)
	movl	$.Lstrtmp, %edi
	callq	writeString
	movq	(%rsp), %rax
	movq	(%rax), %rax
	movzwl	8(%rax), %edi
	callq	writeInteger
	movl	$.Lstrtmp.1, %edi
	callq	writeString
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	main_hello_test
	popq	%rax
	retq
.Lfunc_end3:
	.size	main_hello_test_test1, .Lfunc_end3-main_hello_test_test1
	.cfi_endproc
                                        # -- End function
	.type	.Lstrtmp,@object        # @strtmp
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.Lstrtmp:
	.asciz	"I am in test1! Now x is: "
	.size	.Lstrtmp, 26

	.type	.Lstrtmp.1,@object      # @strtmp.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrtmp.1:
	.asciz	"\n"
	.size	.Lstrtmp.1, 2

	.type	.Lstrtmp.2,@object      # @strtmp.2
.Lstrtmp.2:
	.asciz	"\n"
	.size	.Lstrtmp.2, 2


	.section	".note.GNU-stack","",@progbits

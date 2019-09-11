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
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdi, (%rsp)
	movw	$2, 10(%rsp)
	movq	%rsp, %rdi
	callq	main_hello_test
	addq	$72, %rsp
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
	movzwl	10(%rdi), %edi
	callq	writeInteger
	movl	$.Lstrtmp, %edi
	callq	writeString
	movq	(%rsp), %rax
	decw	10(%rax)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_2
# %bb.1:                                # %then
	movq	(%rsp), %rdi
	callq	main_hello_test
.LBB2_2:                                # %ifcont
	popq	%rax
	retq
.Lfunc_end2:
	.size	main_hello_test, .Lfunc_end2-main_hello_test
	.cfi_endproc
                                        # -- End function
	.type	.Lstrtmp,@object        # @strtmp
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrtmp:
	.asciz	"\n"
	.size	.Lstrtmp, 2


	.section	".note.GNU-stack","",@progbits

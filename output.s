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
	callq	readInteger
	movw	%ax, (%rsp)
	movl	$.Lstrtmp.2, %edi
	callq	writeString
	movl	(%rsp), %edi
	callq	writeInteger
	movl	$10, %edi
	callq	writeChar
	movq	%rsp, %rdi
	callq	main_f1
	popq	%rax
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	main_f1                 # -- Begin function main_f1
	.p2align	4, 0x90
	.type	main_f1,@function
main_f1:                                # @main_f1
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	cmpw	$0, (%rdi)
	js	.LBB1_2
# %bb.1:                                # %then
	movq	(%rsp), %rax
	decw	(%rax)
	movl	$.Lstrtmp.1, %edi
	callq	writeString
	movq	(%rsp), %rax
	movzwl	(%rax), %edi
	callq	writeInteger
	movl	$10, %edi
	callq	writeChar
	movq	%rsp, %rdi
	callq	main_f1_f2
.LBB1_2:                                # %ifcont
	popq	%rax
	retq
.Lfunc_end1:
	.size	main_f1, .Lfunc_end1-main_f1
	.cfi_endproc
                                        # -- End function
	.globl	main_f1_f2              # -- Begin function main_f1_f2
	.p2align	4, 0x90
	.type	main_f1_f2,@function
main_f1_f2:                             # @main_f1_f2
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	movq	(%rdi), %rax
	cmpw	$0, (%rax)
	js	.LBB2_2
# %bb.1:                                # %then
	movq	(%rsp), %rax
	movq	(%rax), %rax
	decw	(%rax)
	movl	$.Lstrtmp, %edi
	callq	writeString
	movq	(%rsp), %rax
	movq	(%rax), %rax
	movzwl	(%rax), %edi
	callq	writeInteger
	movl	$10, %edi
	callq	writeChar
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	main_f1
.LBB2_2:                                # %ifcont
	popq	%rax
	retq
.Lfunc_end2:
	.size	main_f1_f2, .Lfunc_end2-main_f1_f2
	.cfi_endproc
                                        # -- End function
	.type	.Lstrtmp,@object        # @strtmp
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.Lstrtmp:
	.asciz	"My value was change by f2 to: "
	.size	.Lstrtmp, 31

	.type	.Lstrtmp.1,@object      # @strtmp.1
	.p2align	4
.Lstrtmp.1:
	.asciz	"My value was changed by f1 to: "
	.size	.Lstrtmp.1, 32

	.type	.Lstrtmp.2,@object      # @strtmp.2
	.p2align	4
.Lstrtmp.2:
	.asciz	"My initial value is: "
	.size	.Lstrtmp.2, 22


	.section	".note.GNU-stack","",@progbits

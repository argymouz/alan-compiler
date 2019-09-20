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
	callq	readInteger
	movl	%eax, %ecx
	movw	%cx, 2(%rsp)
	movzwl	(%rsp), %eax
	cwtd
	idivw	%cx
	testw	%dx, %dx
	je	.LBB0_1
# %bb.7:                                # %else13
	movl	$.Lstrtmp.3, %edi
	jmp	.LBB0_6
.LBB0_1:                                # %then
	movzwl	(%rsp), %eax
	movzwl	2(%rsp), %ecx
	addl	$-5, %ecx
	cwtd
	idivw	%cx
	testw	%dx, %dx
	je	.LBB0_2
# %bb.5:                                # %else11
	movl	$.Lstrtmp.2, %edi
	jmp	.LBB0_6
.LBB0_2:                                # %then6
	cmpw	$0, (%rsp)
	je	.LBB0_3
# %bb.4:                                # %else
	movl	$.Lstrtmp.1, %edi
	jmp	.LBB0_6
.LBB0_3:                                # %then9
	movl	$.Lstrtmp, %edi
.LBB0_6:                                # %ifcont12
	callq	writeString
	popq	%rax
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.Lstrtmp,@object        # @strtmp
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.Lstrtmp:
	.asciz	"Short-circuit works! :)\n"
	.size	.Lstrtmp, 25

	.type	.Lstrtmp.1,@object      # @strtmp.1
	.p2align	4
.Lstrtmp.1:
	.asciz	"Short-circuit works! :)\n"
	.size	.Lstrtmp.1, 25

	.type	.Lstrtmp.2,@object      # @strtmp.2
	.p2align	4
.Lstrtmp.2:
	.asciz	"Short-circuit works! :)\n"
	.size	.Lstrtmp.2, 25

	.type	.Lstrtmp.3,@object      # @strtmp.3
	.p2align	4
.Lstrtmp.3:
	.asciz	"Short-circuit works! :)\n"
	.size	.Lstrtmp.3, 25


	.section	".note.GNU-stack","",@progbits

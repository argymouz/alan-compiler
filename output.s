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
	cmpw	$0, (%rsp)
	jg	.LBB0_2
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_3:                                # %do
                                        #   in Loop: Header=BB0_2 Depth=1
	movl	(%rsp), %edi
	callq	writeInteger
	movl	$10, %edi
	callq	writeChar
	decw	(%rsp)
	cmpw	$0, (%rsp)
	jle	.LBB0_4
.LBB0_2:                                # %then
                                        # =>This Inner Loop Header: Depth=1
	movzwl	(%rsp), %eax
	cmpl	$1, %eax
	jne	.LBB0_3
.LBB0_4:                                # %after
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits

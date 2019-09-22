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
	movswl	(%rsp), %eax
	imull	$26215, %eax, %ecx      # imm = 0x6667
	movl	%ecx, %edx
	shrl	$31, %edx
	sarl	$17, %ecx
	addl	%edx, %ecx
	leal	(%rcx,%rcx,4), %ecx
	cmpw	%cx, %ax
	je	.LBB0_1
# %bb.3:                                # %else1
	movswl	(%rsp), %eax
	imull	$10923, %eax, %ecx      # imm = 0x2AAB
	movl	%ecx, %edx
	shrl	$31, %edx
	shrl	$16, %ecx
	addl	%edx, %ecx
	addl	%ecx, %ecx
	leal	(%rcx,%rcx,2), %ecx
	cmpw	%cx, %ax
	je	.LBB0_1
# %bb.4:                                # %else
	movl	$.Lstrtmp.1, %edi
	jmp	.LBB0_2
.LBB0_1:                                # %then
	movl	$.Lstrtmp, %edi
.LBB0_2:                                # %ifcont
	callq	writeString
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.Lstrtmp,@object        # @strtmp
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.Lstrtmp:
	.asciz	"I am a multiple of 5 or 6!\n"
	.size	.Lstrtmp, 28

	.type	.Lstrtmp.1,@object      # @strtmp.1
	.p2align	4
.Lstrtmp.1:
	.asciz	"I am not a multiple of either!\n"
	.size	.Lstrtmp.1, 32


	.section	".note.GNU-stack","",@progbits

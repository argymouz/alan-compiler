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
	callq	main_solve
	popq	%rax
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	main_solve              # -- Begin function main_solve
	.p2align	4, 0x90
	.type	main_solve,@function
main_solve:                             # @main_solve
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movl	$.Lstrtmp.3, %edi
	callq	writeString
	callq	readInteger
	movw	%ax, 16(%rsp)
	movl	16(%rsp), %esi
	leaq	8(%rsp), %rdi
	movl	$.Lstrtmp.4, %edx
	movl	$.Lstrtmp.5, %ecx
	movl	$.Lstrtmp.6, %r8d
	callq	main_solve_hanoi
	addq	$24, %rsp
	retq
.Lfunc_end1:
	.size	main_solve, .Lfunc_end1-main_solve
	.cfi_endproc
                                        # -- End function
	.globl	main_solve_hanoi        # -- Begin function main_solve_hanoi
	.p2align	4, 0x90
	.type	main_solve_hanoi,@function
main_solve_hanoi:                       # @main_solve_hanoi
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, (%rsp)
	movw	%si, 8(%rsp)
	movq	%rdx, 16(%rsp)
	movq	%rcx, 24(%rsp)
	movq	%r8, 32(%rsp)
	testw	%si, %si
	jle	.LBB2_2
# %bb.1:                                # %then
	movzwl	8(%rsp), %esi
	decl	%esi
	movq	(%rsp), %rdi
	movq	16(%rsp), %rdx
	movq	32(%rsp), %rcx
	movq	24(%rsp), %r8
	callq	main_solve_hanoi
	movq	16(%rsp), %rsi
	movq	24(%rsp), %rdx
	movq	%rsp, %rdi
	callq	main_solve_hanoi_move
	movzwl	8(%rsp), %esi
	decl	%esi
	movq	32(%rsp), %rdx
	movq	24(%rsp), %rcx
	movq	(%rsp), %rdi
	movq	16(%rsp), %r8
	callq	main_solve_hanoi
.LBB2_2:                                # %ifcont
	addq	$40, %rsp
	retq
.Lfunc_end2:
	.size	main_solve_hanoi, .Lfunc_end2-main_solve_hanoi
	.cfi_endproc
                                        # -- End function
	.globl	main_solve_hanoi_move   # -- Begin function main_solve_hanoi_move
	.p2align	4, 0x90
	.type	main_solve_hanoi_move,@function
main_solve_hanoi_move:                  # @main_solve_hanoi_move
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, (%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rdx, 16(%rsp)
	movl	$.Lstrtmp, %edi
	callq	writeString
	movq	8(%rsp), %rdi
	callq	writeString
	movl	$.Lstrtmp.1, %edi
	callq	writeString
	movq	16(%rsp), %rdi
	callq	writeString
	movl	$.Lstrtmp.2, %edi
	callq	writeString
	addq	$24, %rsp
	retq
.Lfunc_end3:
	.size	main_solve_hanoi_move, .Lfunc_end3-main_solve_hanoi_move
	.cfi_endproc
                                        # -- End function
	.type	.Lstrtmp,@object        # @strtmp
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrtmp:
	.asciz	"Moving from "
	.size	.Lstrtmp, 13

	.type	.Lstrtmp.1,@object      # @strtmp.1
.Lstrtmp.1:
	.asciz	" to "
	.size	.Lstrtmp.1, 5

	.type	.Lstrtmp.2,@object      # @strtmp.2
.Lstrtmp.2:
	.asciz	".\n"
	.size	.Lstrtmp.2, 3

	.type	.Lstrtmp.3,@object      # @strtmp.3
.Lstrtmp.3:
	.asciz	"Rings: "
	.size	.Lstrtmp.3, 8

	.type	.Lstrtmp.4,@object      # @strtmp.4
.Lstrtmp.4:
	.asciz	"left"
	.size	.Lstrtmp.4, 5

	.type	.Lstrtmp.5,@object      # @strtmp.5
.Lstrtmp.5:
	.asciz	"right"
	.size	.Lstrtmp.5, 6

	.type	.Lstrtmp.6,@object      # @strtmp.6
.Lstrtmp.6:
	.asciz	"middle"
	.size	.Lstrtmp.6, 7


	.section	".note.GNU-stack","",@progbits

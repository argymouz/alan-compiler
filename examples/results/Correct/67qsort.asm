	.text
	.file	"alan"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	$.Lstrtmp.2, %edi
	callq	writeString
	callq	readInteger
                                        # kill: def %ax killed %ax def %eax
	movw	%ax, (%rsp)
	movw	$0, 34(%rsp)
	xorl	%ecx, %ecx
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_3:                                # %do
                                        #   in Loop: Header=BB0_1 Depth=1
	imull	$137, %eax, %eax
	leal	220(%rax,%rcx), %eax
	movswl	%ax, %edx
	imull	$5191, %edx, %edx       # imm = 0x1447
	movl	%edx, %esi
	shrl	$31, %esi
	sarl	$19, %edx
	addl	%esi, %edx
	imull	$101, %edx, %edx
	subl	%edx, %eax
	movw	%ax, (%rsp)
	movswq	%cx, %rcx
	movw	%ax, 2(%rsp,%rcx,2)
	movzwl	34(%rsp), %ecx
	incl	%ecx
	movw	%cx, 34(%rsp)
.LBB0_1:                                # %cond
                                        # =>This Inner Loop Header: Depth=1
	movswl	%cx, %edx
	cmpl	$16, %edx
	jl	.LBB0_3
# %bb.2:                                # %after
	leaq	2(%rsp), %r14
	movq	%rsp, %rbx
	movl	$.Lstrtmp.3, %esi
	movl	$16, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	"main-writeArray"
	movl	$16, %esi
	movq	%rbx, %rdi
	movq	%r14, %rdx
	callq	"main-qsort"
	movl	$.Lstrtmp.4, %esi
	movl	$16, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	"main-writeArray"
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	"main-qsort"            # -- Begin function main-qsort
	.p2align	4, 0x90
	.type	"main-qsort",@function
"main-qsort":                           # @main-qsort
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
                                        # kill: def %esi killed %esi def %rsi
	movq	%rdi, (%rsp)
	movw	%si, 8(%rsp)
	movq	%rdx, 16(%rsp)
	leal	-1(%rsi), %edx
	movq	%rsp, %rdi
	xorl	%esi, %esi
	callq	"main-qsort-qsort_auxil"
	addq	$24, %rsp
	retq
.Lfunc_end1:
	.size	"main-qsort", .Lfunc_end1-"main-qsort"
	.cfi_endproc
                                        # -- End function
	.globl	"main-qsort-qsort_auxil" # -- Begin function main-qsort-qsort_auxil
	.p2align	4, 0x90
	.type	"main-qsort-qsort_auxil",@function
"main-qsort-qsort_auxil":               # @main-qsort-qsort_auxil
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
                                        # kill: def %edx killed %edx def %rdx
                                        # kill: def %esi killed %esi def %rsi
	movq	%rdi, (%rsp)
	movw	%si, 8(%rsp)
	movw	%dx, 10(%rsp)
	cmpw	%dx, %si
	jge	.LBB2_4
# %bb.1:                                # %then
	leal	(%rdx,%rsi), %eax
	movl	%eax, %ecx
	shrl	$15, %ecx
	andl	$1, %ecx
	addl	%eax, %ecx
	sarw	%cx
	movq	16(%rdi), %rax
	movswq	%cx, %rcx
	movzwl	(%rax,%rcx,2), %eax
	movw	%ax, 12(%rsp)
	movw	%si, 14(%rsp)
	movw	%dx, 16(%rsp)
	movq	%rsp, %r14
	jmp	.LBB2_2
	.p2align	4, 0x90
.LBB2_11:                               # %then21
                                        #   in Loop: Header=BB2_2 Depth=1
	leaq	(%rax,%rcx,2), %rdx
	leaq	(%rax,%rbx,2), %rsi
	movq	%r14, %rdi
	callq	"main-qsort-qsort_auxil-swap"
	movzwl	14(%rsp), %esi
	incl	%esi
	movw	%si, 14(%rsp)
	movzwl	16(%rsp), %edx
	decl	%edx
	movw	%dx, 16(%rsp)
.LBB2_2:                                # %cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_6 Depth 2
                                        #     Child Loop BB2_9 Depth 2
	cmpw	%dx, %si
	jg	.LBB2_3
# %bb.5:                                # %do
                                        #   in Loop: Header=BB2_2 Depth=1
	movq	(%rsp), %r8
	movq	16(%r8), %rax
	movzwl	12(%rsp), %edi
	jmp	.LBB2_6
	.p2align	4, 0x90
.LBB2_7:                                # %do6
                                        #   in Loop: Header=BB2_6 Depth=2
	incl	%esi
	movw	%si, 14(%rsp)
.LBB2_6:                                # %cond4
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movswq	%si, %rbx
	cmpw	%di, (%rax,%rbx,2)
	jl	.LBB2_7
	jmp	.LBB2_9
	.p2align	4, 0x90
.LBB2_8:                                # %do15
                                        #   in Loop: Header=BB2_9 Depth=2
	decl	%edx
	movw	%dx, 16(%rsp)
	movq	16(%r8), %rax
.LBB2_9:                                # %cond13
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movswq	%dx, %rcx
	cmpw	%di, (%rax,%rcx,2)
	jg	.LBB2_8
# %bb.10:                               # %after14
                                        #   in Loop: Header=BB2_2 Depth=1
	cmpw	%dx, %si
	jg	.LBB2_2
	jmp	.LBB2_11
.LBB2_3:                                # %after
	movq	(%rsp), %rdi
	movl	8(%rsp), %esi
                                        # kill: def %edx killed %edx killed %rdx
	callq	"main-qsort-qsort_auxil"
	movq	(%rsp), %rdi
	movzwl	10(%rsp), %edx
	movzwl	14(%rsp), %esi
	callq	"main-qsort-qsort_auxil"
.LBB2_4:                                # %ifcont37
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end2:
	.size	"main-qsort-qsort_auxil", .Lfunc_end2-"main-qsort-qsort_auxil"
	.cfi_endproc
                                        # -- End function
	.globl	"main-qsort-qsort_auxil-swap" # -- Begin function main-qsort-qsort_auxil-swap
	.p2align	4, 0x90
	.type	"main-qsort-qsort_auxil-swap",@function
"main-qsort-qsort_auxil-swap":          # @main-qsort-qsort_auxil-swap
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -32(%rsp)
	movq	%rsi, -24(%rsp)
	movq	%rdx, -16(%rsp)
	movzwl	(%rsi), %eax
	movw	%ax, -8(%rsp)
	movzwl	(%rdx), %ecx
	movw	%cx, (%rsi)
	movw	%ax, (%rdx)
	retq
.Lfunc_end3:
	.size	"main-qsort-qsort_auxil-swap", .Lfunc_end3-"main-qsort-qsort_auxil-swap"
	.cfi_endproc
                                        # -- End function
	.globl	"main-writeArray"       # -- Begin function main-writeArray
	.p2align	4, 0x90
	.type	"main-writeArray",@function
"main-writeArray":                      # @main-writeArray
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rcx, %r14
	movl	%edx, %ebp
	movq	%rdi, 8(%rsp)
	movq	%rsi, 16(%rsp)
	movw	%bp, 24(%rsp)
	movq	%r14, 32(%rsp)
	movq	%rsi, %rdi
	callq	writeString
	movw	$0, 40(%rsp)
	xorl	%ebx, %ebx
	cmpw	%bp, %bx
	jl	.LBB4_2
	jmp	.LBB4_5
	.p2align	4, 0x90
.LBB4_4:                                # %ifcont
                                        #   in Loop: Header=BB4_2 Depth=1
	movzwl	(%r14,%rbx,2), %edi
	callq	writeInteger
	incq	%rbx
	movw	%bx, 40(%rsp)
	cmpw	%bp, %bx
	jge	.LBB4_5
.LBB4_2:                                # %do
                                        # =>This Inner Loop Header: Depth=1
	testw	%bx, %bx
	jle	.LBB4_4
# %bb.3:                                # %then
                                        #   in Loop: Header=BB4_2 Depth=1
	movl	$.Lstrtmp, %edi
	callq	writeString
	jmp	.LBB4_4
.LBB4_5:                                # %after
	movl	$.Lstrtmp.1, %edi
	callq	writeString
	addq	$48, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end4:
	.size	"main-writeArray", .Lfunc_end4-"main-writeArray"
	.cfi_endproc
                                        # -- End function
	.type	.Lstrtmp,@object        # @strtmp
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrtmp:
	.asciz	", "
	.size	.Lstrtmp, 3

	.type	.Lstrtmp.1,@object      # @strtmp.1
.Lstrtmp.1:
	.asciz	"\n"
	.size	.Lstrtmp.1, 2

	.type	.Lstrtmp.2,@object      # @strtmp.2
.Lstrtmp.2:
	.asciz	"Seed :\t"
	.size	.Lstrtmp.2, 8

	.type	.Lstrtmp.3,@object      # @strtmp.3
.Lstrtmp.3:
	.asciz	"Initial array; "
	.size	.Lstrtmp.3, 16

	.type	.Lstrtmp.4,@object      # @strtmp.4
.Lstrtmp.4:
	.asciz	"Sorted array: "
	.size	.Lstrtmp.4, 15


	.section	".note.GNU-stack","",@progbits

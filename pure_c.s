	.file	"pure_c.c"
	.text
	.globl	input
	.type	input, @function
input:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$1000000, -8(%rbp)
	movl	$-1, -4(%rbp)
.L3:
	addl	$1, -4(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -8(%rbp)
	jne	.L2
	sall	-8(%rbp)
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -24(%rbp)
.L2:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$-1, %al
	jne	.L3
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	nop
	leave
	ret
	.size	input, .-input
	.globl	make_new_string
	.type	make_new_string, @function
make_new_string:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdi, -40(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L5
.L8:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$97, %al
	je	.L6
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$101, %al
	je	.L6
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$105, %al
	je	.L6
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$111, %al
	je	.L6
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$117, %al
	je	.L6
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$121, %al
	jne	.L7
.L6:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	leal	-32(%rax), %ecx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
.L7:
	addl	$1, -20(%rbp)
.L5:
	movl	-20(%rbp), %eax
	movslq	%eax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	%rax, %rbx
	jb	.L8
	nop
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.size	make_new_string, .-make_new_string
	.globl	output
	.type	output, @function
output:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L10
.L11:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	addl	$1, -20(%rbp)
.L10:
	movl	-20(%rbp), %eax
	movslq	%eax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	%rax, %rbx
	jb	.L11
	nop
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.size	output, .-output
	.globl	random_way
	.type	random_way, @function
random_way:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$1000000, -12(%rbp)
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$351843721, %rdx, %rdx
	shrq	$32, %rdx
	movl	%edx, %ecx
	sarl	$13, %ecx
	cltd
	subl	%edx, %ecx
	movl	%ecx, %edx
	imull	$100000, %edx, %edx
	subl	%edx, %eax
	movl	%eax, %edx
	leal	300000(%rdx), %eax
	movl	%eax, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L13
.L15:
	movl	-8(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -12(%rbp)
	jne	.L14
	sall	-12(%rbp)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -24(%rbp)
.L14:
	call	rand@PLT
	movl	%eax, %edx
	movslq	%edx, %rax
	imulq	$715827883, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %ecx
	sarl	$4, %ecx
	movl	%edx, %eax
	sarl	$31, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	sall	$5, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	leal	32(%rax), %ecx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	addl	$1, -8(%rbp)
.L13:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L15
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-24(%rbp), %rax
	leave
	ret
	.size	random_way, .-random_way
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"w"
.LC2:
	.string	"-random"
.LC4:
	.string	"%lf\n"
.LC5:
	.string	"Incorrect input"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$1000000, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	cmpl	$3, -36(%rbp)
	jne	.L18
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -24(%rbp)
	movq	-48(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L19
	cmpq	$0, -16(%rbp)
	je	.L19
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	random_way
	movq	%rax, -32(%rbp)
	call	clock@PLT
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	make_new_string
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	output
	call	clock@PLT
	subq	-8(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC3(%rip), %xmm1
	divsd	%xmm1, %xmm0
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	jmp	.L20
.L19:
	cmpq	$0, -24(%rbp)
	je	.L20
	cmpq	$0, -16(%rbp)
	je	.L20
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	input
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	make_new_string
.L20:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	jmp	.L21
.L18:
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
.L21:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC3:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits

	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	input
	.type	input, @function
input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -8[rbp], 1000000
	mov	DWORD PTR -4[rbp], -1
.L3:
	add	DWORD PTR -4[rbp], 1
	call	getchar@PLT
	mov	ecx, eax
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	mov	eax, DWORD PTR -4[rbp]
	add	eax, 1
	cmp	DWORD PTR -8[rbp], eax
	jne	.L2
	sal	DWORD PTR -8[rbp]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	realloc@PLT
	mov	QWORD PTR -24[rbp], rax
.L2:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, -1
	jne	.L3
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	nop
	leave
	ret
	.size	input, .-input
	.globl	make_new_string
	.type	make_new_string, @function
make_new_string:
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 40
	mov	QWORD PTR -40[rbp], rdi
	mov	DWORD PTR -20[rbp], 0
	jmp	.L5
.L8:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 97
	je	.L6
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 101
	je	.L6
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 105
	je	.L6
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 111
	je	.L6
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 117
	je	.L6
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 121
	jne	.L7
.L6:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	lea	ecx, -32[rax]
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
.L7:
	add	DWORD PTR -20[rbp], 1
.L5:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rbx, eax
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	strlen@PLT
	cmp	rbx, rax
	jb	.L8
	nop
	nop
	add	rsp, 40
	pop	rbx
	pop	rbp
	ret
	.size	make_new_string, .-make_new_string
	.globl	output
	.type	output, @function
output:
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 40
	mov	QWORD PTR -40[rbp], rdi
	mov	DWORD PTR -20[rbp], 0
	jmp	.L10
.L11:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	putchar@PLT
	add	DWORD PTR -20[rbp], 1
.L10:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rbx, eax
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	strlen@PLT
	cmp	rbx, rax
	jb	.L11
	nop
	nop
	add	rsp, 40
	pop	rbx
	pop	rbp
	ret
	.size	output, .-output
	.globl	random_way
	.type	random_way, @function
random_way:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -12[rbp], 1000000
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 351843721
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 13
	cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 100000
	sub	eax, edx
	mov	edx, eax
	lea	eax, 90000[rdx]
	mov	DWORD PTR -4[rbp], eax
	mov	DWORD PTR -8[rbp], 0
	jmp	.L13
.L15:
	mov	eax, DWORD PTR -8[rbp]
	add	eax, 1
	cmp	DWORD PTR -12[rbp], eax
	jne	.L14
	sal	DWORD PTR -12[rbp]
	mov	eax, DWORD PTR -12[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	realloc@PLT
	mov	QWORD PTR -24[rbp], rax
.L14:
	call	rand@PLT
	mov	edx, eax
	movsx	rax, edx
	imul	rax, rax, 715827883
	shr	rax, 32
	mov	ecx, eax
	sar	ecx, 4
	mov	eax, edx
	sar	eax, 31
	sub	ecx, eax
	mov	eax, ecx
	add	eax, eax
	add	eax, ecx
	sal	eax, 5
	mov	ecx, edx
	sub	ecx, eax
	mov	eax, ecx
	lea	ecx, 32[rax]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	add	DWORD PTR -8[rbp], 1
.L13:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -4[rbp]
	jl	.L15
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	mov	rax, QWORD PTR -24[rbp]
	leave
	ret
	.size	random_way, .-random_way
	.section	.rodata
.LC0:
	.string	"-random"
.LC1:
	.string	"w"
.LC3:
	.string	"\n\n%lf\n"
.LC4:
	.string	"r"
.LC5:
	.string	"%lf\n"
.LC6:
	.string	"Incorrect input"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -48[rbp], rsi
	cmp	DWORD PTR -36[rbp], 3
	jne	.L18
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L18
	mov	rdx, QWORD PTR stdout[rip]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	freopen@PLT
	test	rax, rax
	je	.L18
	mov	edi, 1000000
	call	malloc@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	random_way
	mov	QWORD PTR -32[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	make_new_string
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	output
	call	clock@PLT
	sub	rax, QWORD PTR -24[rbp]
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm1
	lea	rdi, .LC3[rip]
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	free@PLT
	jmp	.L19
.L18:
	cmp	DWORD PTR -36[rbp], 3
	jne	.L20
	mov	rdx, QWORD PTR stdin[rip]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	call	freopen@PLT
	test	rax, rax
	je	.L20
	mov	rdx, QWORD PTR stdout[rip]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	freopen@PLT
	test	rax, rax
	je	.L20
	mov	edi, 1000000
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	input
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	make_new_string
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	output
	call	clock@PLT
	sub	rax, QWORD PTR -8[rbp]
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm1
	lea	rdi, .LC5[rip]
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	jmp	.L19
.L20:
	lea	rdi, .LC6[rip]
	call	puts@PLT
.L19:
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits

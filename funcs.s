    	.text
    	.section .rodata
    	.text
        .globl  input
        .type   input, @function
input:
	pushq	%rbp
	movq	%rsp, %rbp
	
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15

	subq	$8, %rsp

	movq	%rdi, %r12 	# str
	movq	%rsi, %r13	# stream
	movq	$1000000, %r14	# capacity
	movq	$-1, %r15	# size

	.do_while:
	incq	%r15
	
	movq	%r13, %rdi
	call	fgetc@PLT

	movq	%r12, %rbx
	addq	%r15, %rbx

	movq	%rax, (%rbx)

	incq	%r15
	cmp	%r15, %r14
	decq	%r15
	jne	.check_cond1
	
	shlq	$1, %r14
	
	movq	%r12, %rdi
	movq	%r13, %rsi
	call	realloc@PLT
	movq	%rax, %rsi
	movq	%rsi, %r13
	
	.check_cond1:
	movq	%r12, %rbx
	addq	%r15, %rbx
	movq	(%rbx), %rbx
	cmp	$-1, %rbx
	jne	.do_while
	
	addq	$8, %rsp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	
	movq	%rbp, %rsp
	popq	%rbp
	ret

        .globl  make_new_string
        .type   make_new_string, @function
make_new_string:
	pushq	%rbp
	movq	%rsp, %rbp

	pushq	%rbx
	pushq	%r12

	movq	%rdi, %r12

	call	strlen@PLT
	movq	$0, %rcx
	movq	%r12, %rdx
	.for:
		cmp 	%rcx, %rax
		je 	.end_of_doing
		
		movq	%rdx, %rbx
		movq	(%rbx), %rbx

		cmp	$97, %rbx
		je	.substraction
		cmp	$101, %rbx
		je	.substraction
		cmp	$105, %rbx
		je	.substraction
		cmp	$111, %rbx
		je	.substraction
		cmp	$117, %rbx
		je	.substraction
		cmp	$121, %rbx
		je	.substraction
		jmp	.end_of_iteration
		
		.substraction:
			subq	$32, %rbx
			movq	%rbx, (%rdx)

		.end_of_iteration:
		incq	%rcx
		addq	$8, %rdx
		jmp	.for
	.end_of_doing:
	popq	%r12
	popq	%rbx

	movq	%rbp, %rsp
	popq	%rbp
	ret

	.globl  output
        .type   output, @function
output:
	pushq	%rbp
	movq	%rbp, %rsp

	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14

	movq	%rdi, %rbx
	movq	%rsi, %r12

	movq	%rbx,	%rdi
	call	strlen@PLT
	movq	%rax, %r13

	movq	$0, %rcx
	movq	%rbx, %r14
	.output_loop:
		cmp	%rcx, %r13
		je	.end_of_output

		movq	(%r14), %rdi
		movq	%r12, %rsi
		call	fputc@PLT

		incq	%rcx
		addq	$8, %r14
		jmp	.output_loop

	.end_of_output:
	popq 	%r14
	popq	%r13
	popq	%r12
	popq	%rbx

	movq	%rsp, %rbp
	popq	%rbp
	ret


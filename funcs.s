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

	movq	%r15, %rcx
	incq	%rcx
	cmp	%rcx, %r14
	jne	.check_cond1
	
	shlq	$1, %r14
	
	movq	%r12, %rdi
	movq	%r14, %rsi
	call	realloc@PLT
	movq	%rax, %r12
	
	.check_cond1:
	cmp	$-1, (%rbx)
	jne	.do_while
	
	.end_of_scan:

	movq	%r12, %rbx
        addq    %r15, %rbx
        movq    $0, (%rbx)

	movq	%r12, %rax

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
	movq	%rax, %rdx

	movq	$0, %rcx
	.for:
		cmp 	%rcx, %rdx
		je 	.end_of_doing
		
		movq	%r12, %rbx
		addq	%rcx, %rbx
		mov	(%rbx), %al

		cmp	$97, %al
		je	.substraction
		cmp	$101, %al
		je	.substraction
		cmp	$105, %al
		je	.substraction
		cmp	$111, %al
		je	.substraction
		cmp	$117, %al
		je	.substraction
		cmp	$121, %al
		je	.substraction
		jmp	.end_of_iteration
		
		.substraction:
			sub	$32, %al
			mov	%al, (%rbx)

		.end_of_iteration:
		incq	%rcx
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
	movq	%rsp, %rbp

	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	subq	$8, %rsp

	movq	%rdi, %rbx
	movq	%rsi, %r12

	movq	%rbx,	%rdi
	call	strlen@PLT
	movq	%rax, %r13

	movq	$0, %r15
	movq	%rbx, %r14
	.output_loop:
		cmp	%r15, %r13
		je	.end_of_output

		movq	(%r14), %rdi
		movq	%r12, %rsi
		call	fputc@PLT

		incq	%r15
		incq	%r14
		jmp	.output_loop

	.end_of_output:
	addq	$8, %rsp

	popq	%r15
	popq 	%r14
	popq	%r13
	popq	%r12
	popq	%rbx

	movq	%rbp, %rsp
	popq	%rbp
	ret

	.globl  random_way
        .type   random_way, @function
random_way:
	pushq	%rbp
	movq	%rsp, %rbp

	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15

	movq	%rdi, %r15	# r15 - str

	movq	$0, %rdi
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT

	movq	$1000000, %r12	# r12 - capacity
	
	call 	rand@PLT
	movq	$100000, %rcx
	movq	$0, %rdx
	div	%rcx
	addq	$300000, %rdx
	movq	%rdx, %r13	# r13 - n

	movq	$0, %r14	# r14 - i
	.filling:
		call	rand@PLT
		movq	$96, %rcx
		movq	$0, %rdx
		div	%rcx
		addq	$32, %rdx

		movq	%r15, %rax
		addq	%r14, %rax
		movq	%rdx, (%rax)

		movq	%r14, %rax
		incq	%rax
		cmp	%rax, %r12
		jne	.check_cond2

		shlq	$1, %r12
		movq	%r15, %rdi
		movq	%r12, %rsi
		call	realloc@PLT
		movq	%rax, %r15

		.check_cond2:
		incq	%r14
		cmp	%r14, %r13
		jne 	.filling		

	.end_of_generation:
	movq	%r15, %rax
	
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx

	movq	%rbp, %rsp
	popq	%rbp
	ret

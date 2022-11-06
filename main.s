	.section .rodata
	.r_mode:
        	.string "r"
    	.w_mode:
        	.string "w"
    	.bad_input:
        	.string "Incorrect input\n"
    	.time_print:
		.string "%lf\n"
	.random:
		.string "--random"
	.debug:
		.string "%s\n"
	
	.section	.data
    		.operand:
			.quad	1
	
	.text
	.globl  main
        .type   main, @function
main:
        pushq   %rbp
        movq    %rsp, %rbp

	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15

	subq	$24, %rsp
	
	movq	%rdi, %r12	# r12 - argc	
	movq	%rsi, %r13	# r13 - argv
	
	movq	$1000000, %rdi
	call	malloc@PLT
	movq	%rax, (%rsp)	# rsp - str
	
	cmp	$3, %r12
	jne	.incorrect_input
		movq	%r13, %rdi
		addq	$8, %rdi
		movq	(%rdi), %rdi
		leaq	.r_mode(%rip), %rsi
		call	fopen@PLT
		movq	%rax, 8(%rsp) 	# rsp + 8 - file_in
	
		movq	%r13, %rdi
		addq	$16, %rdi
		movq	(%rdi), %rdi
		leaq	.w_mode(%rip), %rsi
		call	fopen@PLT
		movq	%rax, 16(%rsp) 	# rsp + 16 - file_out
	
		# chunk of comparasions
		.if:
			movq	%r13, %rdi
			addq	$8, %rdi
			movq	(%rdi), %rdi
			leaq	.random(%rip), %rsi
			call	strcmp@PLT
			cmp	$0, %rax
			jne	.else_if
	
			movq	(%rsp), %rdi
			call	random_way
			mov	%rax, (%rsp)

                        call    clock@PLT
                        movq    %rax, %rbx

			movq	(%rsp), %rdi
			call	make_new_string
			
			movq	(%rsp), %rdi
			movq	16(%rsp), %rsi
			call	output

			call	clock@PLT

			# start - end -> xmm1
			movq	%rax, .operand(%rip)
    			movsd 	.operand(%rip), %xmm1
    	
			movq	%rbx, %xmm2
			subsd 	%xmm2, %xmm1

			# (start - end) / CLOCKS_PER_SEC -> xmm2
			movq	$1000000, .operand(%rip)
			divsd 	.operand(%rip), %xmm1

			leaq	.time_print(%rip), %rdi
			movsd	%xmm1, %xmm0
			movq	$3, %rax	
			call	printf@PLT
			jmp	.common_end
		.else_if:
			cmp 	$0, 8(%rsp)
			je	.else

			movq	(%rsp), %rdi
			movq	8(%rsp), %rsi
			call	input
			movq	%rax, (%rsp)

			movq	8(%rsp), %rdi
			call	fclose@PLT

                        #leaq    .debug(%rip), %rdi
                        #movq    (%rsp), %rsi
                        #call    printf@PLT

			movq	(%rsp), %rdi
			call 	make_new_string

                        #leaq    .debug(%rip), %rdi
                        #movq    (%rsp), %rsi
                        #call    printf@PLT

			movq	(%rsp), %rdi
			movq	16(%rsp), %rsi
			call	output
			jmp	.common_end
		.else:
			lea	.bad_input(%rip), %rdi
			call	printf@PLT
	
		.common_end:
		movq	16(%rsp), %rdi
		call	fclose@PLT
		jmp	.end

	.incorrect_input:
		lea	.bad_input(%rip), %rdi
		call	printf@PLT
	
	.end:
	movq	(%rsp), %rdi
	call	free@PLT

	addq	$24, %rsp
	
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx

	movq	%rbp, %rsp
	popq	%rbp
	ret

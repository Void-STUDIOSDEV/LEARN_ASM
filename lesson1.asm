#HOW TO PRINT "HELLO, WORLD!" in AT&T SYNTAX FOR ASM_x86_64!

.data
	message:
		.ascii "HELLO, WORLD!\n"
	message_len = . - message #autocalculates the bytes of the message
	
.global main #the global starting point
	.text
	main:
		movq $1, %rax #syscall (1 paired with rax is write)
		movq $1, %rdi #stdout (1 paired with rdi)
		leaq message(%rip), %rsi #pointer to the message
		movq $message_len, %rdx #pointer to the length of the message
		syscall #invoke the kernel
		
		movq $60, %rax #syscall exit
		xorq %rdi, %rdi #return 0
		syscall #invoke the kernel

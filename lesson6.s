#the rest will take stuff from the book "Learn to Program with Assembly" by Jonathan Bartlett

.globl _start #declares the start

.section .text
_start:
	movq $60, %rax
	movq $3, %rdi #this makes an exit code when paired these lines
	syscall

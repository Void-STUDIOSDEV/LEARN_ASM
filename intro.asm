;do not look at the code, just compile. It is a little intro to Assembly. Once you run it, you then shall look at the code!

section .data
msg db "WELL, ASSEMBLY IS COOL, RIGHT?", 10
msg_len equ $ - msg

warning db "[CTRL + X] TO STOP.", 10
warning_len equ $ - warning


section .text
global _start

_start:
mov rax, 1
mov rdi, 1
mov rsi, msg
mov rdx, msg_len
syscall

mov rax, 1
mov rdi, 1
mov rsi, warning
mov rdx, warning_len
syscall

jmp _start

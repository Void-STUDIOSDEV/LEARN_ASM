;do not look at the code, just compile. It is a little intro to Assembly. Once you run it, you then shall look at the code!
;the following program was written in VIM, a lightweight CODE/TEXT editor. A heavier, but more user-friendly CODE/TEXT editor would be Visual Studio and Visual Studio Code.
;a lightweight Windows alternative to VIM would be (in my experience) NotePad Plus Plus (NotePad++).

;THE FOLLOWING COMPILE STEPS ASSUMES NASM AND THE LINKER, LD, AND LINUX.

;to compile, type "nasm -f elf64 intro.asm -o intro.o"
;to link, type 'ld intro.o -o intro"
;to run, type "./intro"

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

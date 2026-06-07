.data
    message:
        .ascii "UNCONDITIONAL LOOP!! [CNTRL-C TO QUIT]\n"
    message_len = . - message

.global main
    .text
    main:
        movq $1, %rax
        movq $1, %rdi
        leaq message(%rip), %rsi
        movq $message_len, %rdx
        syscall

        jmp main
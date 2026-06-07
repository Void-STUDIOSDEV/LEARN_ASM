#In this we will use mutliple print statements in AT&T syntax

.global main #startpoint
    .text
    main:
        movq $1, %rax #syscall write
        movq $1, %rdi #stdout
        leaq message1(%rip), %rsi #pointer to the message
        movq $message1_len, %rdx #pointer to the length
        syscall 

        movq $1, %rax
        movq $1, %rdi
        leaq message2(%rip), %rsi
        movq $message2_len, %rdx
        syscall

        mov $60, %rax #sysexit
        xorq %rdi, %rdi #return 0
        syscall

.data
    message1:
        .ascii "Hello, World! [Statement 1]\n"
    message1_len = . - message1 #calculates the length of the message

    message2:
        .ascii "HELLO, WORLD [Statement 2]\n"
    message2_len = . - message2 #calculates the length of the second message

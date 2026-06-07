#today we will be printing out what the user types in Assembly x86_64 (AT&T Syntax)

.data
    prompt:
        .ascii "INPUT: "
    prompt_len = . - prompt

.bss
    .comm buffer, 64

.global main
    .text
    main:
    #---print prompt---
        movq $1, %rax #syswrite
        movq $1, %rdi #stdout
        leaq prompt(%rip), %rsi #pointer to the message
        movq $prompt_len, %rdx #pointer to the length of the message
        syscall

    #---take in input---
        movq $0, %rax #sysread
        movq $0, %rdi #stdin
        leaq buffer(%rip), %rsi #load the address
        movq $64, %rdx #max number of bytes to read
        syscall

    #---print input---
        movq $1, %rax
        movq $1, %rdi
        leaq buffer(%rip), %rsi
        syscall
    
    #---exit program---
        movq $60, %rax
        xorq %rdi, %rdi
        syscall
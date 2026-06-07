.bss
    .comm buffer, 64 #for user input

.data
    branch1:
        .ascii "You clicked 'A'!\n"
    branch1_len = . - branch1 #calculates the length of the message

    branch2:
        .ascii "You clicked 'B'!\n"
    branch2_len = . - branch2 #calculates the length of the second message

    prompt:
        .ascii "CHOICE [A/B]: "
    prompt_len = . - prompt #calculates the lenght of the prompt message

    invalid_message:
        .ascii "YOU PRESSED SOMETHING OTHER THAN A OR B\n"
    invalid_len = . - invalid_message #calculates the length of the invalid message


.global main
    .text
    main:
        movq $1, %rax #syswrite
        movq $1, %rdi #stdout
        leaq prompt(%rip), %rsi #pointer to the prompt
        movq $prompt_len, %rdx #pointer to the length
        syscall

        movq $0, %rax #sysread
        movq $0, %rdi #stdin
        leaq buffer(%rip), %rsi #load the buffer with the input
        movq $64, %rdx #read the amount of bytes of the user input
        syscall

        movb buffer(%rip), %r8b #load the first bytes into 8bit Register

        cmpb $'a', %r8b #checks if user input is 'a'
        je b1 #jump to b1 if input is 'a'

        cmpb $'b', %r8b #checks if user input is 'b'
        je b2 #jumps to b2 if input is 'b'

        jmp invalid


        b1:
            movq $1, %rax
            movq $1, %rdi
            leaq branch1(%rip), %rsi
            movq $branch1_len, %rdx
            syscall

            movq $60, %rax
            xorq %rdi, %rdi
            syscall
        
        b2:
            movq $1, %rax
            movq $1, %rdi
            leaq branch2(%rip), %rsi
            movq $branch2_len, %rdx
            syscall

            movq $60, %rax
            xorq %rdi, %rdi
            syscall
        
        invalid:
            movq $1, %rax
            movq $1, %rdi
            leaq invalid_message(%rip), %rsi
            movq $invalid_len, %rdx
            syscall

            movq $60, %rax
            xorq %rdi, %rdi
            syscall
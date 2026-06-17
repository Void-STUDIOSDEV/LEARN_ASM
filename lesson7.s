.global _start

.section .text

_start:
    movq $3, %rdi #moves 3 into rdi
    movq %rdi, %rax #moves rdi into rax, making rax 3
    addq %rdi, %rax #adds 3 into rax making it total 6
    
    mulq %rdi #multiplies rdi by by rax, making it 6*3 which is 18.
    #mulq times rdi by rax and stores it in rax making rax 18

    movq $2, %rdi #replaces what was in rdi with 2
    addq %rdi, %rax #adds rdi into rax again, making it 2 + 18 [20]
    movq $4, %rdi #replaces 2 with 4 in rdi
    mulq %rdi #multiplies rdi by rax, making it 4*20 [80] going into rax
    movq %rax, %rdi #replaces what is inside rdi with rax [making rdi 80]

    #---remove this once not needed
    movq $80, %rdi
    xor %rdx, %rdx
    #------------------------------
    movq $60, %rax #replaces 80 that is inside rax with 60
    syscall
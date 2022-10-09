section .data
    ms1: db "Result %d", 10, 0

section .text
    global main:
    extern printf

main:
    mov rax, 2
    mov rbx, 4
    mul rbx

    mov rdi, ms1 
    mov rsi, rax
    mov rax, 0
    call printf WRT ..plt

    ret

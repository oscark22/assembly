section .data
    format: db "The result is: %d", 10, 0 

section .text.
    global main
    extern printf

main:
    ; factorial of
    mov rcx, 5
    mov rdx, 1

loop:
    mov rax, rdx
    mov rbx, rcx
    mul rbx

    mov rdx, rax

    dec rcx
    cmp rcx, 0
    jnz loop

    mov rdi, format
    mov rsi, rdx
    mov rax, 0
    call printf WRT ..plt
    ret

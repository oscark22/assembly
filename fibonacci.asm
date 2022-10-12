section .data
    msg: db '0'

section .text
    global _start

_start:
    ; fib seq
    mov rax, 1
    mov rbx, 0

    ; num of loops
    mov rcx, 5

loop:
    mov rdx, rax
    add rax, rbx
    mov rbx, rdx

    dec rcx
    jnz loop

    mov rbx, [msg]
    add rbx, rax
    mov [msg], rbx

    mov rax, 4
    mov rbx, 1
    mov rcx, msg
    mov rdx, 1
    int 0x80

continue:
    mov rax, 1
    mov rbx, 0
    int 0x80

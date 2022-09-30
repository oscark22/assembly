section .data
    ms1: db 'The num is positive', 10
    m1l: equ $-ms1
    ms2: db 'The num is equal to zero', 10
    m2l: equ $-ms2
    ms3: db 'The num is negative', 10
    m3l: equ $-ms3

section .text
    global _start

_start:
    ; Test number
    mov eax, 0
    
    cmp eax, 0
    jg positive
    je equal
    jl negative

positive:
    mov eax, 4
    mov ebx, 1
    mov ecx, ms1
    mov edx, m1l
    int 0x80
    jmp continue

equal:
    mov eax, 4
    mov ebx, 1
    mov ecx, ms2
    mov edx, m2l
    int 0x80
    jmp continue

negative:
    mov eax, 4
    mov ebx, 1
    mov ecx, ms3
    mov edx, m3l
    int 0x80

continue:
    mov eax, 1
    mov ebx, 1
    int 0x80

section .bss

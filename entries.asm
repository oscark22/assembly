section .data
    ms1: db 'Write a num: ', 10
    msl: equ $-ms1

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, ms1
    mov edx, msl
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, var
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, var
    mov edx, 1
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

section .bss
    var resb 1

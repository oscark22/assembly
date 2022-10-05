section .data
    ms1: db 'The number is odd', 10
    m1l: equ $-ms1
    ms2: db 'The number is even', 10
    m2l: equ $-ms2

section .text
    global _start

_start:
    ; test number
    mov eax, 5

    and eax, 1
    jz even
    jmp odd

even:
    mov eax, 4
    mov ebx, 1
    mov ecx, ms2
    mov edx, m2l
    int 0x80
    jmp continue

odd:
    mov eax, 4
    mov ebx, 1
    mov ecx, ms1
    mov edx, m1l
    int 0x80

continue:
    mov eax, 1
    mov ebx, 1
    int 0x80

section .bss

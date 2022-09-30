section .data
    msg:    db  'Hola mundo !!!', 10
    mgl:    equ $-msg

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, mgl
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

section .bss

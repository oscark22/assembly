section .data
    vec: dd 1,2,3

section .text
    global _start

_start:
    mov eax, vec
    mov ecx, 3

loop:
    mov ebx, [eax]
    inc eax
    dec ecx
    jnz loop

    mov eax, 1
    mov ebx, 0
    int 0x80


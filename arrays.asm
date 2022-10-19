section .data
    vec: db 1,2,3,4,5,6,7,8,9
    msg: db '0'

section .text
    global _start

_start:
    mov eax, vec
    add eax, 1
    mov ebx, [msg]
    add ebx, [eax]
    mov [msg], ebx

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 1
    int 0x80

    mov eax, 1
    mov ebx, 1
    int 0x80

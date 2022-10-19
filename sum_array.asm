section .data
    arr: dd 1,2,3,3
    msg: db '0'

section .text
    global _start

_start:
    mov eax, arr
    mov ebx, [eax] ; ebx holds curr val
    mov ecx, 3 ; num iter

loop:
    add eax, 4
    add ebx, [eax]

    dec ecx
    jnz loop

continue:
    mov eax, [msg]
    add eax, ebx
    mov [msg], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 1
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

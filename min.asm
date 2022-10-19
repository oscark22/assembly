section .data
    vec: dd 9,4,9,4,3,8
    msg: dd '0'

section .text
    global _start

_start:
    mov eax, vec
    mov ebx, [eax]
    mov ecx, 5 ; counter

loop:
    add eax, 4
    cmp ebx, [eax]
    jg min
    jmp continue

min:
    mov ebx, [eax]
    jmp continue

continue:
    dec ecx
    jnz loop

    mov eax, [msg]
    add eax, ebx
    mov [msg], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 1
    int 0x80

    mov eax, 1
    mov ebx, 1
    int 0x80

section .bss
    con resb 1

section .data
    msg1: dd 'Introduce el 1er num: ', 10
    len1: equ $-msg1
    msg2: dd 'Introduce el 2do num: ', 10
    len2: equ $-msg2
    msg3: dd 'Introduce el 3er num: ', 10
    len3: equ $-msg3
    msg4: dd 'Introduce el 4to num: ', 10
    len4: equ $-msg4

section .text
    global _start

_start:
    mov eax, 0
    mov [sum], eax

inputs:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, var
    mov edx, 1
    int 0x80

    call increase

    mov eax, 3
    mov ebx, 0
    mov ecx, var
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, var
    mov edx, 1
    int 0x80

    call increase

    mov eax, 3
    mov ebx, 0
    mov ecx, var
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, len3
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, var
    mov edx, 1
    int 0x80

    call increase

    mov eax, 3
    mov ebx, 0
    mov ecx, var
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg4
    mov edx, len4
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, var
    mov edx, 1
    int 0x80

    call increase

    mov eax, 3
    mov ebx, 0
    mov ecx, var
    mov edx, 1
    int 0x80

    jmp continue

increase:
    mov eax, [sum]
    add eax, [var]
    sub eax, '0'
    mov [sum], eax
    ret

continue:
    mov eax, [sum]
    add eax, '0'
    mov [sum], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, sum
    mov edx, 1
    int 0x80
    
    mov eax, 1
    mov ebx, 0
    int 0x80

section .bss
    sum resb 1
    var resb 1

section .data
    msg: db '0'
    jln: db ' ', 10

section .text
    global _start

_start:
    ; counter
    mov ecx, 10

loop:
    mov [con], ecx ; set con
    mov eax, [msg]
    and eax, 1
    jz print ; is even
    jmp add_counter

print:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, jln
    mov edx, 2
    int 0x80

    jmp add_counter

add_counter:
    mov eax, [msg]
    inc eax ; add eax, 1
    mov [msg], eax
    mov ecx, [con]
    dec ecx ; sub ecx, 1
    jnz loop

continue:
    mov eax, 1
    mov ebx, 0
    int 0x80

section .bss
    con resb 1

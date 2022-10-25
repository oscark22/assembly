section .data
    wrd: dd 'Armando'
    msg1: dd 'The number of consonants is the following', 10
    len1: equ $-msg1
    msg2: dd '0'

section .text
    global _start

_start:
    mov eax, 0
    mov [count], eax

    mov ebx, wrd
    mov al, [ebx]

    mov ecx, 7

loop:
    call check_consonant

    ; check counter
    dec ecx
    cmp ecx, 0
    jz continue

    jmp loop

check_consonant:
    cmp al, 'A',
    je mov_byte
    cmp al, 'a'
    je mov_byte

    cmp al, 'E',
    je mov_byte
    cmp al, 'e'
    je mov_byte

    cmp al, 'I',
    je mov_byte
    cmp al, 'i'
    je mov_byte

    cmp al, 'O',
    je mov_byte
    cmp al, 'o'
    je mov_byte

    cmp al, 'U',
    je mov_byte
    cmp al, 'u'
    je mov_byte

    ; increment count by 1
    mov eax, [count]
    inc eax
    mov [count], eax

    call mov_byte
    ret

mov_byte:
    add ebx, 1
    mov al, [ebx]
    ret

continue:
    mov eax, [count]
    add eax, [msg2]
    mov [msg2], eax

    ; print res
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 1
    int 0x80

    ; end
    mov eax, 1
    mov ebx, 1
    int 0x80

section .bss
     count resb 1   

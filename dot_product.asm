section .data
    ve1: dd 1,2,3
    ve2: dd 2,2,1

section .text
    global _start

_start:
    ;Address direction
    mov ebx,ve1 
    mov edx,ve2
    mov ecx,1
    mov eax,0
    mov [sum],eax ;init the result of the dot product
loop:
    mov [con],ecx
    mov eax,[ebx] ;Element of vec1
    mov ecx,[edx] ;Element of vec2
    mul ecx
    ; Add to the result
    mov ebx,[sum]
    add eax,ebx
    mov [sum],eax
    ; Move the address 4 units each cicle, i.e. 4,8,12,...
    mov ecx,[con]
    mov eax,4
    mul ecx

    mov ebx,ve1
    add ebx,eax 
    mov edx,ve2
    add edx,eax

    inc ecx
    cmp ecx,3
    jle loop

    ;print the result
    mov eax,[sum]
    add eax,'0'
    mov [sum],eax

    mov eax,4
    mov ebx,1
    mov ecx,sum
    mov edx,1
    int 0x80

    mov eax,1
    mov ebx,0
    int 0x80

section .bss
    sum resd 1
    con resd 1

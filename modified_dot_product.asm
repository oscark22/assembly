section .data
    ve1: dd 1,4,0
    ve2: dd 1,1,1
    msg1: dd '', 10
    msg2: dd '-'

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

    ; odd or even
    mov ecx, [con]
    and ecx, 1
    jz even
    jmp odd

even:
    ; Add to the result
    mov ebx,[sum]
    sub ebx,eax
    mov [sum],ebx
    jmp continue

odd:
    ; Add to the result
    mov ebx,[sum]
    add eax,ebx
    mov [sum],eax
    jmp continue

continue:
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

comparations:
    mov eax, [sum]

    cmp eax, -1
    je forty_seven
    cmp eax, -2
    je forty_six
    cmp eax, -3
    je forty_five
    cmp eax, -4
    je forty_four
    cmp eax, -5
    je forty_three
    cmp eax, -6
    je forty_two
    cmp eax, -7
    je forty_one
    cmp eax, -8
    je forty
    cmp eax, -9
    je thirty_nine

    jmp end

forty_seven:
    mov eax, 1
    mov [sum], eax
    jmp symbol

forty_six:
    mov eax, 2
    mov [sum], eax
    jmp symbol

forty_five:
    mov eax, 3
    mov [sum], eax
    jmp symbol

forty_four:
    mov eax, 4
    mov [sum], eax
    jmp symbol

forty_three:
    mov eax, 5
    mov [sum], eax
    jmp symbol

forty_two:
    mov eax, 6
    mov [sum], eax
    jmp symbol

forty_one:
    mov eax, 7
    mov [sum], eax
    jmp symbol

forty:
    mov eax, 8
    mov [sum], eax
    jmp symbol

thirty_nine:
    mov eax, 9
    mov [sum], eax
    jmp symbol

symbol:
    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,1
    int 0x80

end:
    ;print the result
    mov eax,[sum]
    add eax,'0'
    mov [sum],eax

    mov eax,4
    mov ebx,1
    mov ecx,sum
    mov edx,1
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,msg1
    mov edx,1
    int 0x80

    mov eax,1
    mov ebx,0
    int 0x80

section .bss
    sum resd 1
    con resd 1

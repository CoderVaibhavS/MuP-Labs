.model tiny
.data
s db "BITSIOTLAB"
s1 db "IOT"
count db 11
count1 db 3

.code
.startup
    lea si, s
    mov ch, count

    traverse_s:
    lea di, s1
    mov cl, count1
    cmpsb
    jz traverse_s1
x2:    dec ch
    jnz traverse_s

    jmp finished

    traverse_s1:
    dec si
    lea di, s1

    match_s1:
    cmpsb
    jnz x2
    dec cl
    jz found
x1:    dec ch
    jnz match_s1

    found:
    push di
    mov di, si
    mov al, count1
    mov ah, 00h
    sub di, ax
    mov al, '*'
    mov [di], al
    inc di
    push si
    mov cl, count1

    shift_left:
    lodsb
    stosb
    dec cl
    jnz shift_left

    pop si
    mov al, count1
    mov ah, 00h
    sub si, ax
    pop di

    jmp x1

    finished:

.exit
end
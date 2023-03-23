.model tiny
.data
str1 db 'The character entered is a$'
str2 db 'The character entered is not a$'
.code
.startup
    ; input character
    mov ah, 01h
    int 21h

    cmp al, 'a'
    jnz not_a
    lea dx, str1
    jmp x1
    not_a: lea dx, str2

    ; display output
    x1: mov ah, 09h
    int 21h
.exit
end
.model tiny
.data
count db 32
str1 db 32 dup(?)
.code
.startup
    ; input string
    lea dx, count
    mov ah, 0ah
    int 21h

    ; conversion
    mov cl, count
    mov ch, 00h
    lea si, str1
    lea di, str1+32
    mov al, '$'
    stosb
    lea di, str1
    x1: lodsb
    sub al, 20h
    stosb
    loop x1

    ; output string
    lea dx, str1
    mov ah, 09h
    int 21h
.exit
end
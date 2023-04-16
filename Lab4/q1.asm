.model tiny
.data
str1 db "wasitcatisaw"
res db ?
count1 db 12

.code
.startup
    lea si, str1
    lea ax, str1
    mov cl, count1
    add al, cl
    mov di, ax
    dec di

    match:
    cmp si, di
    jae palindrome
    cld
    lodsb
    std
    scasb
    jz match

    not_palindrome:
    mov res, 00h
    jmp x2

    palindrome:
    mov res, 01h

    x2:
.exit
end
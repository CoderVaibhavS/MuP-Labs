.model tiny
.data
array1 db 0ffh, 18h, 0ah, 98h, 10h, 80h, 0eah, 0aah, 19h, 88h
count db 0ah
neg1 db ?

.code
.startup
    lea si, array1
    mov ch, count
    mov cl, 00h
    mov al, 00h
    x1: 
    cmp [si], al
    jl x2
    jmp x3
    x2:     ; for negative numbers
    inc cl
    x3:
    inc si
    dec ch
    jnz x1
    mov neg1, cl
.exit
end
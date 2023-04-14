.model tiny
.data
array1 db 91h, 02h, 083h, 0ah, 075h, 0ah, 047h, 012h, 076h, 61h

.code
.startup
    lea si, array1
    lea di, array1
    mov cx, 0ah
    mov bl, 'E'
    x1: 
    lodsb
    cmp al, 0ah
    jnz x2
    mov [di], bl
    x2:
    inc di
    dec cx
    jnz x1
.exit
end
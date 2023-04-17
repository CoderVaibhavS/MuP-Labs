.model tiny
.data
fname1 db 'MuP-Labs/Lab6/name.txt', 0
handle1 dw ?
fname2 db 'MuP-Labs/Lab6/id.txt', 0
handle2 dw ?
fname3 db 'MuP-Labs/Lab6/splice.txt', 0
handle3 dw ?
part1 db 7 dup('$')
act1 db 7
part2 db 13 dup('$')
act2 db 13

.code
.startup
    ; -------------------------------ID-------------------------------
    ; open id.txt
    mov ah, 3dh
    mov al, 00h
    lea dx, fname2
    int 21h
    mov handle2, ax

    ; read id.txt content into part2
    mov ah, 3fh
    mov bx, handle2
    mov ch, 00h
    mov cl, act2
    lea dx, part2
    int 21h

    ; close id.txt
    mov ah, 3eh
    int 21h

    ; -------------------------------NAME-----------------------------
    ; open name.txt
    mov ah, 3dh
    mov al, 00h
    lea dx, fname1
    int 21h
    mov handle1, ax

    ; read name.txt content into part1
    mov ah, 3fh
    mov bx, handle1
    mov ch, 00h
    mov cl, act1
    lea dx, part1
    int 21h

    ; close name.txt
    mov ah, 3eh
    int 21h

    ; -----------------------------SPLICE----------------------------
    ; create splice.txt, if doesn't exist
    mov ah, 3ch
    lea dx, fname3
    mov cl, 01h
    int 21h
    mov handle3, ax

    ; open splice.txt
    mov ah, 3dh
    mov al, 01h
    lea dx, fname3
    int 21h
    mov handle3, ax

    ; write id to splice.txt
    mov ah, 40h
    mov bx, handle3
    mov ch, 00h
    mov cl, act2
    lea dx, part2
    int 21h

    ; write name to splice.txt
    mov ah, 40h
    mov bx, handle3
    mov ch, 00h
    mov cl, act1
    lea dx, part1
    int 21h

    ; close file
    mov ah, 3eh
    int 21h
.exit
end
.model tiny
.data
fname1 db 'MuP-Labs/Lab6/name.txt', 0
fname2 db 'MuP-Labs/Lab6/id.txt', 0
handle1 dw ?
handle2 dw ?
str1 db 'Enter your name: $'
max1 db 32
act1 db ?
inp1 db 32 dup('$')
str2 db 'Enter your id: $'
max2 db 32
act2 db ?
inp2 db 32 dup('$')

.code
.startup
    ; -------------------------NAME--------------------------
    ; display str1 on screen
    lea dx, str1
    mov ah, 09h
    int 21h

    ; input name from terminal
    lea dx, max1
    mov ah, 0ah
    int 21h

    ; create name.txt, if doesn't exist
    mov ah, 3ch
    lea dx, fname1
    mov cl, 01h
    int 21h
    mov handle1, ax

    ; open name.txt
    mov ah, 3dh
    mov al, 01h
    lea dx, fname1
    int 21h
    mov handle1, ax

    ; write name to name.txt
    mov ah, 40h
    mov bx, handle1
    mov cl, act1
    mov ch, 00h
    lea dx, inp1
    int 21h

    ; close name.txt
    mov ah, 3eh
    int 21h

    ; ---------------------------------ID-------------------------------
    ; display str2 on screen
    lea dx, str2
    mov ah, 09h
    int 21h

    ; input id from terminal
    lea dx, max2
    mov ah, 0ah
    int 21h

    ; create id.txt, if doesn't exist
    mov ah, 3ch
    lea dx, fname2
    mov cl, 01h
    int 21h
    mov handle2, ax

    ; open id.txt
    mov ah, 3dh
    mov al, 01h
    lea dx, fname2
    int 21h
    mov handle2, ax

    ; write id to id.txt
    mov ah, 40h
    mov bx, handle2
    mov cl, act2
    mov ch, 00h
    lea dx, inp2
    int 21h

    ; close id.txt
    mov ah, 3eh
    int 21h
.exit
end 
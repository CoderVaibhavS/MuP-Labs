.model tiny
.data
msg1 db "enter 10 character long User Name: $"  ; prompt to enter the username
usn1 db "vaibhav@vs$"   ; correct username for comparison
max1 db 20  ; max length for input
act1 db ?   ; placeholder for action
inp1 db 20 dup("$") ; buffer to store user's input for username
msg2 db "enter 5 character long password: $"    ; prompt to enter the password
pass1 db "oscar"    ; correct password for comparison
inp2 db 30 dup("$")    ; buffer to store user's input for password
msg3 db "hello $"   ; greeting message when both inputs are correct
msg4 db "wrong username$"   ; wrong username input
msg5 db "wrong password$"   ; wrong password input
nline db 0ah, 0dh, "$"   ; new line characters

.code
.startup
    ; display msg1 on the screen and go to the next line
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; add a new line after the message
    lea dx, nline
    mov ah, 09h
    int 21h

    ; take input from the user and store it in inp1
    lea dx, max1
    mov ah, 0ah
    int 21h

    ; compare the entered username with stored username
    cld
    lea di, inp1
    lea si, usn1
    mov cx, 11
    repe cmpsb
    jcxz l1

    ; if the username is incorrect, display the "wrong username" message and exit
    lea dx, nline
    mov ah, 09h
    int 21h
    lea dx, msg4
    mov ah, 09h
    int 21h
    mov ah, 4ch
    int 21h

    ; if the username is correct, display the "enter password" message
    l1:
    lea dx, nline
    mov ah, 09h
    int 21h
    lea dx, msg2
    mov ah, 09h
    int 21h
    lea dx, nline
    mov ah, 09h
    int 21h

    ; take password input from the user, making the characters
    mov cx, 6
    lea di, inp2
    l2:
    mov ah, 08h
    int 21h
    mov [di], al
    mov dl, '*'
    mov ah, 02h
    int 21h
    inc di
    dec cx
    jnz l2

    ; compare the entered password with the stored password
    cld
    mov cx, 6
    lea di, inp2
    lea si, pass1
    repe cmpsb
    jcxz l3

    ; if the password is incorrect, display the "wrong password" message and exit
    lea dx, nline
    mov ah, 09h
    int 21h
    lea dx, msg5
    mov ah, 09h
    int 21h
    mov ah, 4ch
    int 21h

    ; if the password is correct, display the greeting message and the username
    l3:
    lea dx, nline
    mov ah, 09h
    int 21h
    lea dx, msg3
    mov ah, 09h
    int 21h
    lea dx, usn1
    mov ah, 09h
    int 21h
    lea dx, nline
    mov ah, 09h
    int 21h

.exit
end
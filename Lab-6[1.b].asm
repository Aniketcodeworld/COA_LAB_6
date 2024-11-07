org 100h

; display input message
mov dx, offset msg_input
mov ah, 09h
int 21h

; read character
mov ah, 01h
int 21h
mov dl, al
mov bl, al

; check if the character is an uppercase letter
cmp al, 'A'
jl notuppercase
cmp al, 'Z'
jg notuppercase

; convert uppercase to lowercase
add bl, 20h

;print the output message
mov dx, offset msg_output
mov ah, 09h
int 21h

; print the converted lowercase letter
mov dl, bl
mov ah, 02h ; 02h to print a single character
int 21h

jmp endprogram

notuppercase:
; print the error message
mov dx, offset msg_error
mov ah, 09h
int 21h

endprogram:
; end the program
mov ah, 4Ch
int 21h

; data segment
msg_input db 'Enter an uppercase: $'
msg_output db 0dh, 0ah, 'The lowercase letter is: $'
msg_error db 0dh, 0ah, 'Error: Not an uppercase! $'
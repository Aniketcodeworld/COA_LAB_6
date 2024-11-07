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

; check if the character is a lowercase letter
cmp al, 'a'
jl notlowercase
cmp al, 'z'
jg notlowercase

; convert lowercase to uppercase
sub bl, 20h

; print the output message
mov dx, offset msg_output
mov ah, 09h
int 21h

; print the converted uppercase letter
mov dl, bl
mov ah, 02h ; 02h to print a single character

int 21h

jmp endprogram

notlowercase:
; print the error message
mov dx, offset msg_error
mov ah, 09h
int 21h

endprogram:
; end the program
mov ah, 4Ch
int 21h

; data segment
msg_input db 'Enter a lowercase letter: $'
msg_output db 0dh, 0ah, 'The uppercase letter is: $'

msg_error db 0dh, 0ah, 'Error: Not a lowercase letter! $'
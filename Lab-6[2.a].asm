ORG 100h ; Origin, to specify that the program starts at 100h (COM file format)

MOV DX, OFFSET msg ; Load the address of the message

MOV AH, 09h ; Function 09h of INT 21h is used to display a string
INT 21h ; Call DOS interrupt to print the message

MOV AH, 4Ch ; Function 4Ch of INT 21h terminates the program
INT 21h ; Call DOS interrupt to exit

msg DB 'Hello, Assembly Language!', 0Dh, 0Ah, '$' ; The message to be displayed, ending
with '$'

END
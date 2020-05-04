COMMENT @
    Create by: Vicente Aguilera
    Date: May 4,2020
    In this proyect you can to use the video mode and put pixels into the
    screen
    1. We start since the hello world program
@
.model small
.stack 128
.data
    helloWorld db "Hello World I'm Assembly$"
.code
    main PROC near
        mov ax, @data
        mov ds, ax

        mov ah,09h
        mov dx, offset helloWorld
        int 21h

        mov ah, 4Ch ; Service 4Ch - Terminate with Error Code
        mov al, 0 ; Error code
        int  21h ; Interrupt 21h - DOS General Interrupts
    main ENDP
end 

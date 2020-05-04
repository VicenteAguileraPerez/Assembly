COMMENT @
    Create by: Vicente Aguilera
    Date: May 4,2020
    In this proyect you can to use the video mode and put pixels into the
    screen
    2. put the video mode and show one pixel
@
.model small
.stack 128
.data
 
.code
    main PROC near
       

    

        mov ah, 4Ch ; Service 4Ch - Terminate with Error Code
        mov al, 0 ; Error code
        int  21h ; Interrupt 21h - DOS General Interrupts
    main ENDP
end 
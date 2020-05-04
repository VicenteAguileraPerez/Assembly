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
        call video_mode
        call create_pixel

        mov ah, 4Ch ; Service 4Ch - Terminate with Error Code
        mov al, 0 ; Error code
        int  21h ; Interrupt 21h - DOS General Interrupts
    main ENDP

    video_mode PROC
        ;if you want to modify the video mode you need to do this code and the intertuption 10h
        mov ah,00h; set the condifuration to video mode
        mov al,13h; select the video mode. this mode is a screen of 320 px * 200 px and 256 colors
        int 10h; execute the  the configuration 
        ret
    video_mode ENDP

    create_pixel PROC
        mov ah,0Ch; you say to the system that you need to write a pixel
        mov al, 0fh; the color of the pixel (this case is white) if you want to use more colors you visit this web site https://en.wikipedia.org/wiki/BIOS_color_attributes
        mov bh,00h; page number
        mov cx,10; X position
        mov dx,70; Y position
        int 10h;execute the  the configuration
        ret
    create_pixel ENDP
end 
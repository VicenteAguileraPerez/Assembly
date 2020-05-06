COMMENT @
    Create by: Vicente Aguilera
    Date: May 5,2020
    In this proyect you can to use the video mode and put pixels into the
    screen
    Repository: https://github.com/VicenteAguileraPerez/Assembly
    Topic:
        3. Create a square or rectagle.
@
.model small
.stack  64
.data
    initial_pos_x DW 0Ah;(10 decimal) this value is the X-position where we start to draw the square.
    initial_pos_y DW 32h;(50 decimal)  this value is the Y-position where we start to draw the square.
    width_figure DW 32h;(20 decimal) this value is the width of the figure to draw
    height_figure DW 5h;(10 decimal) this value is the height of thr figure to draw
    ;NOTE: if you want to create a square you just need to put the witdh and height wit the same value

.code 
    main PROC far
    mov ax, @data; guarda  en ax el contenido del segmento de datos
    mov ds,ax    ; guarda en ds el contenido de  ax
    pop ax       ; elimina de la pila ax
    pop ax       ; elimina de la pila ax
 
   
    call video_mode;
    call draw_figure;this proceture create the square
    ; we expect  push a key  to return to the console
    mov ah,00h; reading a key of the keyboard
    int 16h; execute the  the configuration  of reading since the keyboard
    ;end the program 
    mov ah, 4Ch ; Service 4Ch - Terminate with Error Code
    mov al, 0 ; Error code
    int  21h ; Interrupt 21h - DOS General Interrupts

    ret
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
            mov al,0Fh; the color of the pixel (this case is white) if you want to use more colors you visit this web site https://en.wikipedia.org/wiki/BIOS_color_attributes
            mov bh,00h; page number
            int 10h;execute the  the configuration
            ret
    create_pixel ENDP
    draw_figure PROC near 
        mov cx, initial_pos_x;Asigning to cx register the initial_pos_x
        mov dx, initial_pos_y;Asigning to dx register the initial_pos_y
        loopig:
            call create_pixel;call to the configuration to draw a pixel this is a modification of the last code
            inc cx;we increment the cx register 
            mov ax,cx; moving to the ax register the value of cx
            sub ax,initial_pos_x;we subtract  to cx the initial position of x
            cmp ax,width_figure;compare if  cx-initial_posX < width_figure
            jng loopig
            
            mov cx,initial_pos_x;mov cx to initial_pos_x to start again the process
            inc dx;we increment the dx register 
            mov ax, dx   ;dx - initial_pos_y > height_figure 
            sub ax, initial_pos_y;we subtract  to cx the initial position of x
            cmp ax,height_figure;compare if  cx-initial_posX < width_figure
        jng loopig
        ret
    draw_figure ENDP

end  

.model small
.stack 50    
.data
    muoi dw 10
    Day dw ?
    Month dw ?
    Year dw ?
    Gach db '/ $'
    PRINT MACRO ThongBao
        lea dx, ThongBao
        mov ah, 9
        int 21h
    PRINT ENDM    
.code    
main proc
    
    mov ax, @data
    mov ds, ax
    
    mov ah, 2Ah
    int 21h
    
    xor ax, ax
    mov al, dl
    mov Day, ax
    xor ax, ax
    mov al, dh
    mov Month, ax
    mov Year, cx
    mov ax, Day
    call PrintDec
    PRINT Gach
    mov ax, Month
    call PrintDec
    PRINT Gach
    mov ax, Year
    call PrintDec 
    
    mov ah, 4ch
    int 21h
    
main endp
    ;in so he 10 o ax
    PrintDec proc
        
        xor cx, cx
        
      LapChia:
        xor dx, dx
        div muoi
        add dx, 30h
        push dx
        inc cx
        cmp ax, 0
        jne LapChia
        
      DocStack:
        cmp cx, 1
        je Inkhong
        
       Lap: 
        pop dx
        mov ah, 2
        int 21h
        loop Lap
        jmp Thoat
        
       Inkhong:
        mov dl, 30h
        mov ah, 2
        int 21h
        jmp Lap
        
       Thoat: 
        ret
        
    PrintDec Endp
end main
    

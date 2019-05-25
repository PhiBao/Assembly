.model small
.stack 50
.data 
    str1 db 'Nhap so A: $'
    str2 db 10,13, 'Nhap so B: $'
    b1 dw ?
    b2 dw ?
    str3 db 10, 13, 'A + B =    $'
    str4 db 10, 13, 'A - B =     $'
    str5 db 10, 13, 'A OR B =    $'
    str6 db 10, 13, 'A XOR B =   $'
    msau dw 16
    PRINT MACRO ThongBao proc
            lea dx, ThongBao
            mov ah, 9
            int 21h
    PRINT ENDM
.code
    main proc
    
        mov ax, @data
        mov ds, ax
        
        PRINT str1 
         
        call Nhap
        mov b1, bx
        
        PRINT str2
        
        call Nhap
        mov b2, bx 
    
        PRINT str3
    
        mov bx, b2
        add bx, b1 
    
        mov dx, 30h
        adc dx, 0
        mov ah, 2
        int 21h
         
        call Doc  
    
        PRINT str4
    
        mov bx, b1
        sub bx, b2
        call Doc
    
        PRINT str5  
    
        mov bx, b1
        or bx, b2
        call Doc
    
        PRINT str6
    
        mov bx, b1
        xor bx, b2
        call Doc
     
        mov ah, 4ch
        int 21h
    
    main endp
        
    Doc proc
    
        mov cx, 16
    
      Lap1:
        mov dl, 30h
        shl bx, 1
        adc dl, 0
        mov ah, 2
        int 21h
        loop Lap1
        ret
    
    Doc endp
    
    Nhap proc
        
        xor bx, bx
        
      Lap2:
        mov ah, 1
        int 21h
        cmp al, 13
        je Thoat
        sub al, 30h
        xor ah, ah
        mov cx, ax
        mov ax, bx
        mul msau
        add ax, cx
        mov bx, ax 
        jmp Lap2
        
      Thoat:
        ret
        
    Nhap endp   
        
end main

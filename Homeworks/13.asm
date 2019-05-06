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
    so db 5,0,5 dup(?) ,'$'
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
         
        xor cx, cx
        lea dx, so
        mov ah, 0Ah
        int 21h
        
        lea si, so + 2                  
        mov cl, 4  
        Lap1:
            mov Ax, b1
            xor bx, bx
            mov bl, [si]
            sub bl, 48
            mul msau
            add ax, bx
            mov b1, ax          
            inc si
            Loop Lap1  
      
        PRINT str2
        
        xor cx, cx
        lea dx, so
        mov ah, 0Ah
        int 21h
        
        lea si, so + 2
        mov cl, 4
        Lap2:
            mov Ax, b2
            xor bx, bx
            mov bl, [si]
            sub bl, 48
            mul msau
            add ax, bx
            mov b2, ax          
            inc si
            Loop Lap2 
    
    PRINT str3
    
    mov bx, b2
    add bx, b1 
    
    mov dx, 30h
    adc dx, 0
    mov ah, 2
    int 21h 
    call Xuli  
    
    PRINT str4
    
    mov bx, b1
    sub bx, b2
    call Xuli
    
    PRINT str5  
    
    mov bx, b1
    or bx, b2
    call Xuli
    
    PRINT str6
    
    mov bx, b1
    xor bx, b2
    call Xuli
     
    mov ah, 4ch
    int 21h
    main endp
        
Xuli proc
    
    mov cx, 16
Lap:
    mov dl, 30h
    shl bx, 1
    adc dl, 0
    mov ah, 2
    int 21h
    loop Lap
    ret
    Xuli endp        
        
end main
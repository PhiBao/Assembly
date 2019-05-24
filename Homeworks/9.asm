.model small
.stack 50
.data
    so db 10,?, 11 dup('$')
    muoi db 10 
    kq db 10,13,'Ket Qua: $'
    b1 dw 0 
    b2 dw 0
    str1 db 'Nhap vao so thu 1: $'
    str2 db 10,13, 'Nhap vao so thu 2: $'
    PRINT MACRO ThongBao proc
            lea dx, ThongBao
            mov ah, 9
            int 21h
    PRINT ENDM
    INPUT MACRO x proc
        lea dx, x
        mov ah, 0Ah
        int 21h
    INPUT ENDM      
.code
    main proc
        
        mov ax, @data
        mov ds, ax
        
        PRINT str1
          
        INPUT so
        
        call Xuli
        mov b1, dx
          
        PRINT str2
        
        INPUT so  
        
        call Xuli
        mov b2, dx
        
        PRINT kq  
        
        mov dx, b2
        add dx, b1
        
        mov ax, dx
        xor cx, cx
        
      Lapchia:
        xor dx, dx
        div muoi
            
        add ah, 30h
        mov dl, ah
        push dx
        inc cx
        xor ah, ah
        cmp ax, 0
        jne Lapchia
        
        lea si, so+2
      
      Lap1:
        pop dx
        mov [si], dl
        inc si
        loop Lap1
                 
        PRINT [so+2]   
                 
        mov ah, 4ch
        int 21h
        
    main endp 
    
     Xuli proc
        
        xor dx, dx
        xor cx, cx
        lea si, so + 2
        mov cl, [so+1]
        
       Lap2:
        mov ax, dx
        xor bx, bx
        mov bl, [si]
        sub bl, 30h
        mul muoi
        add ax, bx
        mov dx, ax
        inc si
        loop Lap2
        ret 
        
    Xuli endp
     
end main

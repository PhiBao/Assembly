.model small
.stack 50
.data
    so db 10,0, 10 dup($)
    muoi db 10 
    kq db 10,13,'Ket Qua: $'
    b1 dw 0 
    b2 dw 0
    str1 db 10,13, 'Nhap vao so thu 1: $'
    str2 db 10,13, 'Nhap vao so thu 2: $'
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
        call Xuli
        mov b1, dx
          
        PRINT str2
        
        mov ah, 0Ah
        lea dx, so
        int 21h
          
        PRINT kq
        
        call Xuli
        mov b2, dx  
        
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
      Hienthi:
        pop dx
        mov ah,2 
        int 21h
        loop Hienthi
            
        mov ah, 4ch
        int 21h
        
    main endp 
    
     Xuli proc
        xor dx, dx
        xor cx, cx
        lea si, so + 2
        mov cl, [so+1]
       Lap:
        mov ax, dx
        xor bx, bx
        mov bl, [si]
        sub bl, 30h
        mul muoi
        add ax, bx
        mov dx, ax
        inc si
        loop Lap
        ret
    Xuli endp
     
end main
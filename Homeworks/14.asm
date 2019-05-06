.model small
.stack 50
.data
    so db 10,0, 10 dup($)
    muoi db 10 
    kq1 db 10,13,'A + B: $'
    kq2 db 10,13, 'A - B: $' 
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
        
        lea si, so + 2                  
        mov cl, [so + 1]
         
        Lap:
            mov Ax, b1
            xor bx, bx
            mov bl, [si]
            sub bl, 48
            mul muoi
            add ax, bx
            mov b1, ax          
            inc si
            Loop Lap
            
        PRINT str2     
        
        mov ah, 0Ah
        lea dx, so
        int 21h
        
        lea si, so + 2
        mov cl, [so + 1]
        Lap2:
            mov Ax, b2
            xor bx, bx
            mov bl, [si]
            sub bl, 48
            mul muoi
            add ax, bx
            mov b2, ax          
            inc si
            Loop Lap2
        
        PRINT kq1     
            
        mov dx, b2
        add dx, b1
        call Doc
           
        PRINT kq2
            
        mov dx, b1
        sub dx, b2
        
        call Doc
            
        mov ah, 4ch
        int 21h
        
    main endp
    
Doc proc
    
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
        mov ah, 2 
        int 21h
        loop Hienthi
        ret
    Doc endp        
    
end main
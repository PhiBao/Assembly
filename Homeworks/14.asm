.model small
.stack 50
.data
    muoi db 10 
    kq1 db 10,13,'A + B: $'
    kq2 db 10,13, 'A - B: $' 
    b1 dw ? 
    b2 dw ?
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
          
        call Nhap
        mov b1, bx
        
        PRINT str2
        
        call Nhap
        mov b2, bx
        
        PRINT kq1     
            
        mov dx, b2
        add dx, b1
        call Doc
           
        PRINT kq2
            
        mov dx, b1
        mov bx, b2
        cmp dx, bx
        ja Tiep
        sub bx, dx
        
        mov dx, '-'
        mov ah, 2
        int 21h 
        
        mov dx, bx
        call Doc
        
       Tiep:
        sub dx, bx
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
    
    Nhap proc
        
        xor bx, bx
        
      Lap:
        mov ah, 1
        int 21h
        cmp al, 13
        je Thoat
        sub al, 30h
        xor ah, ah
        mov cx, ax
        mov ax, bx
        mul muoi
        add ax, cx
        mov bx, ax 
        jmp Lap
        
      Thoat:
        ret
        
    Nhap endp       
    
end main

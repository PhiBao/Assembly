.model small
.stack 50           
.data
    muoi db 10
    str1 db 10,13,'A: $'
    str2 db 10,13,'B: $'
    str3 db 10,13,'A/B: $'
    str4 db 10,13,'A*B: $'
    b1 dw 0
    b2 dw 0
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
        
        mov dx, b1
        mov bx, b2
        xor cx, cx
        
      Chia:
        cmp dx, bx
        ja Tiep
            
       Tru: 
        sub bx, dx
        inc cx
        cmp bx, dx
        jae Tru
        jmp Ex
            
       Tiep: 
        sub dx, bx
        inc cx
        cmp dx, bx
        jae Tiep 
        
      Ex:
        PRINT str3
        
        mov ax, cx 
        call HienThi   
        
        PRINT str4
        
        xor ax, ax 
        mov cx, b2
        
      Nhan:
        add ax, b1
        Loop Nhan 
                  
        call HienThi 
        
        mov ah, 4ch
        int 21h
    main endp 
    
    HienThi proc
         
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
            
      Doc:
        pop dx
        mov ah, 2 
        int 21h
        loop Doc
        ret
    HienThi endp
    
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

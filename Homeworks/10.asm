.model small
.stack 50           
.data
    so db 10,0,10 dup($)
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
        
        mov ah, 0Ah
        lea dx, so
        int 21h
        
        call Xuli
        mov b1, dx
        
        PRINT str2
        
        mov ah, 0Ah
        lea dx, so
        int 21h
        
        call Xuli
        mov b2, dx
        
        PRINT str3
        
        mov dx, b1
        mov ax, b2
        
        xor cx, cx
        Chia:
            sub dx, ax
            inc cx
            cmp dx, ax
            jae Chia 
        
        mov ax, cx 
        call HienThi   
        
        PRINT str4
        
        xor cx, cx
        xor dx, dx 
        mov cx, b2
        Nhan:
            add dx, b1
            Loop Nhan 
                
        mov ax, dx  
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
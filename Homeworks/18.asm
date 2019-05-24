.model small
.stack 50
.data
     Sum db 0 
     muoi db 10
     nl db 10,13,'$'
     chuoi db 50,0,50 dup($)
     n db 0 
     b db 0
.code
    main proc
    
        mov ax, @data
        mov ds, ax
        
        xor cx, cx 
        mov ah, 0Ah
        lea dx, chuoi
        int 21h
        
        xor ax, ax 
        mov cl, [chuoi+ 1]
        lea si, chuoi + 2
        
      Tongso: 
        cmp [si], 13
        je Cong
        cmp [si],' '
        jne Tiep
        
       Cong: 
        inc n
        xor bx, bx
        mov bl, Sum
        add bl, b
        mov Sum, bl
        mov b, 0
        inc si
            
       Tiep:
        mov al, b
        xor bx, bx
        mov bl, [si]
        sub bl, 30h
        mul muoi
        add ax, bx
        mov b, al
        inc si
        loop tongso
        
      Chia:    
        mov ah, 9
        lea dx, nl 
        int 21h
        
        xor Ax, Ax 
        mov al, sum 
        mov cl, n
        div cl
        xor ah, ah
        xor cx, cx
        
      Lap:
        xor dx, dx
        div muoi
        mov dl, ah 
        add dx, 30h
        push dx
        inc cx 
        xor ah, ah
        cmp ax, 0
        jne Lap
        
      Hienthi:
        pop dx
        mov ah, 2
        int 21h
        loop Hienthi
            
        mov ah, 4ch
        int 21h
        
    main endp
end main

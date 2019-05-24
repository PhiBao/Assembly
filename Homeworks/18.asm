.model small
.stack 50
.data
     Sum db 0 
     muoi db 10
     str1 db 'Nhap vao day so: $'
     str2 db 10,13,'Trung binh cong la: $'
     chuoi db 50,?,51 dup('$')
     n db 0 
     b db 0
     PRINT macro ThongBao proc
        mov ah, 9
        lea dx, ThongBao
        int 21h
     PRINT endm      
.code
    main proc
    
        mov ax, @data
        mov ds, ax
        
        PRINT str1
         
        mov ah, 0Ah
        lea dx, chuoi
        int 21h
         
        xor cx, cx 
        mov cl, [chuoi+ 1]
        lea si, chuoi + 2
        xor ax, ax
        
      Tongso: 
        cmp [si], 13
        je Cong
        cmp [si],' '
        jne Tiep
        
       Cong:
        xor bx, bx
        mov bl, Sum
        add bl, b
        mov Sum, bl
        mov b, 0
        inc n
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
        
        PRINT str2
        
        xor ax, ax
        mov al, Sum
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

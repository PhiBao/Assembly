.model small
.stack 50
.data
    muoi dw 10
    nl db 10,13,'$'
.code
    main proc
    
        mov ax, @data
        mov ds, ax
           
        call Nhap
        
        lea dx, nl
        mov ah, 09
        int 21h
                
        mov bx, cx        
        mov ax, 1
        mov bx, 1
        
        Giaithua:
            mul bx 
            inc bx
            cmp bx, cx
            jle giaithua
             
        xor cx, cx
        
        Lap1:
            xor dx, dx
            div muoi
            add dx, 30h
            push dx
            inc cx
            cmp ax, 0
            jne Lap1
            
        Hienthi:
            pop dx
            mov ah, 2
            int 21h
            Loop HienThi
                
        mov ah, 4ch
        int 21h 
    main endp

    Nhap proc
        
        xor bx, bx
        
      Lap2:
        mov ah, 1
        int 21h
        cmp al, 13
        je Tiep
        sub al, 30h
        xor ah, ah
        mov cx, ax
        mov ax, bx
        mul muoi
        add ax, cx
        mov bx, ax 
        jmp Lap2
        
      Tiep:
        ret
        
    Nhap endp    
end main

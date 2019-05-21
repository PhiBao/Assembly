.model small
.stack 50
.data
    muoi db 10 
    kq db 10,13,'Ket Qua: $'
    b1 dw ? 
    b2 dw ?
    str1 db 10,13,'Nhap vao so thu 1: $'
    str2 db 10,13,'Nhap vao so thu 2: $'
    PRINT macro ThongBao proc
        lea dx, ThongBao
        mov ah, 9
        int 21h
    PRINT endm    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        PRINT str1
        call Nhap
        mov b1, bx  
        
        PRINT str2
             
        call Nhap
        mov cx, bx
        
        mov ax,1
        mov bx,1
        Giaithua:
            Mul bx 
            inc bx
            cmp bx, cx
            jle giaithua
        mov b2, ax
        
        PRINT kq
        
        mov bx, b1
        mov dx, b2 
        
        Lap1:
        cmp bx, dx
        jz Thoat
        ja A
        jb B
        A:
            sub bx, dx
            jmp Lap1
        B: 
            sub dx, bx
            jmp Lap1
        
        Thoat: 
        mov ax, bx
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
            
        mov ah, 4ch
        int 21h
        
    main endp
    Nhap proc
        xor bx, bx
      Lap:
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
        jmp Lap
      Tiep:
        ret
    Nhap endp    
end main

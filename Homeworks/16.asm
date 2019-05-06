.model small
.stack 50
.data
    so db 10,0, 10 dup($)
    muoi db 10 
    kq db 10,13,'Ket Qua: $'
    b1 dw 0 
    b2 dw 0
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
            sub bl, 30h
            mul muoi
            add ax, bx
            mov b1, ax          
            inc si
            Loop Lap
        
        PRINT str2
             
        mov ah, 01h
        int 21h
        sub al, 30h
        xor cx, cx 
        mov cl, al
        
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
        
        Lap3:
        cmp bx, dx
        jz thoat
        ja A
        jb B
        A:
            mov ax, bx
            sub ax, dx
            mov bx, ax
            jmp Lap3
        B: 
            mov ax, dx
            sub ax, bx
            mov dx, ax
            jmp Lap3
        thoat: 
        
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
end main
.model small
.stack 50
.data      
    str1 db 10,13,"La so hoan hao$" 
    str2 db 10,13,"Khong phai la so hoan hao$"
    so dw 0
    sum dw 0
    muoi db 10
    PRINT macro ThongBao proc
        lea dx, ThongBao
        mov ah, 9
        int 21h
    PRINT endm    
        
.code
    main proc
        
        mov ax, @data
        mov ds, ax     
        
        
        Lap1:
            mov ah,1
            int 21h
            
            cmp al, 13
            je Tiep
            
            sub al, 30h
            xor ah, ah
            mov cx, ax
            mov ax, so
            mul muoi
            add ax, cx
            mov so, ax 
            jmp Lap1
            
         Tiep:
            mov ax, so
            xor cx, cx
     
           Lap2:
            inc cx
            Laydu:
                xor dx, dx
                div cx
                mov ax, so
                cmp dx, 0
                jne lap2
                
                Tinhtong:
                    mov bx, sum
                    add bx, cx
                    cmp ax, bx
                    je HH
                    jl KHH
                    mov sum, bx 
                    jmp lap2           
                            
        HH:
       
            PRINT str1
            
            jmp Thoat
            
        KHH:
       
            PRINT str2
            
        Thoat:
            mov ah, 4ch
            int 21h     
    
    main endp
end main

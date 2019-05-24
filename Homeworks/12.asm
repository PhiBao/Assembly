.model small
.stack 50
.data
     muoi db 10 
     nl db 10,13,'$'
     ktu db ?  
     msau db 16
     PRINT MACRO ThongBao proc
            lea dx, ThongBao
            mov ah, 9
            int 21h
     PRINT ENDM       
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
    mov ktu, al
    
    PRINT nl
    
    xor ah, ah
    mov al, ktu
    xor cx, cx
    
Lap1:
    xor dx, dx
    div msau
    
    add ah, 30h
    mov dl, ah
    push dx
    inc cx
    xor ah, ah
    cmp ax, 0
    jne Lap1
    
    Hienthi:
        pop dx
        mov ah, 2
        int 21h
        loop hienthi
          
    mov dx, 'h'
    mov ah, 2 
    int 21h
    
    PRINT nl 
    
    xor ah, ah
    mov al, ktu
    xor cx, cx
    
Lap2:                                
    xor dx, dx       
    div muoi     
        
    add ah, 30h      
    mov dl, ah       
    push dx         
    inc cx          
    xor ah, ah       
    cmp ax, 0        
    jne Lap2
        
    Dochienthi:             
        pop dx          
        mov ah, 2
        int 21h
        loop Dochienthi  
        
    PRINT nl
     
    xor bh, bh
    mov bl, ktu
    mov cx, 8
    
Lap3:
    mov dl, 30h
    shl bl, 1
    adc dl, 0
    mov ah, 2
    int 21h
    loop Lap3
    
    mov dl, 'b'
    mov ah, 2
    int 21h
    
    mov ah, 4ch
    int 21h
    main endp
end main

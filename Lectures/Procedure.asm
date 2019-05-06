;vi du ve procedure
.model small
.stack 50    
.data
    muoi dw 10
.code
    
    ;in so he 10 o ax
    PrintDec proc
        
        xor cx, cx
      LapChia:
        xor dx, dx
        div muoi
        add dx, 30h
        push dx
        inc cx
        cmp ax, 0
        jne LapChia
      DocStack:
        pop dx
        mov ah, 2
        int 21h
        loop DocStack
        ret
        
    PrintDec Endp    
main proc
    
    mov ax, @data
    mov ds, ax
    
    mov ax, 1234 
    call PrintDec
    
    mov ah, 4ch
    int 21h
    
main endp
end main
    
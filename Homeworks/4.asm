.model small
.stack 50
.data
     str db 10,13,"Xin chao $"
     buffer db 50, ?, 51 dup('$')
     PRINT MACRO ThongBao proc
        lea dx, ThongBao
        mov ah, 9
        int 21h
     PRINT ENDM   
.code
main proc

    mov ax, @data
    mov ds, ax
    
    mov ah, 0Ah           
    lea dx, buffer        
    int 21h
    
    PRINT str
    
    PRINT [buffer+2]
    
    mov ah, 4ch
    int 21h
    
main endp
end main   

.model small
.stack 50
.data
        buffer db 50, ?, 51 dup('$') 
        nl db 10 , 13,'$'
        ktu db ?
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
        
    PRINT nl
        
    lea si, buffer+ 2
    mov cl, [buffer + 1] 
  Lap1:
    cmp [si], 'A'
    Jl Next1
    cmp [si], 'Z'
    Ja Next1
    add [si], 32
            
   Next1: 
    inc si
    loop lap1
    
    PRINT [buffer+2]
        
    PRINT nl 
        
    Lea si, buffer + 2
    mov cl, [buffer + 1]
  Lap2:
    cmp [si], 'a'
    Jl Next2
    cmp [si], 'z'
    Ja Next2
    sub [si], 32
   Next2:  
    inc si
    loop Lap2
        
    PRINT [buffer+2]
        
    mov ah, 4ch
    int 21h          
main endp
end main
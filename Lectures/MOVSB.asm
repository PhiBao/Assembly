.model small
.stack 50
.data
    str1 db 'BAR 5-0 MU'
    str2 db 10 dup(?)    
.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    mov ds, ax
    mov es, ax
    lea si, str1
    lea di, str2
    mov cx, 10
    rep movsb
    
    lea si, str2
    mov cx, 10
  Lap:
        mov ah, 2
        mov dl, [si]
        int 21h
        inc si
        loop Lap
        
    mov ah, 4ch
    int 21h
    
main endp
end main
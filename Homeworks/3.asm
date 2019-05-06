.model small
.stack 50
.data
        str1 db "Hay go 1 phim: $"
        str2 db 10,13,"Ky tu ke truoc: $"
        str3 db 10,13,"Ky tu ke sau: $"
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
    
    PRINT str1
    
    mov ah, 1
    int 21h
    mov ktu, al
    
    PRINT str2
    
    mov ah, 2
    mov dl, ktu
    dec dl
    int 21h
    
    PRINT str3
    
    mov ah, 2
    mov dl, ktu
    inc dl
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main
    
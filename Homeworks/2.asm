.model small
.stack 50
.data
        str1 db "Hay go 1 phim: $"
        str2 db 10,13,"Ky tu nhan duoc la: $"
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
    
    mov ah, 7
    int 21h
    
    mov bl, al
    
    mov ah, 2
    mov dl, bl
    int 21h
    
    PRINT str2
    
    mov ah, 2
    mov dl, bl
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main
    
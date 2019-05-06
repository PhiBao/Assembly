;vi du ve macro
.model small
.stack 50
.data
    TB1 db 'HELLO$'
    TB2 db 10,13,'CHAO BUOI SANG$'
.code
    
    PRINT MACRO ThongBao
        lea dx, ThongBao
        mov ah, 9
        int 21h
    PRINT ENDM
main proc
    mov ax, @data
    mov ds, ax
    
    PRINT Tb1
    PRINT Tb2
    
    mov ah, 4ch
    int 21h
    
main endp
end main
    
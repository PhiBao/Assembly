.model small
.stack 50
.data
   str1 db 10,13,"Good morning$"
   str2 db 10,13,"Good afternoon$"
   str3 db 10,13,"Good evening$"
   ktu db ?
   PRINT MACRO ThongBao proc
    mov ah, 9
    lea dx, ThongBao
    int 21h
   PRINT ENDM  
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
    mov ktu, al
        
    cmp ktu, 'S'
    je Sang
    cmp ktu, 's'
    je Sang
        
    cmp ktu, 'T'
    je Trua
    cmp ktu, 't'
    je Trua
        
    cmp ktu, 'C'
    je Chieu
    cmp ktu, 'c'
    je Chieu
    
    jmp Thoat    
  Sang: 
    PRINT str1
    jmp Thoat    
                   
  Trua: 
    PRINT str2
    jmp Thoat
            
  Chieu: 
    PRINT str3
    
  Thoat:     
    mov ah, 4ch
    int 21h
main endp
end main
    
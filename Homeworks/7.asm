.model small
.stack 50
.data
      mang dB 50 dup(?)  
      length db ?
      nl db 10,13,'$'
      muoi db 10
      PRINT MACRO ThongBao proc
            lea dx, ThongBao
            mov ah, 9
            int 21h
      PRINT ENDM
.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    lea si, mang
    xor cx, cx
    
  Lap:        
    mov ah, 1
    int 21h 
    cmp al, 13
    je Xuongdong
    mov [si], al
    inc si
    inc cx
    jmp Lap
            
  Xuongdong:    
    PRINT nl
            
    mov length, cl
    mov al, cl
    xor ah, ah  
    xor cx, cx
    
  Doc:
    xor dx,dx
    div muoi
            
    add ah, 30h
    mov dl, ah
    push dx
    inc cx
    xor ah, ah
    cmp ax, 0
    jne Doc
    
  Hienthi:
    mov ah, 2
    pop dx
    int 21h
    loop Hienthi
        
    PRINT nl
            
    mov cl, length
    lea si, mang
    
  Xuat:
    mov dl, [si]
    mov ah, 2
    int 21h
    inc si
    loop Xuat  
            
    mov ah,4Ch
    int 21h
    
main endp
end main

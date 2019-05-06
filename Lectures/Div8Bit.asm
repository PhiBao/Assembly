.model small
.stack 50
.data
.code
main proc
    mov ax, @data
    mov ds,ax
    
    mov ax, 255
    mov bl, 10
    xor cx, cx
 LapChia:   
    xor ah, ah
    div bl
    add ah, 30h
    mov dl, ah
    push dx
    inc cx
    cmp al, 0
    jne LapChia
  DocHienThi:
    mov ah, 2
    pop dx
    int 21h
    loop DocHienThi
    
    mov ah, 4ch
    int 21h

main endp
end main
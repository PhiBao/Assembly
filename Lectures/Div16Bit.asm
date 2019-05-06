.model small
.stack 50
.data
  bien1 DB 5 dup(3)
  bien2 DB 7
.code
main proc
    mov ax, @data
    mov ds,ax
    
    mov ax, 2563
    mov bx, 10
    xor cx, cx
 LapChia:   
    xor dx, dx
    div bx
    add dx, 30H
    push dx
    inc cx
    cmp ax, 0
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
.model small
.stack 50
.data
tb1 db "Nhap so nhi phan 16bit thu nhat:$"
tb2 db 10,13,"Nhap so nhi phan 16bit thu hai:$"
xd db 10,13,"$"
x dw ?
y dw ?
.code
main proc
    mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,tb1
    int 21h
    xor bx, bx
    mov cx, 16
 Lap:
    mov ah, 1
    int 21h
    sub al, 30h
    shl bx, 1
    add bl, al
    loop Lap    
    mov x, bx
      
    mov ah,9
    lea dx,tb2
    int 21h
    xor bx, bx
    mov cx, 16
 Lap1:
    mov ah, 1
    int 21h
    sub al, 30h
    shl bx, 1
    add bl, al
    loop Lap1
    mov y, bx 
    
    mov bx,x
    xor dx, dx
    add bx, y
    adc dx, 30h
    mov ah, 2
    int 21h
   
    lea dx, xd
    mov ah, 9
    int 21h
    mov cx, 16
 HienThi:   
    xor dx, dx
    shl bx, 1
    adc dx, 30h
    mov ah, 2
    int 21h
    cmp ax, 0
    loop HienThi    

    mov ah,4ch
    int 21h
main endp       
end main
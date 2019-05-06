.model small
.stack 50
.data
str1 db "Nhap mot so: $"
str2 db 10,13,"So vua nhap la: $"
x dw ?
y dw ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, str1
    int 21h
    call Nhap
    mov ah, 9
    lea dx, str2
    int 21h
    call Doc
    mov ax, 4ch
    int 21h  
main endp
Nhap proc
    mov x, 0
    mov y, 0
    mov bx, 10
    NhapSo:  
    mov ah, 1
    int 21h
    cmp al, 13
    je Thoat
    sub al, 30h
    xor ah, ah
    mov y, ax
    mov ax, x
    mul bx
    add ax, y
    mov x, ax
    jmp NhapSo
  Thoat:
    ret
Nhap endp

Doc proc
    mov bx, 10
    mov ax, x
    xor cx, cx
  LapChia:   
    xor dx, dx
    div bx
    add dx, 30h
    push dx
    inc cx
    cmp ax, 0
    jne LapChia
  DocHienThi:
    mov ah, 2
    pop dx
    int 21h
    loop DocHienThi
Doc endp    
end main
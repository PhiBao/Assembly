.model small
.stack 50
.data
  str1 DB 10,13,'Nhap ky tu: $'
.code
  main proc
    mov ax, @data
    mov ds, ax
  Lap:  
    lea dx, str1
    mov ah, 9
    int 21h
    mov ah, 1h
    int 21h   
    cmp al, 'A'
    JL Lap
    cmp al, 'Z'
    JLE Thoat
    cmp al, 'a'
    JL Lap
    cmp al, 'z'
    JLE Thoat
    cmp al, 'z'
    JG Lap
  Thoat:
    mov ah, 2
    mov dl, al
    int 21h
    mov ah, 4ch
    int 21h
  main endp 
  end main    
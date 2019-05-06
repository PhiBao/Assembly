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
    mov ah, 9h
    int 21h
    mov ah, 1h
    int 21h
    cmp al, 'A'
    JL Lap
    cmp al, 'Z'
    JLE Thoat1
    cmp al, 'a'
    JL Lap
    cmp al, 'z'
    JLE Thoat2
    cmp al, 'z'
    JG Lap
   Thoat1:
    mov ah, 2h
    add al, 32
    mov dl, al
    int 21h
    add al, 32
    JMP Exit
   Thoat2:
    mov ah, 2h
    sub al, 32
    mov dl, al
    int 21h
    sub al, 32
   Exit: 
    mov ah, 4ch
    int 21h
  main endp
 end main  
.model small
.stack 50
.data
    void db " $"
    ktu db ?
.code
main proc

    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
    mov ktu, al
    
  Lap:
    cmp ktu, 'z'
    ja Thoat
    
   HienThi:
    mov ah, 9
    lea dx, void
    int 21h
    
    mov dl, ktu
    mov ah, 2
    int 21h
    inc ktu
    loop Lap
    
  Thoat:
    mov ah, 4ch
    int 21h
    
main endp
end main

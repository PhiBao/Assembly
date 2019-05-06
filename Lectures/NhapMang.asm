.model small
.stack 50
.data
    mang DB 10 dup(?)
    ;nhap vao mang va hien thi lap
    xuongdong DB 10,13,'$'
.code
    main proc
        mov ax, @data
        mov ds, ax
        lea si, mang
        mov cx, 10
  Lap1:
        mov ah,1
        int 21h
        mov [si], al
        inc si
        loop Lap1
        lea dx, xuongdong
        mov ah, 9
        int 21h
        
        
        lea si, mang
        mov cx,10
  Lap2:
        mov ah, 2
        mov dl, [si]
        int 21h
        inc si
        loop Lap2
        
        
        mov ah, 4ch
        int 21h
    main endp
   end main 
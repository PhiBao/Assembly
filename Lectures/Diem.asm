.model small
.stack 50
.data
    diem db ?
    str1 db 10,13,'Xuat sac$'
    str2 db 10,13,'Gioi$'
    str3 db 10,13,'Trung binh$'
    str4 db 10,13,'Kem$'
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
    sub al, 30h
    mov diem, al
    
    cmp diem, 9
    jae In1
    cmp diem, 8
    jae In2
    cmp diem, 5
    jae In3
    
    PRINT str4
    jmp Thoat
    
  In1:
    PRINT str1
    jmp Thoat
    
  In2:
    PRINT str2
    jmp Thoat
    
  In3:
    PRINT str3
        
  Thoat:
    mov ah, 4ch
    int 21h
    
main endp
end main
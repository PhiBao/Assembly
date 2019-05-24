.model small
.stack 50
.data
    tentep db 'ab.txt', 0
    nl db 10,13,'$'
    controtep dw ?
    buffer db ?
.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    mov ah, 3Ch           ;tao tep moi
    lea dx, tentep
    mov cx, 0
    int 21h
    mov controtep, ax
    
  LapDoc:  
    mov ah, 1
    int 21h
    cmp al, 13
    je HienThiLai
    mov buffer, al
    
    lea dx, buffer        
    mov bx, controtep
    mov cx, 1
    mov ah, 40H           ;ghi du lieu vao tep
    int 21h
    jmp LapDoc
    
  HienThiLai:
    mov bx, controtep
    mov ah, 3Eh           ;dong tep
    int 21h
    
    lea dx, nl
    mov ah, 9
    int 21h
    
    lea dx, tentep
    mov al, 2
    mov ah, 3Dh           ;mo tep
    int 21h
    mov controtep, ax
    
  LapDocTep:  
    lea dx, buffer
    mov bx, controtep
    mov cx, 1
    mov ah, 3Fh           ;doc du lieu tu tep
    int 21h
    
    cmp ax, 0             
    je Thoat
    mov ah, 2
    mov dl, buffer
    int 21h
    jmp LapDocTep
   
  Thoat:  
    mov bx, controtep
    mov ah, 3Eh           ;dong tep
    int 21h
    mov ah, 4ch
    int 21h
        
main endp
end main

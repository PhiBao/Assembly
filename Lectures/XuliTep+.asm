.model small
.stack 50       
.data
    tentep db 'ab.txt', 0
    nl db 10,13,'$'
    controtep dw ?
    buffer db 20 dup(?)
.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    mov ah, 3Ch           ;tao tep moi
    lea dx, tentep
    mov cx, 0
    int 21h
    mov controtep, ax
    
    lea si, buffer
    xor cx, cx
  LapDoc:  
    mov ah, 1             
    int 21h
    cmp al, 13
    je HienThiLai
    mov [si], al
    inc si
    inc cx
    cmp cx, 20
    jne Lapdoc
                          
    lea dx, buffer        ;ghi du lieu vao tep tin
    mov bx, controtep
    mov ah, 40H
    int 21h
    xor cx, cx
    lea si, buffer
    jmp LapDoc
                
  HienThiLai:
    lea dx, buffer        ;ghi du lieu vao tep tin
    mov bx, controtep
    mov ah, 40H
    int 21h
               
    mov bx, controtep     ;dong tep
    mov ah, 3Eh
    int 21h
    
    lea dx, nl
    mov ah, 9
    int 21h
    
    lea dx, tentep        ;mo tep
    mov al, 0
    mov ah, 3Dh
    int 21h
    mov controtep, ax
    
  LapDocTep:  
    lea dx, buffer        ;doc noi dung tu tep
    mov bx, controtep
    mov cx, 20
    mov ah, 3Fh
    int 21h
    cmp ax, 0
    je Thoat
    mov cx, ax
    lea si, buffer 
   DocMang: 
    mov dl, [si]
    mov ah, 2
    int 21h
    inc si
    loop Docmang
    jmp LapDocTep
   
  Thoat:  
    mov bx, controtep     ;dong tep
    mov ah, 3Eh
    int 21h
    mov ah, 4ch
    int 21h
        
main endp
end main
    
    
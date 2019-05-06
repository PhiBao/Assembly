.model small
.stack 50
.data
    tentep db 'ab.txt', 0
    nl db 10,13,'$'
    controtep dw ?
    buffer db 10 dup(?)
    temp db ?     
.code
    main proc
        
        mov ax, @data
        mov ds, ax     
        
        
        mov ah, 3Ch               ;tao tep moi
        lea dx, tentep
        mov cx, 0
        int 21h
        mov controtep, ax
        
        lea si, buffer
        LapDoc:
            cmp cx, 10
            je HienThiLai
            
            mov ah, 1
            int 21h
            
            cmp al, 13            ;nhap den khi nao enter thi dung
            je HienThiLai
            
            inc cx
            sub al, 30h
            mov temp, al
            
            cmp al, 1             ;so 1 ko phai la so nguyen to
            je LapDoc
            
            xor bl, bl
            inc bl
           LapChia:               ;kiem tra xem co phai so nguyen to khong
            inc bl
         
            Laydu:
                cmp bl, al
                je Luu
                xor ah, ah
                div bl
                mov al, temp
                cmp ah, 0
                jne lapChia
            jmp LapDoc    
            
           Luu:  
            mov [si], al
            inc si
            cmp cx, 10
            jne LapDoc
              
            lea dx, buffer        ;ghi du lieu vao tep tin
            mov bx, controtep
            mov ah, 40h
            int 21h
            lea si, buffer
            jmp LapDoc            
             
        HienThiLai:
            lea dx, buffer        ;ghi du lieu vao tep tin
            mov bx, controtep
            mov ah, 40h
            int 21h
                    
            mov bx, controtep     ;dong tep
            mov ah, 3Eh
            int 21h
            
            lea dx, nl
            mov ah, 9
            int 21h
    
            lea dx, tentep        ;mo tep
            mov al, 2
            mov ah, 3Dh
            int 21h
            mov controtep, ax
            
        LapDocTep:  
            lea dx, buffer        ;doc noi dung tu tep
            mov bx, controtep
            mov cx, 10
            mov ah, 3Fh
            int 21h
            cmp ax, 0
            je Thoat
            mov cx, ax
            lea si, buffer 
        DocMang: 
            mov dl, [si]
            add dl, 30h
            mov ah, 2
            int 21h
            inc si
            loop Docmang
   
        Thoat:  
            mov bx, controtep     ;dong tep
            mov ah, 3Eh
            int 21h
            mov ah, 4ch
            int 21h
                        
    main endp
end main
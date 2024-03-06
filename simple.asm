%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
    ;; Your code starts here
    mov eax, 0
my_loop:
    mov bl, byte [esi] ; punem primul byte din ESI in BL
    add bl, dl ; adaugam step-ul la caracter
    cmp bl, 90 ; comparam cu codul ASCII a ultimei litere majuscula
    jle end_op
    ; daca dupa adunarea step-ului BL e mai mica decat 90, sarim la
    ; partea de cod respectiva
    jg greater_than_90 
    ; daca dupa adunarea step-ului BL e mai mare decat 90, sarim la
    ; partea de cod respectiva
greater_than_90:
    ; aici obtinem valoarea shiftarii pe care trebuie
    ; sa o efectuam dupa litera Z
    sub bl, 90
    add bl, 64
    jmp end_op

end_op:
    mov byte [edi], bl ; adaugam caracterul schimbat la edi
    inc esi ; trecem la urmatorul caracter din string
    inc edi ; trecem pe urmatorul byte din edi ca sa adaugam caracterul nou
    inc eax
    cmp eax, ecx
    jne my_loop ; continuam loop-ul pana ajungem la lungimea maxima a sirului
;; Your code ends here
    ;; DO NOT MODIFY

    popacika
    leave
    ret
    
    ;; DO NOT MODIFY

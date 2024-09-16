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
xor eax, eax

parcurge_sir:
    ; se muta in registrul bl caracterul curent din sir
    mov bl, byte[esi + eax]
    ; daca s-a ajuns la '\0' se iese din loop
    cmp bl, 0
    je stop
    ; se aduna pasul la caracter
    add bl, dl
    cmp bl, 'Z'
    jle skip_scadere
    sub bl, 26
skip_scadere:
    ; se pune caracterul la locul corespunzator in enc_string
    mov byte[edi + eax], bl
    ; se incrementeaza eax
    inc eax
    ; cmp eax, ecx
    ; jg stop
loop parcurge_sir

stop:
    ; se pune terminatorul de sir
    mov byte[edi + eax], 0
    mov eax, edi
    ; PRINTF32 `%s\n\x0`, eax

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY

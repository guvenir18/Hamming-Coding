; Group 1
; Student 1: Furkan Pala 150180109
; Student 2: İlke Anıl Güvenir 150180042
segment .text
global decode_data

decode_data:
    push ebp
    mov  ebp, esp

    sub  esp, 50        ; 50 bytes in the stack

    mov  eax, [ebp+24]  ; Address to the beginning of H matrix

    ; Collect columns and rows of H matrix into stack as bytes
    ; Store 1st column in stack ebp-1
    mov  dl, [eax+0x70]
    mov  cl, [eax+0x60]
    shl  cl, 1
    or   dl, cl
    mov  cl, [eax+0x50]
    shl  cl, 2
    or   dl, cl
    mov  cl, [eax+0x40]
    shl  cl, 3
    or   dl, cl
    mov  cl, [eax+0x30]
    shl  cl, 4
    or   dl, cl
    mov  cl, [eax+0x20]
    shl  cl, 5
    or   dl, cl
    mov  cl, [eax+0x10]
    shl  cl, 6
    or   dl, cl
    mov  cl, [eax]
    shl  cl, 7
    or   dl, cl
    mov  [ebp-1], dl

    ; Store 2nd column in stack ebp-2
    mov  dl, [eax+0x74]
    mov  cl, [eax+0x64]
    shl  cl, 1
    or   dl, cl
    mov  cl, [eax+0x54]
    shl  cl, 2
    or   dl, cl
    mov  cl, [eax+0x44]
    shl  cl, 3
    or   dl, cl
    mov  cl, [eax+0x34]
    shl  cl, 4
    or   dl, cl
    mov  cl, [eax+0x24]
    shl  cl, 5
    or   dl, cl
    mov  cl, [eax+0x14]
    shl  cl, 6
    or   dl, cl
    mov  cl, [eax+0x04]
    shl  cl, 7
    or   dl, cl
    mov  [ebp-2], dl

    ; Store 3rd column in stack ebp-3
    mov  dl, [eax+0x78]
    mov  cl, [eax+0x68]
    shl  cl, 1
    or   dl, cl
    mov  cl, [eax+0x58]
    shl  cl, 2
    or   dl, cl
    mov  cl, [eax+0x48]
    shl  cl, 3
    or   dl, cl
    mov  cl, [eax+0x38]
    shl  cl, 4
    or   dl, cl
    mov  cl, [eax+0x28]
    shl  cl, 5
    or   dl, cl
    mov  cl, [eax+0x18]
    shl  cl, 6
    or   dl, cl
    mov  cl, [eax+0x08]
    shl  cl, 7
    or   dl, cl
    mov  [ebp-3], dl

    ; Store 4th column in stack ebp-4
    mov  dl, [eax+0x7c]
    mov  cl, [eax+0x6c]
    shl  cl, 1
    or   dl, cl
    mov  cl, [eax+0x5c]
    shl  cl, 2
    or   dl, cl
    mov  cl, [eax+0x4c]
    shl  cl, 3
    or   dl, cl
    mov  cl, [eax+0x3c]
    shl  cl, 4
    or   dl, cl
    mov  cl, [eax+0x2c]
    shl  cl, 5
    or   dl, cl
    mov  cl, [eax+0x1c]
    shl  cl, 6
    or   dl, cl
    mov  cl, [eax+0x0c]
    shl  cl, 7
    or   dl, cl
    mov  [ebp-4], dl

    ; Store 1st row in stack ebp-29
    mov  dl, [eax+0x0c]
    mov  cl, [eax+0x08]
    shl  cl, 1
    or   dl, cl
    mov  cl, [eax+0x04]
    shl  cl, 2
    or   dl, cl
    mov  cl, [eax]
    shl  cl, 3
    or   dl, cl
    mov  [ebp-29], dl

    ; Store 2nd row in stack ebp-30
    mov  dl, [eax+0x1c]
    mov  cl, [eax+0x18]
    shl  cl, 1
    or   dl, cl
    mov  cl, [eax+0x14]
    shl  cl, 2
    or   dl, cl
    mov  cl, [eax+0x10]
    shl  cl, 3
    or   dl, cl
    mov  [ebp-30], dl

    ; Store 3rd row in stack ebp-31
    mov  dl, [eax+0x2c]
    mov  cl, [eax+0x28]
    shl  cl, 1
    or   dl, cl
    mov  cl, [eax+0x24]
    shl  cl, 2
    or   dl, cl
    mov  cl, [eax+0x20]
    shl  cl, 3
    or   dl, cl
    mov  [ebp-31], dl

    ; Store 4th row in stack ebp-32
    mov  dl, [eax+0x3c]
    mov  cl, [eax+0x38]
    shl  cl, 1
    or   dl, cl
    mov  cl, [eax+0x34]
    shl  cl, 2
    or   dl, cl
    mov  cl, [eax+0x30]
    shl  cl, 3
    or   dl, cl
    mov  [ebp-32], dl

    ; Store 5th row in stack ebp-33
    mov  dl, [eax+0x4c]
    mov  cl, [eax+0x48]
    shl  cl, 1
    or   dl, cl
    mov  cl, [eax+0x44]
    shl  cl, 2
    or   dl, cl
    mov  cl, [eax+0x40]
    shl  cl, 3
    or   dl, cl
    mov  [ebp-33], dl

    ; Store 6th row in stack ebp-34
    mov  dl, [eax+0x5c]
    mov  cl, [eax+0x58]
    shl  cl, 1
    or   dl, cl
    mov  cl, [eax+0x54]
    shl  cl, 2
    or   dl, cl
    mov  cl, [eax+0x50]
    shl  cl, 3
    or   dl, cl
    mov  [ebp-34], dl

    ; Store 7th row in stack ebp-35
    mov  dl, [eax+0x6c]
    mov  cl, [eax+0x68]
    shl  cl, 1
    or   dl, cl
    mov  cl, [eax+0x64]
    shl  cl, 2
    or   dl, cl
    mov  cl, [eax+0x60]
    shl  cl, 3
    or   dl, cl
    mov  [ebp-35], dl

    ; Store 8th row in stack ebp-36
    mov  dl, [eax+0x7c]
    mov  cl, [eax+0x78]
    shl  cl, 1
    or   dl, cl
    mov  cl, [eax+0x74]
    shl  cl, 2
    or   dl, cl
    mov  cl, [eax+0x70]
    shl  cl, 3
    or   dl, cl
    mov  [ebp-36], dl

    mov  dword [ebp-8], 0   ; Counter for loop 1. 0 to nEncodedBytes
    mov  eax, [ebp+8]       ; Get begining of encodedBytes. Note that this is an address
    mov  [ebp-12], eax 

    mov dword [ebp-50], 0   ; Number of corrupted bytes

    jmp  loop_check_1
loop_begin_1:
    mov  eax, [ebp-12]
    mov  ecx, [ebp-8]
    mov  al,  [eax+ecx]     ; Get ith byte of encodedBytes
                            ; Let vector u be the ith byte of encodedBytes, shape 1x8
                            ; Let H_j be the jth column of matrix H, shape of H is 8x4, shape of H_j is 8x1
                            ; Let vector v be the syndrome vector, shape 1x4
    mov [ebp-13], al

    mov dword [ebp-17], 1   ; Counter for loop 2. Iterate over the columns of H
    jmp loop_check_2
loop_begin_2:
    mov eax, ebp
    sub eax, [ebp-17]
    mov al, [eax]           ; al <- H_j
    and al, [ebp-13]        ; al <- u AND H_j
    mov [ebp-18], al

    mov dword [ebp-22], 0   ; Counter for loop 3. Iterate over the result of u AND H_j.
    mov dword [ebp-23], 0   ; Sum <- 0
    jmp loop_check_3

; Find the sum of 1s in the result of u AND H_j
; For example, sum(10010001) = 3
loop_begin_3:
    mov al, [ebp-18]        ; al <- u AND H_j
    mov ah, 1               
    mov cl, [ebp-22]
    shl ah, cl
    and al, ah
    shr al, cl
    add [ebp-23], al

    inc dword [ebp-22]
loop_check_3:
    mov eax, [ebp-22]
    cmp eax, 8
    jl  loop_begin_3

    mov al, [ebp-23]
    mov cl, 2               
    div cl                  ; Divide the sum by two

    mov ecx, ebp
    sub ecx, [ebp-17]
    sub ecx, 23
    mov [ecx], ah           ; Put syndrome vectors (v) into the stack

    inc dword [ebp-17]
loop_check_2:
    mov eax, [ebp-17]
    cmp eax, 4
    jle loop_begin_2

    ; Put together seperate syndrome vectors into one byte
    mov al, [ebp-27]
    mov ah, [ebp-26]
    shl ah, 1
    or  al, ah
    mov ah, [ebp-25]
    shl ah, 2
    or  al, ah
    mov ah, [ebp-24]
    shl ah, 3
    or  al, ah
    and al, 0x0F

    mov [ebp-28], al            ; Syndrome is stored in the stack
    
    cmp al, 0x00
    je no_error

    inc dword [ebp-50]

    ; Syndrome to error mapping
    mov byte [ebp-37], 1            ; Error is in stack ebp-37
    mov dword [ebp-41], 0

; Iterate through the rows of H matrix from bottom to top in order to find the error
; using the syndrome
loop_begin_4:
    mov eax, ebp
    sub eax, 36
    add eax, [ebp-41]
    mov al, [eax]
    and al, 0x0F

    cmp al, [ebp-28]
    je loop_end_4


    shl byte [ebp-37], 1
    inc dword [ebp-41]
    jmp loop_begin_4
loop_end_4:
    mov al, [ebp-37]
    mov ah, [ebp-13]
    xor ah, al
    and ah, 0xF0
    mov [ebp-42], ah
    jmp write_output
no_error:
    mov byte [ebp-37], 0
    mov al, [ebp-13]
    and al, 0xF0
    mov [ebp-42], al
write_output:
    ; Write to errorStatus
    mov eax, [ebp+32]
    add eax, [ebp-8]
    mov cl, [ebp-37]
    mov [eax], cl

    ; Write to decodedBytes
    mov eax, [ebp-8]
    mov cl, 2
    div cl
    mov ecx, [ebp+16]
    mov edx, eax
    and edx, 0x000000FF
    add ecx, edx
    mov [ebp-46], ecx

    cmp ah, 0               ; Decide where to write, i.e., MSB if even, LSB if odd
    je even

    mov eax, [ebp-46]
    mov al, [eax]
    and al, 0xF0
    mov ah, [ebp-42]
    shr ah, 4
    or ah, al
    mov ecx, [ebp-46]
    mov [ecx], ah
    jmp loop_end_1

even:
    mov eax, [ebp-46]
    mov al, [eax]
    and al, 0x0F
    mov ah, [ebp-42]
    or  ah, al
    mov ecx, [ebp-46]
    mov [ecx], ah

loop_end_1:
    inc dword [ebp-8]
loop_check_1:
    mov eax, [ebp-8]
    cmp eax, [ebp+12]  ; Compare i with nEncodedBytes
    jl  loop_begin_1   ; Jump if i < nEcnodedBytes

    mov eax, [ebp-50]
    mov  esp, ebp
    pop  ebp
    ret
; Group 1
; Student 1: Furkan Pala 150180109
; Student 2: İlke Anıl Güvenir 150180042
section .data

i dd 0
j dd 0
k dd 0

section .bss

h_mat resb 4
nInput resd 1

section .text

global encode_data

encode_data:
	push ebp
	mov ebp, esp
	sub esp, 4
	mov [ebp-4], ebx			;store ebx into stack. It will be used for indexing
	mov ebx, h_mat				;start address of reconfigured H_mr matrix
	mov eax, [ebp+28]			;start address of H_mr matrix
	;each row of matrix must be squeezed into 4 bits. Also transpose of matrix needed for multiplication
loop_1:	
	mov edx, 0x0				;reset edx
loop_2:
	mov ecx, [eax]				;
	mov dl, cl
	mov ecx, [i]
	or dh, dl
	shl edx, 1
	inc ecx
	add eax, 16					;jump to next row
	mov dword [i], ecx	
	cmp ecx, 4
	jne loop_2					;inner loop ends here
	
	shr edx, 1
	mov dword [i], 0			;reset i
	mov ecx, [j]		
	mov [ebx], dh
	sub eax, 60					;reset index of H_mr into first row, next column
	inc ebx
	inc ecx
	mov dword [j], ecx
	cmp ecx, 4	
	jne loop_1 					;outer loop ends here.
	;H_mr matrix has been reconfigured for multiplication operation.	
	mov dword [i], 0			;reset i
	mov dword [j], 0			;reset j
	mov eax, [ebp+12]			;address of nInputBytes
	mov dword[nInput], eax		;move nInputBytes into local memory
loop_3:
	mov ecx, 0					;reset ecx
	mov ebx, dword[i]
	mov eax, [ebp + 8]			;address of InputBytes array
	mov cl, byte[eax + ebx]		;load InputBytes[i] (datai | data(i+1))
	xor eax, eax				;clear eax
	mov ch, cl					;copy datas to CH
	and ch, 0xF0				;clear datai+1 from CH
	shr ch, 4
	and cl, 0x0F				;clear datai from CL
	shl cx, 4					;open space for parity bits
	;now CH contains datai0000 and CL contains data(i+1)0000
	;for multiplication, cx AND dx operation will be done.
	;DX and DH both have same H_mr[j] values so parity bits for both data can be calculated simultaneously.
loop_4:
	xor edx, edx				;clear edx
	mov ebx, [j]				
	mov dl, byte[h_mat + ebx]	;load h_mat[j]
	mov dh, dl					;copy same value into DH
	shl edx, 4					;align bits for AND operation
	and dx, cx
	;now # of 1's will be added together then mod(2) operation will be used to determine (4-j)'th parity bit
	;shift multiplication result and add with carry for each shift.
loop_5_low:   
	shl dx, 1
	adc ah, 0					
	inc dword [k]				;k++
	cmp dword [k], 4
	jne loop_5_low				;loop finished
	mov dword [k], 0			;reset k
	shl edx, 4
loop_5_high:
	shl dx, 1
	adc al, 0
	inc dword [k]				;k++
	cmp dword [k], 4
	jne loop_5_high
	;now mod(2) operation will be applied. Then parity bit will ben appended with OR operation.
	mov dword[k], 0				;reset k
	and ax, 0x0101				;mod(2) operation
	mov ebx, ecx				;only CL can be used for shift operations so store data into ebx
	mov ecx, 3
	sub ecx, [j]				
	shl ax, cl
	mov ecx, ebx				;restore data
	or cx, ax					;append calculated parity bit
	inc dword[j]				;j++
	cmp dword[j], 4
	jne loop_4
	;now datai and data(i+1) will be moved into encodedBytes array.
	mov dword[j], 0				;reset j after loop 4
	mov ebx, [i]
	mov eax, [ebp+16]
	mov byte[eax + 2*ebx], ch	;encodedBytes[2*i]
	mov byte[eax + 2*ebx + 1], cl	;encodedBytes[2*i+1]
	inc ebx						;i++
	mov dword[i], ebx
	cmp ebx, [nInput]
	jne loop_3
	mov ebx, [ebp + 20]
	mov eax, [ebp+12]
	mov ecx, 2
	mul ecx
	mov [ebp+20], eax				;move nEncodedBytes
	
	
	mov ebx, [ebp-4]
	mov  esp, ebp
	pop ebp
	ret

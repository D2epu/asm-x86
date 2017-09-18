extern printf
extern scanf

section .data

message db "enter any number: ", 0 
fmt_in  db "%d", 0
fmt_p   db "%d is prime number", 0
fmt_np  db "%d is not prime number", 0

section .code

global start

start:
	enter	4, 0
	
	push	message
	call	printf
	add		esp, 4
	
	lea		eax, [ebp - 4]
	
	push	eax
	push	fmt_in
	call	scanf
	add		esp, 8
	
	push	dword [ebp - 4]
	call	isprime
	add		esp, 4
	
	cmp		eax, 0
	jz		_notprinme
	
	push	dword [ebp - 4]
	push	fmt_p
	call	printf
	add		esp, 8
	jmp		_end
_notprinme:
	push	dword [ebp - 4]
	push	fmt_np
	call	printf
	add		esp, 8
_end:	
	leave
	ret
isprime:
	enter	0, 0
	
	mov		ebx, 2

_loop:
	cmp		ebx, [ebp + 8]
	jz		_done
	
	xor		edx, edx
	mov		eax, [ebp + 8]
	mov		ecx, ebx 
	div		ecx
	
	cmp		edx, 0
	jz		_endif
	
	inc		ebx
	jmp		_loop		
_endif:
	mov		eax, 0
	leave
	ret
_done:	
	mov		eax, 1
	leave
	ret
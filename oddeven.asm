extern printf
extern scanf

section .data

message db "enter any number: ", 0 
fmt_in  db "%d", 0
fmt_odd db "you entered odd number", 0
fmt_evn db "you entered even number", 0

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
	call	oddeven
	add		esp, 4
	
	leave
	ret
oddeven:
	enter	0, 0
	
	mov		eax, [ebp + 8]
	
	xor		edx, edx
	mov		ecx, 2
	div		ecx
	
	cmp		edx, 0
	jz		_even
	
	push	fmt_odd
	call	printf
	add		esp, 4
	
	jmp		_end
_even:
	push	fmt_evn
	call	printf
	add		esp, 4
_end:	
	leave
	ret
extern printf

section .data
	
msg db "written by DipuKumar", 0

section .text

global start

start:
	enter	0, 0
	
	push	msg
	call	printf
	add		esp, 4
	
	leave
	ret

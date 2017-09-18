extern printf
extern scanf

section .data
	
msg  db "enter character :", 0
vfmt db "vowel!", 0
nfmt db "not vowel!", 0
ifmt db "%c", 0

section .text

global start

start:
	enter	4, 0
	
	push	msg
	call	printf
	add	esp, 4
	
	lea  	eax, [ebp - 4]
	
	push	eax
	push	ifmt
	call	scanf
	add	esp, 8
	
	push	dword [ebp - 4]
	call	isvowel
	add	esp, 4
	
	cmp	eax, 0
	jz	_notvowel
	
	push	vfmt
	call	printf
	add	esp, 4
	jmp	_endif
_notvowel:
	push	nfmt
	call	printf
	add	esp, 4
_endif:	
	leave
	ret
	
isvowel:
	enter	0, 0
	
	cmp	dword [ebp + 8], 'a'
	jz	_done
	
	cmp	dword [ebp + 8], 'e'
	jz	_done
	
	cmp	dword [ebp + 8], 'i'
	jz	_done
	
	jz	dword [ebp + 8], 'o'	
	jz      _done
	
	cmp	dword [ebp + 8], 'u'
	jz	_done
	
	mov	eax, 0
	leave	
	ret
_done:
	mov	eax, 1
	leave
	ret

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

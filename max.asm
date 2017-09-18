extern printf
extern scanf

section .data

msg     db "enter two numbers: ", 0
fmt_in  db "%d%d", 0
fmt_out db "maximum: %d", 0

section .text

global start

start:
	enter	8, 0
	
    push    msg
    call    printf
    add     esp, 4

    lea     eax, [ebp - 4]
    lea     ebx, [ebp - 8]

    push    eax
    push    ebx
    push    fmt_in
    call    scanf
    add     esp, 12
	
	push	dword [ebp - 4]
	push	dword [ebp - 8]
	call	maximum
	add		esp, 8
	
	push	eax
	push	fmt_out
	call	printf
	add		esp, 8
	
	leave
	ret
	
maximum:
    enter	0, 0
	
	mov		eax, [ebp + 8]
	cmp		eax, [ebp + 12]
	jg		_done
	
	mov		eax, [ebp + 12]
	
	leave
	ret
_done:
    leave
    ret






























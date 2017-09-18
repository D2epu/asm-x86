extern printf
extern scanf

section .data

msg     db "enter any number : ", 0
fmt_in  db "%d", 0
fmt_out db "factorial : %d", 0

section .text

global start

start:
	enter	4, 0
	
	push	msg
    call    printf
    add     esp, 4
	
	lea		eax, [ebp - 4]

    push   	eax
    push    fmt_in
    call    scanf
    add     esp, 8

    push    dword [ebp - 4]
    call    factorial
    add     esp, 4
	
	push    eax
    push    fmt_out
    call    printf
    add     esp, 8

    leave
	ret

factorial:
    enter	0, 0

    mov     ecx, [ebp + 8]
    mov     eax, 1
_loop:
    cmp     ecx, 0
    jz      _done
    mul     ecx  ; eax * ecx
    dec     ecx
    jmp     _loop
_done:

    leave
    ret



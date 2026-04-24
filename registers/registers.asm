global _start

section .text
_start:
	mov rdi, 42	; exit code
	mov rax, 60	; sys exit
	syscall

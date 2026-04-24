global _start

section .text
_start:
	mov rax, -1
	mov al, 1
	mov rdi, rax
	mov rax, 60
	syscall


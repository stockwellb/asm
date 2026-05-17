%include "syscalls.inc"


global _start

section .text
_start:
        mov rax, 1
        mov rcx, 5

factor_loop:
        imul rax, rcx
        dec rcx
        jnz factor_loop

done:
        mov rdi, rax
        mov rax, SYS_EXIT
        syscall

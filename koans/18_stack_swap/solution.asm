%include "syscalls.inc"

global _start

section .text
_start:
        mov rax, 7
        mov rbx, 11
        push rax
        push rbx
        pop rax
        pop rbx

        mov rdi, rax ; 11
        mov rax, SYS_EXIT
        syscall

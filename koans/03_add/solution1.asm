%include "syscalls.inc"


global _start

section .text
_start:

        mov rax, 10
        mov rbx, 5 
        sub rax, rbx
        mov rdi, rax
        mov rax, SYS_EXIT
        syscall
        ret

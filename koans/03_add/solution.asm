%include "syscalls.inc"

global _start

section .text
_start:
        mov rax, 10
        mov rbx, 10
        add rax, rbx
        mov rdi, rax
        mov rax, SYS_EXIT
        syscall
        ret

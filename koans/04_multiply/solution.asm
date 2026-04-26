%include "syscalls.inc"

global _start

section .text
_start:
        mov rax, 7
        mov rbx, 6
        imul rax, rbx
        mov rdi, rax
        mov rax, SYS_EXIT
        syscall
        ret

%include "syscalls.inc"

global _start

section .text
_start:
        mov rbx, 42
        push rbx
        mov rbx, 0xDEAD
        pop rbx

        mov rdi, rbx
        mov rax, SYS_EXIT
        syscall

%include "syscalls.inc"

global _start

section .text
_start:
        mov rax, 0xFF
        mov rbx, 0x0F
        and rax, rbx
        mov rdi, rax
        mov rax, SYS_EXIT
        syscall
        ret

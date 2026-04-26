%include "syscalls.inc"

global _start


section .text
_start:

        xor rdx, rdx
        mov rax, 20
        mov rbx, 4
        div rbx
        mov rdi, rax
        mov rax, SYS_EXIT
        syscall
        ret

%include "syscalls.inc"

global _start

section .text
_start:

        mov rax, 17
        mov rbx, 5
        xor rdx, rdx
        div rbx
        mov rax, SYS_EXIT
        mov rdi, rdx
        syscall
        ret


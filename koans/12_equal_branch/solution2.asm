%include "syscalls.inc"

global _start

section .text
_start:
        mov rax, 11
        cmp rax, 10
        jne not_equal
        mov rdi, 1

not_equal:
        mov rdi, 0
        mov rax, SYS_EXIT
        syscall
        ret

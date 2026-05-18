%include "syscalls.inc"

global _start

section .text
_start:
        push 1
        push 2
        push 3

        pop rax
        imul rax, 100

        pop rbx
        imul rbx, 10

        add rax, rbx

        pop rbx
        add rax, rbx

        mov rdi, rax                    ; sys exit will trucate this to 65
                                        ; 00000001_01000001
                                        ;          ↑ keep this byte only
        mov rax, SYS_EXIT
        syscall




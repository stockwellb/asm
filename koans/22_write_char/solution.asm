%include "syscalls.inc"

global _start

section .data
        char: db "A", 10
        char_len: equ $ - char

section .text
_start:
        push word [char]
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, rsp
        mov rdx, char_len
        syscall

        mov rax, SYS_EXIT
        mov rdi, 0
        syscall


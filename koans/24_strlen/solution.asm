%include "syscalls.inc"

global _start

section .data
        str: db "Hello", 0

section .text
_start:
        mov rsi, str
        xor rcx, rcx

cmp_loop:
        cmp byte [rsi + rcx], 0
        je end
        inc rcx
        jmp cmp_loop

end:
        mov rax, SYS_EXIT
        mov rdi, rcx
        syscall


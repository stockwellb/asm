%include "syscalls.inc"
%include "print.asm"

global _start

section .text
_start:
        mov rcx, 1
        xor rax, rax

sum_loop:
        add rax, rcx
        inc rcx
        cmp rcx, 10
        jle sum_loop

end:
        mov rdi, rax
        mov rax, SYS_EXIT
        syscall


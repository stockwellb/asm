%include "syscalls.inc"
%include "print.asm"

global _start

section .data
        rbx_name db "rbx", 0

section .text
        _start:
        mov rbx, 0
loop:
        print_reg rbx_name, rbx
        inc rbx
        cmp rbx, 5
        jl end
        jmp loop

end:
        mov rdi, rbx
        mov rax, SYS_EXIT
        syscall


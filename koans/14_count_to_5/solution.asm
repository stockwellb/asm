%include "syscalls.inc"
%include "print.asm"

global _start

section .data
        rbx_name db "rbx", 0

section .text
        _start:
        mov rbx, 0
        print_reg rbx_name, rbx
loop:
        inc rbx
        print_reg rbx_name, rbx
        cmp rbx, 5
        jz end
        jmp loop

end:
        mov rdi, rbx
        mov rax, SYS_EXIT
        syscall


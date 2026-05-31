%include "syscalls.inc"

global _start

section .data
        str: db "hello"
        str_len: equ $ - str
        newline: db 10

section .bss
        buf: resb str_len

section .text
_start:
        xor rcx, rcx

load_loop:
        cmp rcx, str_len 
        jge reverse

        mov al, [str + rcx]
        mov [buf + rcx], al
        inc rcx
        jmp load_loop

reverse:
        xor r8, r8
        mov r9, str_len - 1

reverse_loop:
        cmp r8, r9
        jge write

        mov al, [buf + r8]
        mov bl, [buf + r9]

        mov [buf + r8], bl
        mov [buf + r9], al

        inc r8
        dec r9

        jmp reverse_loop

write:
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, buf
        mov rdx, str_len
        syscall

        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, newline
        mov rdx, 1
        syscall

done:
        mov rax, SYS_EXIT
        mov rdi, 0
        syscall


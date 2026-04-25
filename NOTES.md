# Notes about assembly that I like to reread

All the notes here are about x86_64 ELF

## Includes

    include an external file like this

    `%include "syscalls.inc"` includes the file put this at the top the
    linker will handle putting this include into your file

## System Calls, etc

    - system read is 0
    - system write is 1
    - system exit syscall is 60
    - standard in, out, error is 0, 1, 2

## Anatomy of a system call

    - move the system call's code into the `rax` register
    - move the appropriate return code into the `rdi` register
    - make the syscall



# Koan 26: Reverse String In Place (Capstone)

**Goal**: Copy a string from `.data` into a `.bss` buffer, reverse it in place with two pointers, then print it. For `"hello"`, output is `"olleh"`.

**Practice**: the capstone. Two-pointer loop, byte loads/stores, midpoint termination, register discipline around syscalls. Everything you've drilled so far, combined.

**Success**: the program prints the reversed string.

---

**Hints**:
- copy the string first (koan 25 pattern)
- use two index registers: left = 0, right = length - 1
- careful: `rdi`/`rsi` are also syscall arg registers. Either use different registers for your indices (e.g., `rcx`, `rdx`, `r8`, `r9`) or finish the reverse before setting up the write syscall.
- each iteration: load `[dst + left]` and `[dst + right]` into byte registers, swap-store them, `inc left`, `dec right`
- terminate when `left >= right`

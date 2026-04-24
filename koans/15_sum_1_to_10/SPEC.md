# Koan 15: Sum 1..10

**Goal**: Loop from 1 to 10 inclusive, summing values into a register. Exit with the sum (55).

**Practice**: accumulator pattern inside a loop.

**Success**: `echo $?` prints `55`.

---

**Hints**:
- one register as counter (e.g., `rcx`), another as accumulator (e.g., `rax`)
- shape:
  - `mov rcx, 1` / `xor rax, rax`
  - `loop: add rax, rcx` / `inc rcx` / `cmp rcx, 10` / `jle loop`

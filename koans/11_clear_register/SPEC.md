# Koan 11: Clear a Register Two Ways

**Goal**: Write two tiny programs, both of which leave `rax = 0` before exit. One uses `mov rax, 0`, the other uses `xor eax, eax`. Disassemble both with `objdump -d -M intel <binary>` and note the byte-count difference.

**Practice**: encoding cost. This is the koan where you _feel_ why compilers prefer `xor eax, eax`.

**Success**: both programs exit with 0. You can describe why the `xor` version is 2 bytes and the `mov` version is 7.

---

**Hints**:
- `mov rax, 0` → `48 c7 c0 00 00 00 00` (7 bytes: REX.W + opcode + ModR/M + 4-byte immediate)
- `xor eax, eax` → `31 c0` (2 bytes), and writing to `eax` zero-extends into `rax`
- tie-in with the subreg experiment — same rule, used as an optimization

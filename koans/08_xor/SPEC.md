# Koan 08: XOR

**Goal**: Exit with `0xAA XOR 0x55` (i.e., 255).

**Practice**: `xor` as "toggle these bits."

**Success**: `echo $?` prints `255`.

---

**Hints**:
- `xor` flips any bit where the operands differ
- `0xAA = 10101010`, `0x55 = 01010101` — every bit differs → all ones
- bonus: `xor eax, eax` zeroes a register in 2 bytes — cheaper than `mov rax, 0`

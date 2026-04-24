# Koan 07: AND

**Goal**: Exit with `0xFF AND 0x0F` (i.e., 15).

**Practice**: `and` — the idiomatic way to mask bits.

**Success**: `echo $?` prints `15`.

---

**Hints**:
- `and rax, 0x0F` keeps only the lowest 4 bits of `rax`
- masking is how you extract fields from packed data

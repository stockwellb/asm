# Koan 05: Divide

**Goal**: Exit with `20 / 4` (i.e., 5).

**Practice**: `div` and the implicit `rdx:rax` dividend.

**Success**: `echo $?` prints `5`.

---

**Hints**:
- `div rbx` computes `(rdx:rax) / rbx` — quotient to `rax`, remainder to `rdx`
- zero `rdx` before dividing: `xor rdx, rdx`. Skip this and garbage in `rdx` will corrupt your result.
- for signed division, use `idiv` after `cqo` (sign-extends `rax` into `rdx`)

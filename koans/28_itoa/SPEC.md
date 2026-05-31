# Koan 28: Integer to String (itoa)

**Goal**: Convert an integer (use `12345`) into its decimal ASCII text and print it with `write`, followed by a newline. So far you've printed pre-baked strings and single chars — now print a *number you computed*. This is the link that lets you actually see arithmetic results instead of squinting at `echo $?`.

**Practice**: repeated division by 10, mapping a digit to ASCII, handling that the digits fall out in reverse order.

**Success**: the program prints `12345`.

---

**Hints**:
- a digit's ASCII char is the digit plus `'0'` (48). So `3` → `'3'` is `add ..., '0'`.
- the algorithm: divide the number by 10; the **remainder** is the lowest digit, the **quotient** is what's left. Repeat until the quotient is 0.
- recall the divide convention (koan 05): dividend in `rdx:rax`, so `xor rdx, rdx` first, `mov rbx, 10`, then `div rbx` → quotient in `rax`, remainder in `rdx`.
- the digits come out **least-significant first** (backwards). Two common fixes:
  - reserve a buffer in `.bss` and fill it from the **end** toward the front, then `write` from where you stopped, or
  - push each digit char, then pop them back into the buffer in order.
- don't forget a trailing newline byte (`10`) and the right length in `rdx` for the `write`.
- edge thought (no need to handle it yet): what would `0` produce with a naive loop? Worth knowing it's the one case the "divide until quotient is 0" loop skips.

# Koan 21: Message from .data

**Goal**: Define a longer message in `.data` (e.g., `"hello, koans\n"`), print it with `sys_write`, exit cleanly.

**Practice**: computing length at assemble time with `$ - label`.

**Success**: the program prints your message.

---

**Hints**:
- `msg: db "hello, koans", 10`
- `msg_len: equ $ - msg` — `$` is "current address", so `$ - msg` is the byte count between the label and here
- use `msg` for `rsi` and `msg_len` for `rdx`

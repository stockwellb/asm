# Project 2: cat (file → stdout)

**Goal**: A minimal `cat`. Given a filename as a command-line argument, open the file, read its contents, and write them to stdout. `./solution notes.txt` prints the file. Handle a file of any size, not just one that fits in a single read.

**Why this one next**: it's your first program that touches the filesystem. New syscalls — `open` and `close` — plus a read/write loop. It builds directly on argv (29) and the raw `read`/`write` you already used (20/23).

**Success**: `./solution <somefile>` reproduces the file's bytes exactly on stdout. Compare with the real thing: `diff <(./solution f.txt) <(cat f.txt)` shows no difference.

---

**New syscalls** (add these to `lib/syscalls.inc` alongside the ones you have):
- `SYS_OPEN  equ 2`  — `rax=2`, `rdi=`pointer to filename, `rsi=`flags (`0` = `O_RDONLY`), `rdx=`mode (`0`, unused for read). Returns a **file descriptor** in `rax` (a small non-negative int), or a negative error.
- `SYS_CLOSE equ 3`  — `rax=3`, `rdi=`the fd.

**Stages**:

**Stage 1 — open.** Get the filename from `argv[1]` (koan 29), `open` it read-only, keep the returned fd. Park it in a callee-saved register — you'll need it across many syscalls.

**Stage 2 — the read/write loop.** This is the heart of it:
- reserve a buffer in `.bss` (e.g. `resb 4096`).
- `read(fd, buf, 4096)` → `rax` is the **number of bytes actually read**. It can be less than you asked for, and `0` means end-of-file.
- if `rax == 0`, you're done — break the loop.
- otherwise `write(STDOUT, buf, rax)` — note you write back *exactly* `rax` bytes, the count read, not the full buffer.
- loop back to read again.

**Stage 3 — clean up.** `close` the fd, then exit `0`.

**Hints**:
- the order matters: a fixed-size buffer with a loop is what lets you handle files bigger than the buffer. Don't try to read the whole file at once.
- the "write back exactly what you read" detail is the bug people hit — writing a constant `4096` will spew garbage from a partial last read.
- stretch: check for `open` failure (fd is negative) and exit non-zero with a message to stderr.

# Your first look

Outcome: you can read a decorated file
the way you would read a labelled
diagram — naming each part of the
frame — and you have seen, once, what
the colours physically are: small
escape codes wrapped around the text.

## The decorated view

The lab's transcripts are text, and
text cannot show you colour. So they
show you the decorated output two ways:
*rendered*, with the colour codes
stripped out so the layout prints
plainly (the lab's `render.sh` does the
stripping), and *escape-visible*, where
the codes themselves are printed so you
can inspect them. This chapter uses
both. Here is a small Python file,
decorated and rendered (transcript
`bat-lab/transcripts/t01-first-look.txt`):

```text
─────┬──────────────────────────────────
     │ File: fixtures/farewell.py
─────┼──────────────────────────────────
   1 │ #!/usr/bin/env python3
   2 │ """Print a short farewell message."""
   3 │ 
   4 │ NAMES = ["Ada", "Grace", "Edsger"]
...
  16 │ if __name__ == "__main__":
  17 │     main()
─────┴──────────────────────────────────
```

Anatomy, top to bottom:

- The **top rule** is a horizontal line
  with a joint (┬) where the number
  column ends.
- The **header** names the file —
  `File: fixtures/farewell.py`. On the
  terminal the name is printed in bold.
- A second rule, joint ┼, separates the
  header from the contents.
- Each line of the file follows, with
  its **line number** and a vertical bar
  (│) — the **gutter** — between the
  number and the text.
- The **bottom rule** closes the frame,
  joint ┴.

Nothing inside the frame is the file's
own text except the text itself: the
numbers, bars, and rules are the
decorator's (chapter 2), painted fresh
every time.

## What the colours are made of

Colour on a terminal is not a property
of the text; it is instructions mixed
into it. An **ANSI escape sequence** is
a short code, beginning with the escape
character (written `\033` in the
transcripts), that tells the terminal
"print what follows in this colour" or
"stop doing that". Here is the header
line with its codes visible, from the
same transcript:

```text
     \033[38;5;246m│ \033[0mFile: \033[1mfixtures/farewell.py\033[0m
```

Read it left to right. `38;5;246` means
"foreground colour number 246" — a grey,
used for the frame — and it colours the
`│`. `\033[0m` means "reset, back to
normal". Then `File:` prints plainly,
the name is wrapped in `\033[1m` —
**bold** — and another reset ends it.
The whole of bat's colour work is this,
repeated: the highlighter wraps each
piece of code in the codes for its
colour; the terminal obeys; nothing is
stored in your file.

One code line, taken apart in the same
transcript, shows the highlighter's
hand: in

```python
    return f"Goodbye, {name}. Safe travels!"
```

`return` is wrapped in colour 203, the
`f` marking the string in colour 81,
and the string's own text in 186. Three
decisions by the grammar — keyword,
prefix, string — each visible as a
number.

## Several files, and one failure

Print two files and each gets its own
frame and header (transcript t01):
the CSV of stationery and the Rust
program arrive as two labelled boxes,
never one blur. That header is doing
real work — it is the difference
between a listing and a pile.

And a file that does not exist is met
plainly:

```text
[bat error]: 'fixtures/nope.py': No such file or directory (os error 2)
```

with exit code 1, so scripts can tell
the difference between success and
failure. Hold on to that pattern — a
clear error and a non-zero exit code —
because chapter 5 shows a place where
bat fails *silently* instead, on
purpose, and you need to know which is
which.

Check: run `bat` on any file of your
own. Point at the header, the gutter,
and one line number, and say which part
of the program drew each. Then run
`bat missing.txt` and watch it refuse,
politely and informatively.

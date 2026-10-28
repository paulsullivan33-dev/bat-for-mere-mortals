# What bat is

By the end of this chapter you can say,
in one sentence, what bat adds to the
oldest tool on your system — and state
the one rule that keeps its prettiness
from misleading you.

## cat shows you the file

`cat` prints a file's bytes to the
terminal, exactly as they are stored,
and stops. It has done that, unchanged
in spirit, for fifty years. Nothing
about the output tells you what kind of
file you are looking at, where line 40
is, or whether the line you are reading
changed five minutes ago.

**bat** starts from the same job —
print a file — and asks what a human
reader would want on top of the bytes.
Its own one-line description, from
`bat --help`, is "A cat(1) clone with
syntax highlighting and Git
integration" (transcript
`bat-lab/transcripts/t00-version.txt`).
Unpacked, the decorated view bat shows
on a terminal adds:

- **Syntax highlighting** — the code is
  coloured according to the grammar of
  its language: keywords one colour,
  strings another, comments a third, so
  the shape of the code is visible
  before you read a word of it.
- **Line numbers** down the left side,
  so "look at line 8" is an instruction
  you can follow.
- **A header and a frame** — a border
  naming the file, so two files printed
  one after another never blur into one
  another.
- **Git change marks** — in a git
  repository, a small sign beside lines
  you have added or changed since your
  last commit.
- **A pager** — on a terminal, long
  output opens in `less`, so you can
  search and scroll instead of watching
  the file wash past.

## The rule: the picture is not the file

Everything bat adds is a *picture* of
the file, painted for your eyes. The
file itself does not contain line
numbers, a frame, or colours. That
sounds obvious, and it is the one idea
this whole guide leans on:

> **The decorated view is a picture of
> the file, not the file.**

Bat itself honours the rule. When its
output goes into a pipe — into another
program, a file, a script — it drops
the picture entirely and prints the
plain bytes, identical to what `cat`
would print. Chapter 5 proves that
byte for byte. The picture only exists
where eyes are: on a terminal.

The rule matters because pictures can
be mistaken for the thing itself.
People copy code off a decorated screen
and paste the line numbers into their
editor. People trust a file to be
Python because it is wearing Python's
colours, when bat merely guessed
(chapter 8 shows the guess failing).
Later chapters point back to this rule
wherever the picture could be confused
with the file.

## Where it comes from

bat is a free, open-source program
written in Rust by David Peter and many
contributors; the project lives at
github.com/sharkdp/bat. This guide's
lab ran **bat 0.26.1**, the current
release at the time of writing, taken
straight from the project's release
page. On Debian and Ubuntu the package
installs under the name `batcat`, for
reasons chapter 3 explains; it is the
same program.

Check: without looking back, name three
things the terminal view adds to plain
output, and say the rule out loud once.
If you can, you have this chapter.

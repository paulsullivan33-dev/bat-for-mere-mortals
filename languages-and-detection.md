# Languages and detection

Outcome: you know how bat decides what
language a file is — and when it hands
you a file wearing the wrong colours,
you can fix the guess three ways.

## The map

Bat ships with grammars for 183
languages and file kinds (transcript
`bat-lab/transcripts/t05-languages.txt`).
`--list-languages` prints the map it
works from — each language with the
extensions and special filenames that
belong to it:

```text
Python:py,py3,pyw,pyi,pyx,...
Rust:rs,*.ron
TOML:toml,tml,Cargo.lock,Gopkg.lock,Pipfile,...
Markdown:md,mdown,markdown,markdn,*.mkd
Separated Values:csv
Bourne Again Shell (bash):sh,bash,zsh,ash,...
```

Read one line slowly and the detector's
whole method falls out. It is a lookup,
in this order:

1. **The file's name.** Some names are
   claimed outright — `Cargo.lock` and
   `Pipfile` are read as TOML, whatever
   they contain.
2. **The extension.** `.py` is Python,
   `.rs` is Rust, `.md` is Markdown.
   This settles most files most of the
   time.
3. **The first line.** A file with no
   useful name can still announce
   itself: a first line beginning
   `#!` — a **shebang** — names the
   interpreter, and bat believes it.
   The lab's extensionless `deploy`
   script opens with `#!/bin/sh`, and
   its transcript line shows shell
   colouring: `echo` in one colour, the
   `$SRC` inside the string picked out
   in another.

When none of the three speaks, bat
falls back to plain text: no colours,
no complaint. Notice what is *not* on
the list — reading the contents and
judging what they mean. Bat does not do
that, and the trap below is the price.

When the detector is right, the colours
are a quick summary of the file's
structure. From the same transcript:
JavaScript's `function` keyword stands
out in colour 81; a TOML key (`name =`)
in 203 against its string in 186;
Markdown's heading is one solid colour,
marker and words alike, which is how
prose wears highlighting.

## The lab's central trap: two files in disguise

`fixtures/greet` is a Python program
with no extension and no shebang — its
first line is an ordinary comment.
`fixtures/stocktake` is comma-separated
data with no extension at all. Bat
guessed neither. The evidence is in the
escapes (transcript
`bat-lab/transcripts/t90-trap.txt`).
Line 5 of `greet`, auto-detected:

```text
\033[38;5;231m    return "Hello, " + name + "!"\033[0m
```

One colour, 231, wrapped around the
whole line like a coat of paint: that
is plain text wearing the theme's
default foreground. Now the same line
with the language forced,
`--language python`:

```text
\033[38;5;203mreturn\033[0m ... \033[38;5;186m"Hello, \033[0m ...
```

`return` in 203, the strings in 186 —
a grammar is suddenly at work. The
stocktake tells the same story: solid
231 on its own; with `--language csv`,
each field takes its own colour — and
the language list explains the odd
name you must sometimes ask for, since
CSV is filed as **Separated Values**
(and TSV as Tab Separated Values).

## The three fixes

- **Force it once.** `--language`
  (short form `-l`) settles this run.
  Best for a quick look, and for
  standard input, which has no name to
  guess from — the transcript pipes a
  line in with `--language python` and
  bat even labels the frame `STDIN`.
- **Give it a name.** Detection follows
  the name, so renaming `greet` to
  `greet.py` fixes it permanently — the
  transcript copies it and the same line
  lights up. For a stream, `--file-name`
  lends bat a name to judge by (and to
  print in the header): the transcript
  pipes nameless code in as `greet.py`
  and `def` arrives coloured.
- **Teach the map.** A `--map-syntax`
  rule in your configuration makes the
  fix stick for a whole class of files.
  That is chapter 11's closing exhibit.

The calm way to hold all this: the
colours are a guess about the file,
offered quickly and corrected easily.
When the guess matters — when you are
about to say "this is Python" out loud
— check which evidence bat actually
had: a name, an extension, a first
line, or nothing.

Check: find your most-used language in
`bat --list-languages` and read its
line of extensions. Then copy a small
program to a name with no extension,
watch it go plain, and bring the
colours back twice — once with
`--language`, once by renaming the
copy.

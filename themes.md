# Themes

Outcome: you can repaint every file bat
shows you, and you understand what a
theme actually decides — which is less,
and more, than it first appears.

## A theme is a colouring book, filled in

Chapter 2 split the colouring into two
jobs: the grammar says *this piece is a
keyword, this piece is a string*, and
the theme says *keywords are this
colour, strings are that one*. A
**theme** is nothing more than the
second list, complete. Bat 0.26.1 ships
28 of them (transcript
`bat-lab/transcripts/t06-themes.txt`):

```text
1337, Catppuccin Frappe, Catppuccin Latte,
Catppuccin Macchiato, Catppuccin Mocha,
Coldark-Cold, Coldark-Dark, DarkNeon,
Dracula, GitHub, Monokai Extended,
Monokai Extended Bright, Monokai Extended
Light, Monokai Extended Origin, Nord,
OneHalfDark, OneHalfLight, Solarized (dark),
Solarized (light), Sublime Snazzy, TwoDark,
Visual Studio Dark+, ansi, base16,
base16-256, gruvbox-dark, gruvbox-light,
zenburn
```

The lab's runs use the default theme,
**Monokai Extended** — you can confirm
that from the transcripts rather than
taking this sentence's word for it: the
unnamed run in transcript t06 colours
`def` with colour 203, the function
name with 149, the parameter with 208;
the explicitly named Monokai Extended
run in transcript t08 produces the same
three numbers.

## One line, three palettes

Here is that `def` line under two other
themes, escape-visible in transcript
t06. Under **GitHub**:

```text
\033[38;5;125mdef\033[0m ... \033[38;5;97mfarewell\033[0m ... \033[38;5;31mname\033[0m
```

Under **ansi**:

```text
\033[35mdef\033[0m \033[34mfarewell\033[0m(\033[36mname\033[0m):
```

Same grammar, same three pieces — only
the numbers changed. Two things are
worth noticing. First, the GitHub theme
also repaints the plain parts (the
spaces and brackets take colour 236, a
dark grey, where Monokai used 231):
themes restyle the whole page, not just
the interesting words. Second, the
`ansi` theme's codes are the small,
old, basic ones — 35, 34, 36, no `38;5`
at all. Those are the terminal's own
standard colours, so an `ansi` or
`base16` theme moves with your
terminal's palette: change the
terminal's idea of "magenta" and bat's
keywords follow. A 256-colour theme
like Monokai carries its numbers with
it and looks the same everywhere.

Some themes are made for light
backgrounds and some for dark —
Catppuccin Latte and Solarized (light)
against their dark siblings — and the
help text offers `--theme-light` and
`--theme-dark` for terminals that
report which they are. The lab's
terminal did not do that reporting, so
that switching is recorded here as
documented-only; the themes themselves
were all listed by the lab's binary,
and three were run.

## Setting one without typing it forever

For a single look, `--theme` on the
command line. For a stretch of work,
the `BAT_THEME` environment variable —
transcript t06 shows `BAT_THEME=GitHub`
reproducing the GitHub numbers exactly,
no flag in sight. For good, the theme
belongs in the configuration file,
which is chapter 11's first exhibit.

A last, quiet caution, and it is
chapter 1's rule in new clothes: the
colours are the theme's opinion, not
the file's facts. Two readers with
different themes will describe the same
code as "the red part" and "the purple
part" and both be right. Point at line
numbers when it matters; they do not
change with the paint.

Check: `bat --list-themes`, then render
one line of a familiar file under three
themes and name, for each, the colour
number on the same keyword.

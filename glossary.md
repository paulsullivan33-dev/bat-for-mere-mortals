# Glossary

The terms, collected in one place. Each
is defined the way this guide uses it.

**256-colour escape** — A colour named
by number, written `38;5;N` for a
foreground and `48;5;N` for a
background in the escape sequence.
Most of bat's themes speak in these.

**ANSI escape sequence** — A short code
mixed into terminal output, beginning
with the escape character (`\033`),
that instructs the terminal to change
colour, go bold, or reset. The physical
substance of all highlighting.

**Changes column** — The narrow column
in a decorated view, between the line
number and the gutter, that carries
git's marks: blank for unchanged, `~`
for modified, `+` for added.

**Decoration** — Anything bat draws
that is not the file's text: header,
numbers, grid, marks. Governed by
`--decorations` and the style.

**Detection** — Bat's method for
choosing a file's language: by name,
by extension, by first line — in that
order, and never by understanding the
contents.

**Grammar** — The set of patterns that
says which shapes in a language are
keywords, strings, comments, and so on.
The grammar classifies; the theme
colours.

**Grid** — The style component that
draws the horizontal rules and the
vertical bar of the frame.

**Gutter** — The margin column holding
the line number and the vertical bar.

**Header** — The line(s) at the top of
a decorated view naming the file (and,
in the full style, its size).

**Highlight (verb)** — To colour text
by grammar. Also `--highlight-line`,
which paints one whole line with a
background colour to point at it.

**Index (git)** — Git's staged
snapshot: the version of your work you
have marked for the next commit.
`bat --diff` compares your files on
disk against it.

**Line range** — A span of lines,
written `8:11`, that `--line-range`
limits the output to. Repeatable.

**Map-syntax** — A rule, usually in
the configuration file, teaching the
detector that a filename or pattern
belongs to a given language.

**Pager** — A program — by default
`less` — that receives output on a
terminal and presents it screen by
screen, with searching and scrolling.

**Picture (the)** — This guide's name
for the decorated view: a rendering of
the file for eyes, never to be confused
with the file itself.

**Plain style** — The style with no
components: text only. Also what pipes
receive regardless of style.

**Shebang** — A file's first line,
beginning `#!`, naming its interpreter.
One of the detector's three witnesses.

**Snip line** — The marker drawn where
lines were skipped by a range or by
`--diff`, with a small `8<` at its
centre, so an excerpt admits it is one.

**Style** — The set of decoration
components in force, named with
`--style` as a list, or as the presets
`full` and `plain`.

**Syntax highlighting** — Colouring
source code according to its grammar,
so the structure shows before the words
are read.

**Theme** — The assignment of colours
to the grammar's categories. Changed
with `--theme` or `BAT_THEME`.

**Working tree** — The files as they
sit on your disk right now, saved or
not, staged or not.

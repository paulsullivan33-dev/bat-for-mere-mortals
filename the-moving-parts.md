# The moving parts

Outcome: when bat's output surprises
you, you can name which part produced
the surprise. That turns "bat is doing
something weird" into a problem with an
address.

Bat looks like one tool, but six parts
share the work. Each later chapter is
mostly about one of them.

## The reader

The reader takes input in: one file,
several files in a row, or standard
input — a stream from another program,
when no file is named. Everything
downstream treats the input the same
way. Chapter 8 shows standard input
being read, labelled, and highlighted.

## The detector

Before anything can be coloured, bat
must decide what language it is looking
at. The **detector** makes that call
from the file's name and extension,
from a list of special filenames it
knows, and from the file's first line —
never from reading and understanding
the contents. Chapter 8 opens this part
up, including the times it guesses
wrong and the three ways to correct it.

## The highlighter and the themes

The **highlighter** holds a grammar for
each of the 180-plus languages bat
knows. A grammar says which shapes in
the text are keywords, which are
strings, which are comments, and so on.
A **theme** then assigns colours to
those shapes. Grammar decides *what* a
piece of text is; the theme decides
*what colour* that kind of thing gets.
Chapter 9 is about themes, and why the
same file can look different on two
machines without either being wrong.

## The decorator

The **decorator** draws everything that
is not the file's text: the header with
the file's name, the line numbers, the
grid lines, the git marks. Which of
those appear is your **style**, chosen
from named components. Chapter 6 takes
the frame apart piece by piece.

## The pager gate

At the end, bat decides how output
leaves: straight through, when the
destination is a pipe or a file, or via
a **pager** — by default `less` — when
a person at a terminal will read it.
Three switches govern this, one each
for colour, decorations, and paging,
and each understands *auto*, *always*,
and *never*. Chapter 5 proves the gate
works the way this paragraph claims.

## The git reader

In a repository, bat asks git what has
changed and uses the answer twice: to
place the change marks in the gutter,
and, when you pass `--diff`, to show
only the lines around changes. It reads
git's records; it never changes them.
Chapter 10 shows both uses — and the
blind spot in what git is asked.

## The settings

Three layers can change any default:
a configuration file, environment
variables, and the command line itself.
Chapter 11 sets each layer and proves
which one wins. When bat behaves as if
it is ignoring you, the answer is
usually that a layer you forgot is
speaking louder than the one you are
looking at.

Keep the map loose for now. The point
is that every surprise later has a
part's name on it.

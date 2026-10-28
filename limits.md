# Limits

What bat cannot do, and what it must
not be asked to do — the chapter the
rest of the guide has been promising.
Every item here was met by the lab, in
a transcript, unless it says otherwise.

## Detection is a guess

Bat decides a file's language from its
name, its extension, and its first
line. It never reads the file and
judges what the contents mean. So the
guess can be wrong in both directions:
a Python program named `greet` is plain
text to bat until you correct it, and a
file named `notes.py` full of prose
will be coloured as Python without a
murmur. Chapter 8 is the long version.
The short one: the colours tell you
what bat *inferred*, and inference is
not evidence about what a file is.

## Colour is an opinion

The same line of code wore three
different palettes in chapter 9 without
changing by a single byte. A theme
assigns colours; it does not assign
meaning. Nothing in bat's output can
tell you that code is correct, safe,
important, or yours — only that a
grammar matched its shapes. The moment
a colour starts carrying a conclusion
("the red lines are the errors"), the
picture is being mistaken for the file
again, in a subtler costume.

## Syntax is not understanding

Transcript
`bat-lab/transcripts/t91-limits.txt`
feeds bat a Python file that is not
merely wrong but unparseable:

```python
def broken(:
    return "unclosed
```

Bat colours it beautifully — `def` in
the keyword colour, the name in the
function colour — because highlighting
matches patterns; it does not run,
parse, or judge the code. Never take a
well-coloured file as a working file.
That question belongs to the language's
own tools.

## Binaries get a label, not a view

The same transcript copies a small
program binary into the lab and asks
for the decorated view. Bat prints the
frame and the header — `File:
fixtures/truebin   <BINARY>` — and no
contents at all: it knows machine code
is not reading material, and says so.
(In a pipe the bytes pass through
untouched, as chapter 5's rule
requires; the refusal applies to the
decorated view.) For the insides of
binaries you want other tools entirely.

## --diff has edges, and one is silent

Chapter 10 showed the two blind spots
with transcripts: staged changes
disappear from `--diff`, because the
comparison is against git's index, and
untracked files are skipped entirely —
both in silence, both with a success
exit code. A third edge follows from
what `--diff` is: a view of the file as
it stands. Deleted lines are not shown
anywhere — there is no line in today's
file to hang them on — so "what did I
remove?" is a question bat cannot even
frame. `git diff` remains the tool for
the past tense.

## The picture can contaminate

The frame is not in your file, but it
is on your screen, and screens leak
into files: copy a decorated listing
and you can paste line numbers and
gutter bars into your editor, where
they become very real, very wrong text.
Chapter 6's plain style and chapter 5's
pipe behaviour are the defences — when
text is travelling, let it travel
plain. The same goes for screenshots:
a highlighted, ranged, decorated view
is a claim about a file, edited for
reading. When the exact bytes matter —
whitespace, tabs, line endings — send
the file, or a `--show-all` view that
shows the invisible (chapter 7).

## The pager is a program you chose

On a terminal, bat hands your file to
another program — `less`, or whatever
`--pager`, `BAT_PAGER`, or `PAGER`
names. That program sees the whole
file; a pager is not a passive window
but code you have invited in, and
chapter 5's spy exists to make the
handover visible. Choose pagers the way
you choose any tool that reads your
files: from sources you trust, with
settings you have looked at.

## And the plain boundary

Bat shows files. It does not edit,
run, compile, verify, or transmit them,
and it does not know whether the code
it colours is wise, lawful, or kind.
It is a reading lamp. A good one — but
everything you do about what you read
is still yours.

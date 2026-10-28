# Ranges and highlights

Outcome: you can ask bat for the six
lines you actually care about instead
of the whole file, and you can point at
one line so hard that nobody reading
over your shoulder can miss it.

## Asking for fewer lines

`--line-range` (short form `-r`) takes
a span — `8:11`, `:11` for "from the
start", `8:` for "to the end" — and bat
prints only those lines, still framed
and still numbered by their real
numbers (transcript
`bat-lab/transcripts/t04-ranges.txt`):

```text
   8 │     return f"Goodbye, {name}. Safe travels!"
   9 │ 
  10 │ 
  11 │ def main():
```

The option repeats. Two ranges in one
command print two islands of file, and
bat is honest about the water between
them: a **snip line** crosses the page
where lines were skipped, scissors and
all:

```text
   4 │ NAMES = ["Ada", "Grace", "Edsger"]
 ... │ ─ ─ ─ ─ ─ ─ ─  8<  ─ ─ ─ ─ ─ ─ ─
  12 │     for name in NAMES:
```

That marker matters more than it
looks. A screenshot of lines 2–4 and
12–14 with no marker would quietly lie
about the file's shape. With it, the
picture admits it is an excerpt. It is
chapter 1's rule, enforced by the tool.

## Pointing at one line

`--highlight-line` (short form `-H`)
takes one line — or several; the option
repeats — and paints it with a
background colour, like a marker pen.
In the escape view of transcript t04,
the pointed line is unmistakable:
every piece of it, even the spaces at
the end, carries `48;5;236` — colour
236 as a *background* (`48` where the
foreground's `38` usually stands):

```text
\033[48;5;236;38;5;203mreturn\033[0m ...
```

Use it when the conversation is "look
at this line" — in a review, in a
lesson, in a screenshot you are about
to send. It beats saying "the third
line from the top, no, the other one".

## Tabs, and the characters you cannot see

Two exhibits from the same transcript,
on a price list separated by tab
characters. In the plain style, bat
passes tabs through as tabs — the
`cat -A` view shows them as `^I`,
untouched:

```text
notebook^I3.50$
```

Give `--tabs=4` and the same file comes
out with the tab expanded to spaces, so
the prices align at the next multiple
of four columns:

```text
notebook    3.50$
```

In the framed default view the tab was
already expanded — the lab's framed run
aligns the prices without being asked.
The help text adds the other end of the
dial: `--tabs=0` passes tabs through
directly even where bat would otherwise
expand them.

When you need to see *everything* —
trailing spaces, tabs, the very ends of
lines — `--show-all` (short form `-A`)
draws the invisible. On the price list:

```text
notebook├──┤3.50␊
pencil├┤0.80␊
```

Each tab is drawn as a guide (`├─┤`,
as wide as the gap it spans) and each
line end carries `␊`. This is the view
to reach for when a file "looks right"
but a program disagrees: the difference
is almost always a character you could
not see, and now you can.

Check: pick a file, print lines 3–5 of
it with a range, then print the whole
file with one line highlighted. Then
run `--show-all` on a file you have
edited often — most people find one
surprise.

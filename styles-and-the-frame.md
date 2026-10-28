# Styles and the frame

Outcome: you can order exactly the
frame you want — nothing but the text,
numbers only, the full labelled box —
by naming style components instead of
accepting the default bunch.

## Components, not one switch

Chapter 4's frame is not a single
feature. It is a bundle of components,
each switched by `--style`:

- **plain** — no components at all;
  just the text (coloured, on a
  terminal).
- **numbers** — line numbers in a
  left-hand column.
- **grid** — the rules above, below,
  and the vertical bar after the gutter.
- **header** — the `File:` line naming
  the file.
- **header-filesize** — a `Size:` line
  in the header.
- **changes** — the git marks of
  chapter 10, when they exist.
- **snip** — the marker shown where
  lines were skipped (chapters 7
  and 10).
- **full** — the whole bundle at once.

Transcript
`bat-lab/transcripts/t03-styles.txt`
runs the same eight-line Rust file
through the styles one at a time, at a
pinned width so the frames fit this
page. Plain, rendered:

```text
fn main() {
    let visitor = "world";
```

Numbers alone add the column — nothing
else moves:

```text
   1 fn main() {
   2     let visitor = "world";
```

Grid alone draws rules but no numbers
and no name; header alone prints the
name with no rules at all. The
combinations are exactly as literal as
they sound — `header,grid`:

```text
──────────────────────────────────────
File: fixtures/hello.rs
──────────────────────────────────────
fn main() {
```

And `full` is the works: header with
both the name and a `Size: 140 B` line,
grid, and numbers, in one box. Compare
it with the hand-built `numbers,grid`
later in the same transcript: same
skeleton, no header. That comparison is
the whole lesson — `full` is not magic,
it is a list you could have typed.

Two shorthands cover the common cases:
`-n` asks for line numbers only, and
`-p` for the plain style. The transcript
shows `-n` producing the identical
output to the numbers run, and the lab
used `bat -p` on the stationery CSV
where the text alone was the point.

## Why you would ever want less frame

Plain is not a failure mode; it is
often the right order. Numbers are
wonderful until you copy three lines
into an editor and carry the numbers
with you (chapter 14 tells that story
as a bug report). The grid is
furniture: on a wide terminal it costs
nothing, in a narrow one it still puts
a bar between you and the text. The
style is cheap to change per command,
and chapter 11 shows how to make your
favourite the default so the per-command
choice becomes rare.

One honest note on this chapter's
evidence: the transcripts pinned the
width with `--terminal-width=64` so
every frame fits the page. On your
terminal the frame follows the window's
real width, and the components are the
same.

Check: take a file you know and print
it three ways — `bat --style=plain`,
`bat -n`, and `bat --style=full`, all
on the terminal. The text must not
change by a single character; only the
furniture moves.

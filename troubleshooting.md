# Troubleshooting

Outcome: the six surprises every bat
user meets once, each with the check
that names it. Every one of these
happened in this guide's lab, and the
fix is a chapter that already exists —
this page is the index of mishaps.

## "It printed plain text — bat is broken"

Almost certainly, bat is in a pipe.
Colour, decorations, and paging all
switch off when the output is not a
terminal (chapter 5); a script, a
redirect, or a `| head` is enough.
Check: run the identical command with
nothing after it. If the frame appears,
nothing was ever wrong. If you truly
need the decorated form *in* a pipe,
that is what `--color=always` and
`--decorations=always` are for — the
guide's transcripts use them for
exactly that.

## "This file has no colours"

The detector guessed "plain text", or
guessed nothing at all. The file may
lack an extension, or its first line
may not announce it (chapter 8's
trap). Check: does the same content
colour up when copied to a name *with*
an extension? Then it was detection.
Fix it once with `--language`, forever
with a rename or a `--map-syntax` line
(chapters 8 and 11).

## "The colours are all wrong for this language"

A different guess: detection again, but
it landed on a *wrong language* rather
than none. The fix is the same trio —
the language list in `--list-languages`
tells you which extensions pull which
grammar, so check whether your file's
extension is claimed by the language
you are seeing instead of the one you
expected.

## "My changes don't show in --diff"

You staged them. `bat --diff` compares
the disk against git's index, and
`git add` just made the two agree
(chapter 10). Check: `git status` — if
the file's mark sits in the left
column, the change is staged and this
view is done with it. Use `git diff
--cached` or `git diff HEAD` for the
staged story, and remember the trap's
other half: a new file that git has
never been told about is skipped in
the same silence.

## "I pasted bat's output and my code broke"

You copied the picture (chapter 1's
rule, collecting its debt). The pasted
text carried line numbers — and
possibly gutter bars — from the
decorated view. Check: look at the
first pasted line; if it starts with a
number, that is the whole diagnosis.
Fix: re-copy with `bat -p`, or from a
pipe, where bat is plain by design.

## "I changed the config and nothing happened"

Two usual causes, both in chapter 11.
First, you edited a file bat is not
reading — ask `bat --config-file` for
the path it actually opens, including
the `XDG_CONFIG_HOME` detour if one is
set. Second, a louder layer is
overriding yours: an environment
variable or a flag on the command line
beats the file on exactly the settings
it mentions. Check by clearing the
suspicion in order: run plain `bat` in
a fresh terminal, then hunt the layer
down.

## "There's a weird scissors line in my output"

That is the snip marker (chapters 7 and
10), and it is information, not damage:
lines were skipped there by a range or
by `--diff`, and bat refuses to let the
gap pass unnoticed. If you did not ask
for gaps, check whether a `--line-range`
or `--diff` in your config file is
asking on your behalf.

## "Ubuntu says bat: command not found"

It is called `batcat` there — the name
was taken (chapter 3). Either type the
longer name or link `bat` to it in
`~/.local/bin`, as the install chapter
shows.

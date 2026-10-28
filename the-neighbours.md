# The neighbours

Outcome: you can place bat among the
tools it lives beside, and reach for
the right one first. These are
characterisations, not benchmarks —
each neighbour is described by what it
sees and what it is for, the way this
guide's lab knows them.

## cat — the original

`cat` prints bytes and promises
nothing else. Bat in a pipe *is* cat,
byte for byte (chapter 5), so the two
are not really rivals: bat is a reader
for people, cat is a pipe fitting.
Where output feeds a program, both give
you the same thing; where output feeds
your eyes, only one of them brought
colours, numbers, and a pager.

## less — the other half

Bat's decorated view usually arrives
*through* `less`, which contributes the
searching, scrolling, and staying-put
that bat itself does not do. `less`
alone will page any file, but it shows
raw bytes — escapes and all, if the
file has any — with no highlighting of
its own. The partnership is the point:
bat paints, less holds the painting
still.

## Your editor

Vim, Emacs, and their kin highlight
syntax too — in the place where you can
also change the text. For a file you
are about to edit, the editor is the
right viewer; bat is for the far more
common case of *only* looking, where
opening an editor is heavy and the risk
of an accidental keystroke is real.
(The series has a Vim guide of its own,
listed at the back of this one.)

## The other colourisers

Bat is not the first program to paint
code for the terminal. `pygmentize`
(from the Pygments library) and GNU
`source-highlight` are older hands,
often already installed, and tools like
`ccat` colourise with simpler ambitions.
They differ in language coverage, in
whether they frame and number, and in
whether they know anything about git;
none of them is the drop-in,
pipe-honest `cat` replacement with a
pager that bat sets out to be. If one
is already woven into your scripts,
there is no urgency to switch.

## delta — the other half of chapter 10

Where bat's `--diff` shows you the
*file* with changes flagged, `delta`
shows you the *diff itself*, repainted:
old and new side by side, changes
within a line highlighted, git's output
made legible. They answer different
questions — "where did I touch this
file?" against "what exactly did this
commit do?" — and many people run both:
delta as their git pager, bat as their
file reader.

## The web's file views

GitHub and its kin render files with
highlighting in the browser, and for a
file that lives there, that view is one
click away. It shows committed text,
though — not the file on your disk,
mid-edit, uncommitted and un-pushed —
which is precisely the text bat exists
to show you.

The pattern to keep: every neighbour
either shows plainer bytes, edits
instead of showing, or shows a
different moment in the file's life.
Bat's niche — your file, right now,
dressed for reading, honest in a pipe —
is narrower than it sounds, and it is
the niche you are in most often.

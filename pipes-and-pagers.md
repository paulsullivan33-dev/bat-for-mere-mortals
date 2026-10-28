# Pipes and pagers

Outcome: you can predict, before you
press Enter, whether a given bat
command will produce colour, a frame, a
pager — or the plain file. This is the
chapter where chapter 1's rule stops
being a slogan and becomes mechanics.

## In a pipe, bat is cat

The proof is three commands long
(transcript
`bat-lab/transcripts/t01-first-look.txt`):

```text
$ wc -c fixtures/hello.rs
140 fixtures/hello.rs
$ bat fixtures/hello.rs | wc -c
140
$ bat fixtures/hello.rs | cmp - fixtures/hello.rs && echo IDENTICAL
IDENTICAL
```

Piped, bat's output is the file,
byte for byte: no escapes, no numbers,
no frame. This is deliberate and it is
why bat is safe to learn as a `cat`
replacement: scripts, pipelines, and
other programs that consume your output
never see the picture. Three switches
share this behaviour, each with the
values *auto*, *always*, and *never*:

- `--color` — when to emit the colour
  escapes.
- `--decorations` — when to draw the
  header, numbers, and frame.
- `--paging` — when to hand output to
  a pager.

In *auto* — the default for all three —
each switch asks one question: is the
output going to a terminal? Terminal,
yes; pipe or file, plain. *Always* and
*never* override the question, which is
how this guide's transcripts forced
decorated output into files so you
could inspect it (`--color=always`,
`--decorations=always`).

## On a terminal, the pager takes it

On a terminal, *auto* paging means bat
hands its decorated output to a
**pager** — a program for reading long
output screen by screen — instead of
printing it directly. The default
pager, per `bat --help`, is `less`:

```text
      --pager <command>
          Determine which pager is used. This option will override the PAGER and BAT_PAGER
          environment variables. The default pager is 'less'.
```

An interactive `less` session leaves no
transcript behind — there is nothing to
photograph once you press `q`. So the
lab proved the handover by substitution:
it pointed `BAT_PAGER` at a **pager
spy**, a small script that records
being called and saves everything it is
handed (transcript
`bat-lab/transcripts/t02-pipes-and-pagers.txt`).
Run under a real terminal, the spy
reported:

```text
$ cat spy-called.txt
pager-spy called with args: 
$ wc -c spy-input.bin
2944 spy-input.bin
```

The spy was called, and it received
2,944 bytes of decorated output — the
frame's escapes are there in its saved
input — for a file of 271 bytes. That
inflation is the picture's true size,
and it is why pipes must never carry
it.

The same spy then proves the two
negatives. In a pipe, with the spy still
configured, the spy never ran at all —
`ls spy-called.txt` reports the file
does not exist — and the file's plain
first lines came straight out. And on
the terminal with `--paging=never`
(short form `-P`), the spy again never
ran: bat printed directly. Paging is a
terminal courtesy, switched off the
moment the output has somewhere better
to be.

## Choosing your pager

Three settings choose the pager, in
this order of strength: `--pager` on
the command line, the `BAT_PAGER`
environment variable, then the general
`PAGER` variable — with `less` as the
default when none is set. Chapter 11
shows where such settings can live
permanently. One more option is named
in the help text: `--pager=builtin`
hands the job to a pager built into bat
itself (a program called `minus`). The
lab did not drive it — an interactive
pager leaves nothing to check — so it
is recorded here as documented-only,
and everything else in this chapter was
run.

Check: run `bat` on a long file in your
terminal and watch it open in the
pager (`q` to leave). Run the same
command with the output piped to
`wc -c`, and with `--paging=never`.
Three behaviours, one switch each —
you should be able to say which switch
caused which.

# Seeing what changed

Outcome: you can ask bat the question
"what have I changed in this file?" and
get the file back with everything else
quietly removed — and you know the two
kinds of change this view cannot see.

## The setup

The lab keeps a tiny JavaScript file
under git in `bat-lab/repo/`. Transcript
`bat-lab/transcripts/t07-diff.txt`
builds the whole scene: `git init`, one
commit ("Add the greeter"), then a
script (`apply-changes.sh`) makes three
small edits and stages none of them —
one name changed in a list, one word
changed in the greeting, one line added
at the end. `git status` shows the file
as modified; `git --no-pager diff`
shows the edits in git's own dialect,
old lines struck with `-`, new lines
added with `+`.

## bat --diff: the file, minus the unchanged

Now the same question through bat:

```text
$ bat --diff app.js
```

Even piped, with no frame at all, the
filtering is visible: of the file's
eleven lines, ten come back — the
three changed lines plus two lines of
context around each change, with the
untouched `for` line dropped. Add the
frame back (`--decorations=always`) and
the rendered view shows the rest of the
story:

```text
   1   │ // A tiny greeter for the lab.
   2 ~ │ const visitors = ["sam", "jo", "max"];
...
   5 ~ │   return `Welcome, ${name}!`;
...
 ...   │ ─ ─ ─ ─ ─ ─  8<  ─ ─ ─ ─ ─ ─
...
  11 + │ console.log("All greeted.");
```

There is a new column between the line
number and the gutter — the **changes**
column from chapter 6 — and it speaks
three words:

- **blank** — this line is unchanged;
  it is here as context.
- **`~`** — this line was *modified*.
  In the escapes (transcript t07), the
  mark is wrapped in `\033[33m` — yellow.
- **`+`** — this line was *added*; its
  mark is `\033[32m` — green.

Where lines were skipped, the snip
line from chapter 7 appears, so the
excerpt cannot pretend to be the whole
file. And `--diff-context` sets how
much context travels with each change:
the transcript's `--diff-context=1` run
returns seven lines instead of nine,
the changes holding hands with one
neighbour each instead of two — eight
lines come back instead of ten. (Two is
the default.)

Notice what this view never shows: the
old text. `git diff` shows `-Hello` and
`+Welcome` side by side; bat shows the
file as it now stands, with the changed
lines flagged. It answers "where did I
touch this file?", not "what did it
used to say?" For the second question,
git itself is the tool.

## The blind spots — one of them silent

Two kinds of change are invisible here,
and the transcript demonstrates both.

**Staged changes vanish.** At the end
of the transcript, the lab stages the
very edits you have been looking at —
`git add app.js` — and asks again:

```text
$ bat --diff app.js; echo "exit code: $?"
exit code: 0
```

No output at all, and no error. The
reason is in what bat compares: your
files on disk against git's
**index** — the staged snapshot. Before
`git add`, the edits lived only on
disk, so they showed. Once staged, disk
and index agree, and there is nothing
left to report. The view is not broken;
it is answering a narrower question
than the one in your head. (Comparing
against the last commit instead is
`git diff HEAD`'s job, in git's own
output.)

**Untracked files are skipped.** A
brand-new file has no index entry to
disagree with, and the transcript's
last exhibit runs `--diff` on one: the
same silence, the same exit code 0.

Silence with a success code is a sharp
edge, and it is worth meeting it here,
in a lab, rather than at midnight: a
script that treats "bat --diff printed
nothing" as "nothing changed" will be
lied to exactly when changes were
staged an hour ago.

Check: in a repository of your own,
edit a tracked file, watch the edit
appear under `bat --diff`, then stage
it and watch it disappear. Explain to
yourself, out loud, where it went.

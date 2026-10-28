# Making it yours

Outcome: your favourite theme, style,
and pager are set once, in the right
layer, and you can prove which layer is
in charge when two of them disagree.

## The configuration file

Bat reads a configuration file on every
run — plain text, one command-line
option per line. You never have to
guess where yours lives; ask:

```text
$ bat --config-file
$ bat --config-dir
```

(Transcript
`bat-lab/transcripts/t08-config.txt`.)
On a typical Linux machine the answer
is `~/.config/bat/config`, inside
`~/.config/bat`. The lab's transcript
shows a path inside its own scratch
folder instead, because the lab pointed
`XDG_CONFIG_HOME` elsewhere to keep its
experiments from touching the machine's
real settings — the command is the
same; the answer is wherever *your*
setup keeps it.

To start, let bat write you a skeleton:

```text
$ bat --generate-config-file
Success! Config file written to ...
```

The generated file is all comments —
documented options with the `#` still
on, including the theme setting, a
mouse-scrolling pager line for `less`,
and examples of the syntax mapping this
chapter ends with. It changes nothing
until you uncomment or add a line,
which makes it a safe first edit.

## Two lines, proven

The lab replaced the skeleton with two
lines:

```text
--theme="GitHub"
--style="numbers"
```

and the very next run obeys both: in
transcript t08 the `def` line arrives
wearing the GitHub theme's colours
(125 for the keyword — chapter 9's
numbers) and carrying a line number,
with no header and no grid, because
"numbers" was the whole style. That is
the configuration file doing exactly
what it promises: the flags you would
have typed, remembered.

## The layers argue; the louder one wins

Three layers can set the same thing,
and the chapters have now met them all:

- the **configuration file** (this
  chapter),
- **environment variables** —
  `BAT_THEME` (chapter 9), `BAT_PAGER`
  and `BAT_PAGING` (chapter 5), and
  `BAT_STYLE`,
- the **command line** itself.

Transcript t08 stages the argument
twice. With the file demanding numbers,
`BAT_STYLE=plain` strips the numbers
away and leaves the file's theme
untouched — the environment beat the
file on style, and said nothing about
theme. Then `--theme="Monokai Extended"`
on the command line repaints the same
run back to Monokai colours while the
file's numbers stay in place — the
command line beat the file on theme.
Nothing here is mysterious once you
know the order: **command line over
environment over file**, each layer
overriding only the settings it
actually mentions. When bat seems to
ignore your configuration, the cause is
almost always a louder layer you set
last month and forgot.

## The permanent fix for chapter 8's trap

The transcript's last move appends one
line to the configuration:

```text
--map-syntax "stocktake:csv"
```

`--map-syntax` teaches the detector a
new name: any file called `stocktake`
is CSV — is *Separated Values* — from
now on. The run that follows needs no
`--language` flag, and the stocktake's
fields come out coloured on their own.
The pattern is a filename glob, so
`*.log` files, extensionless scripts
with a family name, whole folders of
odd exports — each can be given its
language once, in writing, instead of
being forced by hand forever.

Check: generate the skeleton config,
set a theme and a style in it, and
watch a run obey both. Then override
the style from the environment for one
run, and the theme from the command
line, and say which layer won each
time before you look.

# bat for Mere Mortals

Every programmer spends a surprising
share of the day doing one humble
thing: *looking at a file*. The default
tool for that is `cat`, and `cat` shows
you raw bytes — no line numbers, no
colour, no name tag, no hint of what
changed since lunch. **bat** is a
`cat` clone that dresses the file for
reading: **syntax highlighting** in the
colours of its language, **line
numbers**, a **header and frame**, marks
beside the lines git says you changed,
and a **pager** when the output reaches
a terminal.

One rule governs everything it does,
and this guide states it in chapter 1
and keeps pointing back to it: **the
decorated view is a picture of the
file, not the file.** When bat's output
goes into a pipe, it drops the picture
and prints the plain bytes, exactly
like `cat` — the lab proves that byte
for byte. The picture exists only
where eyes are, and most of the ways
bat can surprise you are ways of
forgetting which of the two you are
looking at.

The lab behind this guide ran the real
thing: **bat 0.26.1**, the official
release binary from the project's
GitHub releases, run on a small Linux
machine against fixture files the lab
wrote for the purpose — a Python
farewell script, a Rust greeting, a
JavaScript greeter, a TOML settings
file, Markdown notes, a stationery CSV,
and two files in deliberate disguise.
Against them the lab took the decorated
output apart escape code by escape
code; proved the pipe behaviour with a
byte comparison; proved the pager
handover with a stand-in "pager spy"
under a real terminal; ran every style
component separately and combined;
sliced files by line ranges and
highlighted single lines; listed all
183 languages and caught the language
detector failing, at the byte level, on
the two disguised files; repainted one
line of code under three themes; built
a small git repository, edited it, and
watched `--diff` filter the file to its
changes — then staged the edits and
watched them vanish from that view; and
set a theme, a style, and a syntax
mapping in the configuration file and
proved each layer's authority over the
others.

What the lab could not do, it did not
fake. An interactive `less` session
leaves nothing behind to check, so the
pager chapters prove the handover by
its footprints — the spy's record of
what it received — rather than by
photographing a screen. The built-in
pager, the always-paging mode, and
automatic light/dark theme switching
are named from the help text and
labelled documented-only. So are the
package installs for each operating
system: the lab ran the project's own
release binary, and `criteria.md` keeps
the full ledger of what was run and
what was only read.

## What this guide covers

- [**What bat is**](what-bat-is.md) —
  the picture and the file, the five
  things the decorated view adds, and
  the one rule
- [**The moving parts**](the-moving-parts.md) —
  the reader, the detector, the
  highlighter and themes, the decorator,
  the pager gate, the git reader, and
  the settings
- [**Installing bat**](installing-bat.md) —
  the release file the lab used, the
  package routes, and the Debian/Ubuntu
  `batcat` surprise
- [**Your first look**](your-first-look.md) —
  the frame taken apart piece by piece,
  and what the colour codes physically
  are
- [**Pipes and pagers**](pipes-and-pagers.md) —
  byte-identical pipes, the three
  *auto/always/never* switches, and the
  pager spy's evidence
- [**Styles and the frame**](styles-and-the-frame.md) —
  every component on its own, the
  `full` bundle, and the `-n` and `-p`
  shorthands
- [**Ranges and highlights**](ranges-and-highlights.md) —
  asking for fewer lines, the honest
  snip marker, painting one line, tabs,
  and seeing the invisible with
  `--show-all`
- [**Languages and detection**](languages-and-detection.md) —
  the 183-language map, the detector's
  three witnesses, and the trap of the
  two disguised files, with its three
  fixes
- [**Themes**](themes.md) — 28 palettes,
  one line of code under three of them,
  and why colour is an opinion
- [**Seeing what changed**](git-changes.md) —
  `bat --diff`, the `~` and `+` marks,
  context you can tune, and the staged
  blind spot
- [**Making it yours**](making-it-yours.md) —
  the configuration file, the three
  layers and which one wins, and a
  permanent fix for the detection trap
- [**The neighbours**](the-neighbours.md) —
  cat, less, your editor, the older
  colourisers, delta, and the browser's
  file view
- [**Limits**](limits.md) — guessing
  detection, meaningless colour,
  pattern-matching without
  understanding, binaries, the diff
  blind spots, and the picture that can
  contaminate
- [**Troubleshooting**](troubleshooting.md) —
  the plain pipe, the missing colours,
  the vanished changes, the pasted line
  numbers, and the ignored config
- [**Glossary**](glossary.md) — the
  terms, collected in one place

## What it doesn't cover

Editing files — bat is a reader, and
chapter 12 explains when the editor is
the right viewer instead. Writing your
own syntax grammars and themes and
rebuilding bat's cache with
`bat cache --build` is pointed at in
the documentation and left there;
adding a mapping for a language bat
already knows *is* covered, in chapter
11. Turning bat into a general diff
tool is likewise out: it flags changed
lines in the file as it stands, and
`git diff` and delta (chapter 12) own
the past tense.

## How to use this guide

Read chapter 1 for the rule and
chapter 2 for the map of parts;
everything after that is a part being
opened. Chapter 4 is best done with a
terminal open and a file of your own —
the frame makes sense the moment you
can point at it. Chapters 5 and 8 are
the two that change how you read every
later surprise: why output went plain,
and why the colours are a guess. The
lab's fixtures live in
`bat-lab/fixtures/`, its git stage in
`bat-lab/repo/`, its three helper
scripts (`render.sh`, `pager-spy.sh`,
`pty-run.sh`) beside them, and every
claim's evidence in
`bat-lab/transcripts/`; its distilled
commands are `examples/commands.txt`
and its notes `examples/lab-notes.txt`.

---

## Part of the series

This guide is one of the [For Mere Mortals](https://paulsullivan33-dev.github.io/mere-mortals/) guides: plain-language guides to the tools programmers and makers use.

Related guides:

- [Text Processing for Mere Mortals](https://paulsullivan33-dev.github.io/text-processing-for-mere-mortals/)
- [Vim for Mere Mortals](https://paulsullivan33-dev.github.io/vim-for-mere-mortals/)
- [Markdown for Mere Mortals](https://paulsullivan33-dev.github.io/markdown-for-mere-mortals/)

## License

The writing in this guide is licensed under [CC BY 4.0](https://github.com/paulsullivan33-dev/bat-for-mere-mortals/blob/main/LICENSE). Code examples and lab scripts are licensed under the [MIT License](https://github.com/paulsullivan33-dev/bat-for-mere-mortals/blob/main/LICENSE-CODE).

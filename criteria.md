# Writing criteria for this guide

Every "for Mere Mortals" guide is written to the same nine-point
standard, so a reader who trusts one can trust the rest. Here it
is, with the verification notes for this particular guide below.

1. **Fix it first.** Reader outcomes lead, not action items: each
   chapter opens by naming the outcome it delivers, shows a check
   the reader can run to confirm they got it, and a reasonable
   reader finishes able to state what was done, what it means,
   and what to try next.
2. **Plain language.** Short sentences, everyday vocabulary,
   technical terms defined on first use. No slang, and no
   idioms that only make sense in one country — the reader may
   be translating as they go.
3. **No dead ends.** A guide never tells the reader to do
   something it cannot show them how to verify. Every claim a
   reader relies on — an install, a command, an output — is
   something this guide demonstrates or clearly labels
   documented-only below.
4. **Live-verified where it matters.** Procedures are run for
   real in the guide's lab wherever the build machine allows it,
   and the transcripts kept in the repository are the evidence.
   What could not be run is listed honestly below, never
   presented as if it had been.
5. **General audiences.** Nothing in this guide — examples,
   fixtures, names, addresses — is modelled on any particular
   reader or author's real life, network, or organisations.
   The lab's traffic is the lab talking to itself.
6. **Standalone.** A reader needs this guide, its lab, and
   nothing else. Where another guide would genuinely help, it
   is pointed to once, by name, and the chapter still completes
   without it.
7. **Honest about limits.** Chapter 13 names what the tool
   cannot do: detection that guesses from a name, an extension
   and a first line, and can be wrong in both directions;
   colours that are a theme's opinion and never evidence of
   meaning; highlighting that matches patterns without
   understanding, so unparseable code is coloured without
   complaint; binaries the decorated view labels but will not
   show; a change view blind to staged work, untracked files
   and deleted lines; and the decorated picture itself, which
   contaminates any file it is carelessly pasted into.
8. **The one rule is in the text, early.** Chapter 1 and the
   README state the rule plainly — *the decorated view is a
   picture of the file, not the file* — before any procedure
   depends on it, and later chapters point back to it where the
   picture could be mistaken for the thing itself: copied off
   the screen into an editor, trusted as proof of what a file
   is, or screenshotted as if it were the bytes.
9. **Builds clean.** The site builds with MkDocs in strict mode
   with no warnings, and a fresh reader following the chapters
   in order reaches the stated outcome of each.

## Verification notes for this guide

The build machine is a 2-CPU, 7.7 GB Ubuntu 24.04 sandbox.
bat **0.26.1** was the project's official release binary for
Linux (`bat-v0.26.1-x86_64-unknown-linux-gnu.tar.gz` from the
sharkdp/bat GitHub releases), run from a scratch folder rather
than installed system-wide; `less` 590 and git 2.43.0 were the
companions. The fixtures are the lab's own, in
`bat-lab/fixtures/`; three small shell helpers —
`render.sh` (strips escape codes so decorated output can be
printed), `pager-spy.sh` (a pretend pager that records being
called and saves what it is handed), and `pty-run.sh` (runs a
command under a real terminal via `script(1)`) — are in
`bat-lab/`. All transcripts live in `bat-lab/transcripts/`.
To keep the machine's own settings out of the experiments,
every run except chapter 11's own was made with
`XDG_CONFIG_HOME` pointed at an empty folder in the lab; the
configuration chapter's transcripts show the lab paths that
result, and the chapter text says why.

Run for real, with transcripts as evidence:

- Version and the head of `--help`; the `less` and `git`
  versions the lab relied on (t00).
- The pipe rule: piped output byte-for-byte identical to the
  file under `cmp`, with matching byte counts (t01). The
  decorated view of a Python file, rendered and then taken
  apart escape by escape — the grey frame at colour 246, the
  header's bold name, the keyword/string colours on one code
  line (t01). Two files printed together, each with its own
  frame (t01). A missing file: the `[bat error]` message and
  exit code 1 (t01).
- The pager, proved by substitution under a real terminal
  (`script(1)`): the pager spy was called and received 2,944
  bytes of decorated output for a 271-byte file; in a pipe
  the spy never ran and plain text came out; on the terminal
  with `--paging=never` the spy never ran either (t02). The
  default pager being `less` is quoted from `--help` in the
  same transcript.
- Styles: plain, numbers, grid, header, header+grid and full
  run one at a time on the same Rust file at a pinned width,
  plus `-n` producing the numbers run exactly, `bat -p`, and
  the hand-built numbers+grid compared with full (t03).
- One line range, two line ranges with the snip line between
  them, and `--highlight-line` with its `48;5;236` background
  read out of the escapes (t04). Tabs: passed through as tabs
  in the plain style, expanded by `--tabs=4`, and already
  expanded in the framed view; `--show-all` drawing tab
  guides and line-end marks (t04).
- Languages: the full list counted (183) and the mapping
  lines read for Python, Rust, TOML, Markdown, Separated
  Values and Bourne Again Shell (t05); colour evidence that
  detection landed for JavaScript, TOML, Markdown, and for a
  shebang-only shell script (t05); standard input read with
  `--language python` (frame labelled STDIN) and detected
  from a `--file-name` instead (t05).
- The trap, at the byte level: a Python program with no
  extension and no shebang, and CSV data with no extension,
  both auto-detected as plain text — one solid colour run per
  line — against the same lines fully coloured with
  `--language` forced; the rename fix (`greet` copied to
  `greet.py`) restoring detection (t90).
- Themes: all 28 listed; one line of code escape-read under
  the default theme (identified as Monokai Extended by its
  colour numbers matching the named run in t08), under
  GitHub, and under `ansi`, whose basic codes are visibly a
  different kind; `BAT_THEME=GitHub` reproducing the GitHub
  run without a flag (t06).
- Git: a fixture repository built, committed, and edited by
  a shipped script; `git diff` as the baseline; `bat --diff`
  filtering to changed lines plus two lines of context,
  `--diff-context=1` tightening it; the `~` mark read as
  yellow (33) and the `+` mark as green (32) in the escapes;
  the snip line between change groups; then the two blind
  spots — the same edits staged with `git add`, after which
  `--diff` prints nothing and exits 0, and an untracked file
  skipped in the same silence (t07).
- Configuration: `--config-file` and `--config-dir`;
  `--generate-config-file` and its all-comments skeleton; a
  two-line configuration (GitHub theme, numbers style)
  obeyed by the next run; `BAT_STYLE` overriding the file's
  style for one run; `--theme` on the command line
  overriding the file's theme; and a `--map-syntax` line in
  the configuration fixing the trap's stocktake file
  permanently (t08).
- The limits exhibits: a syntactically broken Python file
  highlighted without complaint, and a copied program binary
  shown by the decorated view as `<BINARY>` with no contents
  while its bytes pass through a pipe untouched (t91).

Documented only — described from the project's documentation
or `--help` text, not run, and the text does not claim
otherwise:

- The interactive `less` session itself: a real pager
  session is driven by hand and leaves no record to check,
  so chapter 5 proves the handover by the pager spy's
  footprints instead.
- The built-in `minus` pager (`--pager=builtin`) and
  `--paging=always`, both named from the `--help` text.
- Automatic light/dark theme switching (`--theme-light`,
  `--theme-dark`): the lab's terminal did not report a
  background for bat to switch on.
- The package installation routes (apt — including the
  `batcat` name on Debian and Ubuntu — dnf, Homebrew,
  winget and friends): the lab ran the release binary, and
  the project documents the wrappings.
- Adding your own syntaxes and themes and rebuilding the
  cache with `bat cache --build`.
- `--tabs=0` passing tabs through directly, quoted from the
  `--help` text; the neighbouring settings were run.
- The comparison tools in chapter 12 are characterised, not
  benchmarked.

Fixtures are this guide's own and deliberately generic: a
farewell script, two greeters, a settings file for an
imaginary workshop app, packing notes, a stationery price
list, and a shelf stocktake — plus the two disguised files
that chapter 8 catches the detector on. No example is
modelled on any real person, network, service or
organisation.

# Installing bat

Outcome: bat is on your machine and
answers to its name. This guide's lab
installed it one particular way, from
the project's own release file, and
that is the route shown in full; the
package routes are described and
labelled, because the lab did not use
them.

## The route the lab took

The lab downloaded the release archive
for Linux from the project's GitHub
releases page —
`bat-v0.26.1-x86_64-unknown-linux-gnu.tar.gz`
— unpacked it, and ran the `bat` binary
inside. No system-wide install, nothing
else touched: the binary sat in the
lab's scratch folder and was called
from there. The same archive is what a
reader without a package manager would
use; on your own machine you would move
the binary somewhere on your path, such
as `~/.local/bin`.

The check that any install must pass is
one command:

```bash
bat --version
```

The lab's answer is the first line of
transcript
`bat-lab/transcripts/t00-version.txt`:

```text
bat 0.26.1 (979ba22)
```

Your number will likely be newer. What
matters is that the command answers
with a version instead of an error.

## The package routes

Most readers will install bat from
their operating system's packages, and
the project documents each route:

- **Debian and Ubuntu:** `sudo apt
  install bat`. One surprise, well
  documented by the project: the
  command is installed as **`batcat`**,
  because the name `bat` was already
  taken by an older, unrelated package
  in those distributions. Everything in
  this guide works the same; either
  type `batcat` where the guide says
  `bat`, or give yourself the short
  name back with a link in your own
  `bin` folder:

  ```bash
  mkdir -p ~/.local/bin
  ln -s /usr/bin/batcat ~/.local/bin/bat
  ```

- **Fedora:** `sudo dnf install bat`.
- **macOS:** `brew install bat` with
  Homebrew.
- **Windows:** installers and package
  managers (winget, Chocolatey, Scoop)
  are listed in the project's README.

These routes are described from the
project's documentation, not run by
this guide's lab, and are labelled
documented-only in `criteria.md`. The
lab verified the program itself; the
wrapping it arrives in varies by
system, and the version check above is
how you confirm your wrapping worked.

## What you need beside it

Two companions appear in this guide.
**less** is the pager bat hands output
to on a terminal; it is already present
on most Unix-like systems (the lab's is
less 590 — transcript t00). **git** is
needed only for chapter 10's change
marks; bat works perfectly well outside
repositories, it simply has nothing to
mark. Both are checked the same way:
`less --version`, `git --version`.

Check: `bat --version` answers, and if
you installed through Debian or Ubuntu,
you know whether your command is called
`bat` or `batcat` — and why.

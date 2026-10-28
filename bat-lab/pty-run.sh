#!/bin/sh
# pty-run.sh — run a command with a real terminal attached,
# using script(1), and throw the terminal session itself away.
# The lab uses it to prove terminal-only behaviour (paging,
# colours) by its side effects — the files the pager spy
# writes — rather than by photographing a screen.
# Usage: ./pty-run.sh 'command to run'
exec script -qec "$1" /dev/null > /dev/null

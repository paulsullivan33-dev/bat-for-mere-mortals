#!/bin/sh
# pager-spy.sh — a pretend pager for the bat lab.
#
# A real pager (less) is interactive and leaves nothing behind
# to inspect. This spy does the two things the lab needs to
# prove: it records that it was called, in spy-called.txt, and
# it saves everything it was handed, in spy-input.bin, so the
# lab can look at the exact bytes bat sent to its pager.
echo "pager-spy called with args: $*" > spy-called.txt
cat > spy-input.bin

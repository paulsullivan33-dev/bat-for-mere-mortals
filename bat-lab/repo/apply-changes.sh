#!/bin/sh
# apply-changes.sh — make the edits that chapter 10 studies.
# Run this inside the repo/ folder AFTER the first commit
# (transcript t07 shows the whole sequence):
#
#   git init
#   git add app.js
#   git commit -m "Add the greeter"
#   ./apply-changes.sh
#
# It changes one name in the list, changes the greeting word,
# and adds a line at the end — three small edits, none of them
# staged, so bat --diff can see them.
set -e
sed -i 's/"pri"/"max"/; s/Hello,/Welcome,/' app.js
echo 'console.log("All greeted.");' >> app.js

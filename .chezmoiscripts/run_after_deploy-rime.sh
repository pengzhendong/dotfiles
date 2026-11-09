#!/bin/sh
# Squirrel only builds its bundled schemes at install time; without this the
# user data directory has no compiled schema and typing produces no candidates.
set -eu

rime_dir="$HOME/Library/Rime"
deployer="/Library/Input Methods/Squirrel.app/Contents/MacOS/rime_deployer"

[ -x "$deployer" ] || exit 0
[ -d "$rime_dir" ] || exit 0

"$deployer" --build "$rime_dir"

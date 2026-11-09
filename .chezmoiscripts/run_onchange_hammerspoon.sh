#!/bin/sh
# Register Hammerspoon as a login item. Hammerspoon exposes no CLI for this.
set -eu

[ "$(uname -s)" = Darwin ] || exit 0
[ -d /Applications/Hammerspoon.app ] || exit 0

osascript <<'EOF' >/dev/null || echo "hammerspoon: allow this terminal to control System Events, then re-apply" >&2
tell application "System Events"
  if not (exists login item "Hammerspoon") then
    make login item at end with properties {path:"/Applications/Hammerspoon.app", hidden:false}
  end if
end tell
EOF

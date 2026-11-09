#!/bin/sh
# Launch Hammerspoon at login through a LaunchAgent. Unlike a login item this
# needs no Automation permission, so applying the dotfiles never prompts.
set -eu

[ "$(uname -s)" = Darwin ] || exit 0
[ -d /Applications/Hammerspoon.app ] || exit 0

label=local.hammerspoon.autostart
plist="$HOME/Library/LaunchAgents/$label.plist"

mkdir -p "$HOME/Library/LaunchAgents"
cat > "$plist" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>local.hammerspoon.autostart</string>
  <key>ProgramArguments</key>
  <array>
    <string>/usr/bin/open</string>
    <string>-g</string>
    <string>-j</string>
    <string>-a</string>
    <string>Hammerspoon</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>
EOF

uid=$(id -u)
launchctl bootout "gui/$uid/$label" 2>/dev/null || true
launchctl bootstrap "gui/$uid" "$plist" 2>/dev/null || true

#!/bin/sh
# Thaw menu bar manager. Only portable preferences: item order, display state,
# and conceal snapshots are per-machine and deliberately left alone.
set -eu

[ "$(uname -s)" = Darwin ] || exit 0

# Restart with killall rather than AppleScript so applying never needs
# Automation permission.
was_running=0
if pgrep -x Thaw >/dev/null; then
  was_running=1
  killall Thaw 2>/dev/null || true
  i=0
  while pgrep -x Thaw >/dev/null && [ "$i" -lt 20 ]; do
    sleep 0.1
    i=$((i + 1))
  done
fi

defaults write com.stonerl.Thaw AllowsBetaUpdates -bool true
defaults write com.stonerl.Thaw UpdateChannel -string beta
defaults write com.stonerl.Thaw SUEnableAutomaticChecks -bool true
defaults write com.stonerl.Thaw SUAutomaticallyUpdate -bool true
defaults write com.stonerl.Thaw SimpleMode -bool false
defaults write com.stonerl.Thaw UseDoubleClickToShowAlwaysHiddenSection -bool true
defaults write com.stonerl.Thaw UseOptionClickToShowAlwaysHiddenSection -bool true
defaults write com.stonerl.Thaw EnableNativeAppHiding -bool false

if [ "$was_running" = 1 ]; then
  open -a Thaw
fi

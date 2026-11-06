#!/bin/sh
# Hide suggested and recent apps from the Dock.
set -eu

[ "$(uname -s)" = Darwin ] || exit 0

defaults write com.apple.dock show-recents -bool false
killall Dock || true

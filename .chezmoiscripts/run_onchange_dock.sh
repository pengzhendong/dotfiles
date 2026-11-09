#!/bin/sh
# Hide suggested and recent apps, and place the Dock on the left edge.
set -eu

[ "$(uname -s)" = Darwin ] || exit 0

defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock orientation -string left
killall Dock || true

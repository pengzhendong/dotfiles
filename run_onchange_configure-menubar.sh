#!/bin/sh
# Analog menu bar clock with date, and no Siri, Spotlight, or Wi-Fi in the menu bar.
set -eu

[ "$(uname -s)" = Darwin ] || exit 0

defaults write com.apple.menuextra.clock IsAnalog -bool true
defaults write com.apple.menuextra.clock ShowDate -bool true
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
defaults write com.apple.menuextra.clock ShowAMPM -bool true

defaults write com.apple.Siri StatusMenuVisible -bool false
defaults -currentHost write com.apple.Spotlight MenuItemHidden -bool true
# 8 keeps the control in Control Center only; 18 also shows it in the menu bar.
defaults -currentHost write com.apple.controlcenter WiFi -int 8

killall SystemUIServer 2>/dev/null || true
killall ControlCenter 2>/dev/null || true

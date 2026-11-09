#!/bin/sh
# Three-finger drag, matching Accessibility > Pointer Control > Trackpad Options.
set -eu

[ "$(uname -s)" = Darwin ] || exit 0

for domain in \
  com.apple.AppleMultitouchTrackpad \
  com.apple.driver.AppleBluetoothMultitouch.trackpad
do
  defaults write "$domain" TrackpadThreeFingerDrag -bool true
done

#!/bin/sh
# Itsycal menu bar clock. Unicode date format: mm is minutes, MM is month.
set -eu

[ "$(uname -s)" = Darwin ] || exit 0

defaults write com.mowglii.ItsycalApp ClockFormat -string "E MMM d HH:mm"
defaults write com.mowglii.ItsycalApp HideIcon -bool true
defaults write com.mowglii.ItsycalApp ShowEventDays -int 7
defaults write com.mowglii.ItsycalApp HighlightedDOWs -int 65

if pgrep -x Itsycal >/dev/null; then
  killall Itsycal
  open -a Itsycal
fi

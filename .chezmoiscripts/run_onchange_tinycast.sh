#!/bin/sh
# Tinycast launcher: palette hotkey, extension commands in the launcher, aliases.
# Tinycast reads these through NSUserDefaults, so restart it after a change.
set -eu

[ "$(uname -s)" = Darwin ] || exit 0

domain=com.tinycast.app

defaults write "$domain" "hotkey.togglePalette" -string \
  '{"combo":{"_0":{"carbonModifiers":2048,"carbonKeyCode":49}}}'
defaults write "$domain" compactMode -bool false
defaults write "$domain" extensionsEnabled -bool true
defaults write "$domain" extensionsShowInLauncher -bool true
defaults write "$domain" AppleLanguages -array zh-Hans
defaults write "$domain" quickActionsEnabled -bool true
defaults write "$domain" quickActionLanguage -string zh

# Merge so aliases added in the app on another machine survive.
defaults write "$domain" launcherAliases -dict-add "extension:easydict/easydict" yd

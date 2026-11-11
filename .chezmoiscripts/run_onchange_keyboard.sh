#!/bin/sh
# Swap Caps Lock and left Control on the built-in keyboard only, as in Keyboard > Modifier Keys.
# Codes are HID usages offset by 0x700000000: Caps Lock = 0x39, left Control = 0xE0.
# Preference keys are <vendor>-<product>-0 in decimal; Macs without a built-in keyboard are skipped.
set -eu

[ "$(uname -s)" = Darwin ] || exit 0

# 0-0-0 is the HHKB BLE, which an earlier version of this script remapped by mistake.
defaults -currentHost delete -g com.apple.keyboard.modifiermapping.0-0-0 2>/dev/null || true

hidutil list --matching '{"PrimaryUsagePage":1,"PrimaryUsage":6}' |
  awk '$1 ~ /^0x/ && $NF == 1 { print $1, $2 }' | sort -u |
  while read -r vendor product; do
    defaults -currentHost write -g "com.apple.keyboard.modifiermapping.$(printf %d "$vendor")-$(printf %d "$product")-0" -array \
      '<dict><key>HIDKeyboardModifierMappingDst</key><integer>30064771296</integer><key>HIDKeyboardModifierMappingSrc</key><integer>30064771129</integer></dict>' \
      '<dict><key>HIDKeyboardModifierMappingDst</key><integer>30064771129</integer><key>HIDKeyboardModifierMappingSrc</key><integer>30064771296</integer></dict>'
  done

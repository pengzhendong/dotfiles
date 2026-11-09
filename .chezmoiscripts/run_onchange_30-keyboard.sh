#!/bin/sh
# Swap Caps Lock and left Control, as in Keyboard > Modifier Keys.
# Codes are HID usages offset by 0x700000000: Caps Lock = 0x39, left Control = 0xE0.
# The 0-0-0 suffix is the HHKB BLE, which reports no vendor/product ID over Bluetooth.
set -eu

[ "$(uname -s)" = Darwin ] || exit 0

defaults -currentHost write -g com.apple.keyboard.modifiermapping.0-0-0 -array \
  '<dict><key>HIDKeyboardModifierMappingDst</key><integer>30064771296</integer><key>HIDKeyboardModifierMappingSrc</key><integer>30064771129</integer></dict>' \
  '<dict><key>HIDKeyboardModifierMappingDst</key><integer>30064771129</integer><key>HIDKeyboardModifierMappingSrc</key><integer>30064771296</integer></dict>'

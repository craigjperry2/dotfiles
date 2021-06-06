#!/bin/zsh
#
# Set capslock as backspace without needing karabiner
# use hidutil property --get "UserKeyMapping" to validate
# see https://developer.apple.com/library/archive/technotes/tn2450/_index.html for other keys

# install only required once manually
if [[ $1 == "install" ]]; then
  echo "Installing login hook" > /dev/stderr
  sudo defaults write com.apple.loginwindow LoginHook "$0:A"
else
  # Designed to be run each time on on login
  hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x70000002A}]}'
fi


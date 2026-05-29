#!/bin/bash
# Temporary floating-window resize via System Events (AppleScript).
# TODO: replace with native `aerospace resize` when floating support ships
#       https://github.com/nikitabobko/AeroSpace/issues/9
#       https://github.com/nikitabobko/AeroSpace/pull/1156
# FIXME: resizes from top-left anchor only — left/up move the opposite edge, not that edge.

set -euo pipefail

direction="${1:?usage: resize-floating-window.sh left|right|up|down [delta]}"
delta="${2:-50}"

script_dir="$(cd "$(dirname "$0")" && pwd)"
osascript "$script_dir/resize-floating-window.applescript" "$direction" "$delta"

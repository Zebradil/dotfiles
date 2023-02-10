#!/usr/bin/env bash

polybar-msg cmd quit || killall -q polybar

# Launch the main bar
echo "---" | tee -a /tmp/polybar.log
polybar --reload 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."

#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch Polybar
polybar example 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."

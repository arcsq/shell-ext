#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Go To Next Space
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

tot=`yabai -m query --spaces | jq '. | length'`
cur=`yabai -m query --spaces --space | jq '.index'`
if [ $cur -lt $tot ]; then
  yabai -m window --space next
fi


#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Go To Previous Space
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

cur=`yabai -m query --spaces --space | jq '.index'`
if [ $cur -gt 1 ]; then
  yabai -m window --space prev
fi


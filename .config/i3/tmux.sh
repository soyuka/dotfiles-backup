#!/bin/bash

if tmux info &> /dev/null; then
  tmux attach-session
else
  tmux -u -2
fi

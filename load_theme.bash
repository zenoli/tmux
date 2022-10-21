#!/bin/bash
fallback_theme="onedark"
theme=$(cat "$XDG_CONFIG_HOME/tmux/.theme")
theme=${theme:-$fallback_theme}
tmux source "$XDG_CONFIG_HOME/tmux/themes/$theme.tmux"

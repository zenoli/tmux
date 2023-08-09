# ============================================
# == BINDINGS
# ============================================
bind-key -T copy-mode-vi C-j send-keys -X -N 5 scroll-down
bind-key -T copy-mode-vi C-k send-keys -X -N 5 scroll-up
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi r send-keys -X rectangle-toggle

bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "xclip -i -f -selection primary | xclip -i -selection clipboard"
bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"

# Set mouse scroll speed to 2 line
bind-key -T copy-mode-vi WheelUpPane send-keys -X -N 2 scroll-up
bind-key -T copy-mode-vi WheelDownPane send-keys -X -N 2 scroll-down

# Split windows
bind-key h split-window -c "#{pane_current_path}"
bind-key v split-window -h -c "#{pane_current_path}"
bind-key H split-window -f -c "#{pane_current_path}"
bind-key V split-window -f -h -c "#{pane_current_path}"

# Launch Ranger
bind-key -T prefix r switch-client -T ranger 
bind-key -T ranger h split-window     -c "#{pane_current_path}" "ranger ."
bind-key -T ranger H split-window -f  -c "#{pane_current_path}" "ranger ."
bind-key -T ranger v split-window -h  -c "#{pane_current_path}" "ranger ."
bind-key -T ranger V split-window -hf -c "#{pane_current_path}" "ranger ."
bind-key -T ranger r new-window  -c "#{pane_current_path}" -n "ranger" "ranger ."

# Launch Ranger
bind-key -T prefix l switch-client -T lf 
bind-key -T lf h split-window     -c "#{pane_current_path}" "lfrun"
bind-key -T lf H split-window -f  -c "#{pane_current_path}" "lfrun"
bind-key -T lf v split-window -h  -c "#{pane_current_path}" "lfrun"
bind-key -T lf V split-window -hf -c "#{pane_current_path}" "lfrun"
bind-key -T lf l new-window  -c "#{pane_current_path}" -n "lf" "lfrun"

# Launch Manpage
%hidden ZSH_FUNCTIONS="$XDG_CONFIG_HOME/zsh/functions.zsh"
bind-key -T prefix  m switch-client -T manpage 
bind-key -T manpage h command-prompt -p man "split-window  'source $ZSH_FUNCTIONS && m %1'"
bind-key -T manpage H command-prompt -p man "split-window -f 'source $ZSH_FUNCTIONS && m %1'"
bind-key -T manpage v command-prompt -p man "split-window -h 'source $ZSH_FUNCTIONS && m %1'"
bind-key -T manpage V command-prompt -p man "split-window -hf 'source $ZSH_FUNCTIONS && m %1'"
bind-key -T manpage m command-prompt -p man "new-window -n 'man %1' 'source $ZSH_FUNCTIONS && m %1'"

# Select pre-defined windows
bind-key -T prefix e switch-client -T window-selector
bind-key -T window-selector w select-window -t "vimwiki"
bind-key -T window-selector d select-window -t "dotfiles"

bind-key S set -w synchronize-panes
bind-key q display-panes -d 5000

bind-key = select-layout even-horizontal

# Resize panes
bind-key -n C-Down resize-pane -D 5
bind-key -n C-Up resize-pane -U 5
bind-key -n C-Left resize-pane -L 5
bind-key -n C-Right resize-pane -R 5

# Shift + Alt to switch windows
bind-key -n M-H previous-window
bind-key -n M-L next-window

# Swap windows
bind-key -r "<" swap-window -d -t -1
bind-key -r ">" swap-window -d -t +1

# Paste buffer
unbind C-p
bind-key C-p choose-buffer

# Reload tmux config
bind-key R source-file "$XDG_CONFIG_HOME/tmux/tmux.conf" \; display-message "Configuration reloaded"

# ============================================
# == VIM-TMUX NAVIGATOR
# ============================================

# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n 'M-h' if-shell "$is_vim" 'send-keys M-h'  'select-pane -L'
bind-key -n 'M-j' if-shell "$is_vim" 'send-keys M-j'  'select-pane -D'
bind-key -n 'M-k' if-shell "$is_vim" 'send-keys M-k'  'select-pane -U'
bind-key -n 'M-l' if-shell "$is_vim" 'send-keys M-l'  'select-pane -R'
tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
    "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
    "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

bind-key -T copy-mode-vi 'M-h' select-pane -L
bind-key -T copy-mode-vi 'M-j' select-pane -D
bind-key -T copy-mode-vi 'M-k' select-pane -U
bind-key -T copy-mode-vi 'M-l' select-pane -R
bind-key -T copy-mode-vi 'M-\' select-pane -l 

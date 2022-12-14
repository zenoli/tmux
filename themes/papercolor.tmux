# This tmux statusbar config was created by tmuxline.vim
# on Tue, 15 Jun 2021

set -g status-justify "left"
set -g status "on"
set -g status-left-style "none"
set -g message-command-style "fg=#e4e4e4,bg=#0087af"
set -g status-right-style "none"
set -g pane-active-border-style "fg=#e4e4e4"
set -g status-style "none,bg=#005f87"
set -g message-style "fg=#e4e4e4,bg=#0087af"
set -g pane-border-style "fg=#0087af"
set -g status-right-length "100"
set -g status-left-length "100"
setw -g window-status-activity-style "none"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#eeeeee,bg=#005f87"
set -g status-left "#[fg=#585858,bg=#e4e4e4] #S #[fg=#e4e4e4,bg=#005f87,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#0087af,bg=#005f87,nobold,nounderscore,noitalics]#[fg=#e4e4e4,bg=#0087af] %Y-%m-%d  %H:%M #[fg=#e4e4e4,bg=#0087af,nobold,nounderscore,noitalics]#[fg=#585858,bg=#e4e4e4] #h "
setw -g window-status-format "#[fg=#eeeeee,bg=#005f87] #I #[fg=#eeeeee,bg=#005f87] #W "
setw -g window-status-current-format "#[fg=#005f87,bg=#0087af,nobold,nounderscore,noitalics]#[fg=#e4e4e4,bg=#0087af] #I #[fg=#e4e4e4,bg=#0087af] #W #[fg=#0087af,bg=#005f87,nobold,nounderscore,noitalics]"

set -g pane-active-border-style fg=blue
set -g pane-border-style fg=#E4E4E4

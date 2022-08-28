# ============================================
# == PLUGINS
# ============================================

set-environment -g TMUX_PLUGIN_MANAGER_PATH $TMUX_PLUGINS

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'

run -b "$TMUX_PLUGINS/tpm/tpm"
set -g @resurrect-strategy-vim 'session'



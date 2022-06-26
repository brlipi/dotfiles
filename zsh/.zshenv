# Setting environment variables (only pager for now, maybe more such as path, editor and zdotdir in the future)
export EDITOR="vim"

# XDG Base Directory test
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"  Apparently, this change can break some DM's. Gotta check if SDDM breaks.
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# Make npmrc XDG Base Directory compliant
# export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

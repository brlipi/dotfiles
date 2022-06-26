# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt correct                                                   # Auto correct mistakes
setopt extendedglob                                              # Extended globbing. Allows using regular expressions with *
setopt rcexpandparam                                             # Array expansion with parameters
setopt nocheckjobs                                               # Don't warn about running processes when exiting
setopt numericglobsort                                           # Sort filenames numerically when it makes sense
setopt nobeep                                                    # No beep
setopt appendhistory                                             # Immediately append history instead of overwriting
setopt histignorealldups                                         # If a new command is a duplicate, remove the older one
setopt autocd                                                    # If only directory path is entered, cd there.
setopt inc_append_history                                        # Save commands are added to the history immediately, otherwise only when shell exits

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'        # Case insensitve tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"          # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                               # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache" # zcompcache is a dir or a file?

# History settings
# HISTFILE already set on .zshenv
HISTSIZE=2000
SAVEHIST=1000

WORDCHARS=${WORDCHARS//\/[&.;]}                                  # Don't consider certain characters part of the word

## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                                # Home key
bindkey '^[[H' beginning-of-line                                 # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
	bindkey "$$terminfo[khome]}" beginning-of-line                 # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                      # End key
bindkey '^[[F' end-of-line                                       # End key
if [[ "${terminfo[kend]}" != "" ]]; then
	bindkey "${terminfo[kend]}" end-of-line                        # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                   # Insert key
bindkey '^[[3~' delete-char                                      # Delete key
bindkey '^[[C' forward-char                                      # Right key
bindkey '^[[D' backward-char                                     # Left key
bindkey '^[[5~' history-beginning-search-backward                # Page Up key
bindkey '^[[6~' history-beginning-search-forward                 # Page Down key

# Navigate words with ctrl+arrow keys
bindkey '^[0c' forward-word                                      #
bindkey '^[0d' backward-word                                     #
bindkey '^[[1;5D' backward-word                                  #
bindkey '^[[1;5C' forward-word                                   #
bindkey '^H' backward-kill-word                                  # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                              # Shift+tab undo last section

# Sourcing alias file
if [ -f $XDG_CONFIG_HOME/zsh/.zsh/zshalias ]; then
    source $XDG_CONFIG_HOME/zsh/.zsh/zshalias
else
    print "404: $XDG_CONFIG_HOME/zsh/.zsh/zshalias not found."
fi

# Theming section
autoload -U compinit colors zcalc
compinit -d $XDG_CACHE_HOME/zsh/zcompdump/zcompdump-$ZSH_VERSION
colors

# Colors for non-powerlevel prompt
PROMPT="%B%{$fg[blue]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[red]%}%M %{$fg[cyan]%}%~%{$fg[blue]%}]%{$reset_color%}$%b "

# Color man pages for Less
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

# Add .local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"
# Add .cargo/bin to PATH
export PATH="$PATH:$HOME/.cargo/bin"

## Plugins section: Enable fish style features
# Use syntax hightlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history susbtring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# Use autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#_comp_options+=(globdots)		# To include hidden files

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

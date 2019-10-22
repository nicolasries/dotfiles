# General {{{

# set -eu

# vi keybindings in command line
bindkey -v

# autocompletion
autoload -U compinit promptinit
compinit
promptinit

# enable colors
autoload -U colors && colors 

# }}}

# FZF {{{

# add FZF keybindings to zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && . /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && . /usr/share/fzf/completion.zsh
# bindkey '^F' fzf-completion
# bindkey '^I' $fzf_default_completion

# }}}

# Aliases {{{

# dotfile management
# alias c='/usr/bin/git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME'

# edit shortcut
alias e="$EDITOR"
# workaround for terminal bug
alias ssh='TERM=xterm-256color ssh'
# docker ip address

# ls stuff
alias ls='ls --color=auto'
alias ll='ls -l'
alias l.='ls -a'

# less with smart case
alias less='less -i -R'

# colored grep
alias grep='grep --color'
# colored ls
# alias ls='ls --color'
# interactive and verboose
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -iv'
alias g='git'
alias calc='python -i -c "from math import *"'

alias pacin='sudo pacman -Syu'

alias upd='~/bin/check_system_updates.sh'
alias upgr='~/bin/upgrade_system.sh'

# always smart case
alias rg='rg --smart-case'

# alias sambamnt='sudo mount -v -t cifs -o credentials=~/.smbcred'

# }}}

# History {{{

export HISTFILE=~/.zsh_history
export HISTSIZE=5000                   # big history
export SAVEHIST=5000                   # big history
# setopt append_history           # append
# unsetopt hist_ignore_space      # ignore space prefixed commands
# setopt hist_reduce_blanks       # trim blanks
# setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
# setopt share_history            # share hist between sessions
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups     # no duplicate
setopt hist_ignore_space
# setopt hist_verify
# setopt inc_append_history
setopt share_history # share command history data

# }}}

# Prompt {{{

setopt prompt_subst
COLOR="blue"
export PROMPT="%F{$COLOR}%2~ λ %f"
export RPROMPT=""

# }}}

export PATH=$PATH:$HOME/go/bin
zsh_highlight="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source $zsh_highlight

# Functions {{{
function docker-ip {
    docker inspect --format "{{ .NetworkSettings.IPAddress }}" "$@"
}
# }}}

# pywal
# cat ~/.cache/wal/sequences

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


# fix?
export FZF_DEFAULT_OPTS="--extended --cycle --bind=\
ctrl-j:accept,ctrl-k:kill-line,tab:toggle-up,btab:toggle-down,\
ctrl-y:execute('echo {} | xclip -selection clipboard')+abort"

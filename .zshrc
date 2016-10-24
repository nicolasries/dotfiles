# General {{{


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

# edit shortcut
alias e=$EDITOR
# workaround for terminal bug
alias ssh='TERM=xterm-256color ssh'
# docker ip address
alias docker-ip='docker inspect --format "{{ .NetworkSettings.IPAddress }}" $@'

# colored grep
alias grep='grep --color'
# colored ls
alias ls='ls --color'
# interactive and verboose
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -iv'
alias g='git'
alias calc='python -i -c "from math import *"'
alias pacupgr='sudo pacman -Syu'

# alias sambamnt='sudo mount -v -t cifs -o credentials=~/.smbcred'

# }}}

# History {{{

HISTFILE=~/.zsh_history
HISTSIZE=1024                   # big history
SAVEHIST=1024                   # big history
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
[ -z $HOST_COLOR ] && HOST_COLOR="blue"
PROMPT='%F{$HOST_COLOR}%2~ > %f'
RPROMPT='%F{118} $(git rev-parse --abbrev-ref HEAD 2> /dev/null)%f%F{242} | %f%F{$HOST_COLOR}%m%f'

# }}}

export PATH=$PATH:$HOME/go/bin

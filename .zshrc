# General {{{

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
PATH=~/bin:$PATH

export COMPOSER_HOME="$XDG_CONFIG_HOME"/composer
export COMPOSER_CACHE_DIR="$XDG_CACHE_HOME"/composer

# Vim as standard editor
export EDITOR="nvim"
export VISUAL="nvim"

export BROWSER="firefox"

# vi keybindings in command line
bindkey -v

# autocompletion
autoload -U compinit promptinit
compinit
promptinit

# enable colors
autoload -U colors && colors 


#}}}

# FZF {{{

# add FZF keybindings to zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && . /usr/share/fzf/key-bindings.zsh
# ag as default source for fzf
# export FZF_DEFAULT_COMMAND='ag -g ""'
# export FZF_COMPLETION_TRIGGER=''
# bindkey '^F' fzf-completion
# bindkey '^I' $fzf_default_completion

# }}}

# Aliases {{{

# edit shortcut
alias e=$EDITOR
# workaround for terminal bug
alias ssh='TERM=xterm ssh'
# docker ip address
alias docker-ip='docker inspect --format "{{ .NetworkSettings.IPAddress }}" $@'

# colored grep
alias grep='grep --color'
# interactive and verboose
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -iv'

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
PROMPT="%F{blue}%2~ > %f"
RPROMPT='%F{118} $(git rev-parse --abbrev-ref HEAD 2> /dev/null)%f%F{242} | %f%F{blue}%m%f'

# }}}



# Aliases {

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

# alias sambamnt='sudo mount -v -t cifs -o credentials=~/.smbcred'

# }

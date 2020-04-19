# Environment Variables
export TERMINAL=termite
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

# GPG SSH
export GPG_TTY=(tty)
export SSH_AUTH_SOCK=(gpgconf --list-dirs agent-ssh-socket)
gpg-connect-agent updatestartuptty /bye > /dev/null

set fish_color_comment 808080
set fish_color_command ffffff
set fish_color_autosuggestion 88B9C2
set fish_color_quote D6C96B

# Aliasses
alias cls="tput reset"

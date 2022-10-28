# .bashrc

#############################
# Source global definitions #
#############################
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#########################
# Set custom CLI prompt #
#########################

# find what terminal emulator we're acutually using; $TERM is unreliable
TERM_EM="$(basename '/'$(ps -f -p $(cat /proc/$(echo $$)/stat | cut -d \  -f 4) | tail -1 | sed 's/^.* //'))"

if  which silver &> /dev/null &&
    [ $TERM_EM = "gnome-terminal-server" ] ||
    [ $TERM_EM = "lxterminal" ] ||
    [ $TERM_EM = "sakura" ]
then
    export user_at_host=$(echo "$USER@$(hostname -s)")
    source <(silver init)
else
    DIR_BLUE="\[$(tput setaf 33)\]"
    B="\[$(tput bold)\]"
    RESET="\[$(tput sgr0)\]"
    export PS1="${B}\u@\h${RESET} [${DIR_BLUE}\w${RESET}] \\$ "
fi

#######################################
# User specific aliases and functions #
#######################################

# set dotfiles alias for working with dotfiles git repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/.local/share/dotfiles.git --work-tree=$HOME'

# default to colored diff outputs
alias diff="diff --color=auto"

# default to follow symlinks with sshfs
alias sshfs="sshfs -o follow_symlinks"

# mkcd: change directories to the directory specified as $1, making new directories as needed
function mkcd() {
    mkdir -p "$1" && cd "$1"
}

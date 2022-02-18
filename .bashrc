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

# set VSCode alias and options
# Alias "code" to VSCode Insiders if available and set the user data dir and extensions dir to be more XDG-compliant

vscode_path="$(which code 2>/dev/null)"
vscode_opts=" \
--new-window \
--user-data-dir $HOME/.config/vscode \
--extensions-dir $HOME/.local/share/vscode/extensions \
"
vscode_insiders_path="$(which code-insiders 2>/dev/null)"
vscode_insiders_opts=" \
--new-window \
--user-data-dir $HOME/.config/vscode-insiders \
--extensions-dir $HOME/.local/share/vscode-insiders/extensions \
"

if [ -n "$vscode_insiders_path" ]; then
    if [ -n $vscode_path ]; then alias code-stable="$vscode_path $vscode_opts"; fi
    alias code="$vscode_insiders_path $vscode_insiders_opts"
elif [ -n "$vscode_path" ]; then
    alias code="$vscode_path $vscode_opts"
fi

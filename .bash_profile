# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Ensure the SSH Agent is running
[ -z "$SSH_AGENT_PID" ] && eval $(ssh-agent -s) > /dev/null

# User specific environment and startup programs

PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
export PATH

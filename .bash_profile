# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
export PATH

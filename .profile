
# When a "login shell" starts up, it reads the file "/etc/profile" 
# and then "~/.bash_profile" or "~/.bash_login" or "~/.profile" 
# (whichever one exists - it only reads one of these) 

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

if [ -f ~/.functions ]; then
  . ~/.functions
fi

if [ -d ~/profile.d ]; then
  for f in ~/profile.d/*; do
    source $f
  done
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Type some text, then use up and down arrows to search in history.
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

export PATH=/usr/local/sbin:/usr/local/bin:${PATH}
export PATH=$HOME/bin:$PATH
export PATH=$HOME/go/bin:$PATH

export HISTCONTROL=ignoredups
export HISTSIZE=100000
export HISTFILESIZE=1000000000
export HISTFILE="$HOME/.bash_history"
export SAVEHIST=$HISTSIZE
shopt -s histappend
stty -ixon # disable XON/XOFF - make Ctrl-s forward search work

# enable en_US locale w/ utf-8 encodings if not already configured
# by @rtomayko
: ${LANG:="en_US.UTF-8"}
: ${LANGUAGE:="en"}
: ${LC_CTYPE:="en_US.UTF-8"}
: ${LC_ALL:="en_US.UTF-8"}
export LANG LANGUAGE LC_CTYPE LC_ALL

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

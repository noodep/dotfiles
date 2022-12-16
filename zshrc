# path
export TEXLIVE_INSTALL="/usr/local/texlive/latest/"
export DENO_INSTALL="$HOME/.deno"
export BREW_INSTALL="/opt/homebrew"

export PATH="$DENO_INSTALL/bin:$BREW_INSTALL/bin:$TEXLIVE_INSTALL/bin/x86_64-darwin:$PATH:"

# enables ls colors
export CLICOLOR=1

# aliases
alias l="ls -al"
alias la="ls -a"
alias ll="ls -l"
alias ranger="/Library/Frameworks/Python.framework/Versions/Current/bin/ranger"
alias ctags="/usr/local/bin/ctags"

# enables case insensitive autocompletion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# enables autocompletion
autoload -U compinit
compinit

# enables vi-mode
bindkey -v

# prompt
PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;34m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} - %b%{\e[0;34m%}%B[%b%{\e[1;37m%}%~%{\e[0;34m%}%B]%b%{\e[0m%}%b%{\e[0m%}
%{\e[0;34m%}%B└─%B[%{\e[1;35m%}$%{\e[0;34m%}%B]%{\e[0m%}%b '


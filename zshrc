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
alias ..="cd .."
alias ...="cd ../.."
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
# enables prompt substitution
setopt PROMPT_SUBST

# loads built in vcs information module
autoload -Uz vcs_info

# enables %u unstaged and %c staged changes
zstyle ':vcs_info:*' check-for-changes true

# enables revision information %i
zstyle ':vcs_info:*' get-revision true

#
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' formats '%b %.8i %u%c'
zstyle ':vcs_info:*' actionformats '%b %.8i|%a %c%u'

precmd () { vcs_info }

PROMPT='%F{4}%B┌─[%b%F{2}%n%F{4}@%F{6}%m%B%F{4}] - [%b%F{7}%~%F{4}%B]%b ${vcs_info_msg_0_}
%F{4}%B└─[%b%F{5}$ %f%b'

# path
export TEXLIVE_INSTALL="/usr/local/texlive/latest/"
export DENO_INSTALL="$HOME/.deno"
export BREW_INSTALL="/opt/homebrew"

export PATH="$DENO_INSTALL/bin:$BREW_INSTALL/bin:$TEXLIVE_INSTALL/bin/universal-darwin:$PATH:"

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

# prompt
# enables prompt substitution
setopt PROMPT_SUBST

# loads builtin vcs module
autoload -Uz vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '⇑'
zstyle ':vcs_info:*' formats '(%b) %m %i %u%c'
zstyle ':vcs_info:*' actionformats '(%b|%a)%c%u'

# runs vcs_info before each prompt, populating `vcs_info_msg_0` to be used in `PROMPT`
precmd () { vcs_info }

PROMPT='%F{4}%B┌─[%b%F{2}%n%F{4}@%F{6}%m%B%F{4}] - [%b%F{7}%~%F{4}%B]%b ${vcs_info_msg_0_}
%F{4}%B└─[%b%F{5}$ %f%b'

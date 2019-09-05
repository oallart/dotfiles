# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local CURR_EXIT="$?"
    PS1=""

    # Colors
    local CLR_PLAIN='\[\033[00m\]'
    local LIGHT_BLUE='\[\033[0;36m\]'
    local BOLD_BLUE='\[\033[1;34m\]'
    local NORM_YELLOW='\[\033[40;0;33m\]'
    local NORM_PURPLE='\[\033[0;35m\]'
    local YELLOW='\[\033[33m\]'
    local WHITE='\[\033[0;37m\]'
    local NORM_RED='\[\033[0;31m\]'
    local BOLD_RED='\[\033[1;31m\]'
    local NORM_GREEN='\[\033[0;32m\]'
    # test with
    #PS1="something ${LIGHT_BLUE}Blue ${CLR_PLAIN}${NORM_BLUE}Blue ${NORM_YELLOW}Yellow ${NORM_PURPLE}purple ${TEST}what ${NORM_RED}red ${NORM_GREEN}green ${CLR_PLAIN} ~ "

    if [ $USER == root ]; then
        CURRUSER="${BOLD_RED}\u${CLR_PLAIN}"
    PROMPTCHAR="${BOLD_RED}# ${CLR_PLAIN}"
    else
        CURRUSER="${BOLD_BLUE}\u${CLR_PLAIN}"
    PROMPTCHAR="${CLR_PLAIN}$ "
    fi


    if [ $CURR_EXIT != 0 ]; then
        EXIT="${NORM_RED}${CURR_EXIT}${CLR_PLAIN}"
    else
        EXIT="${NORM_GREEN}${CURR_EXIT}${CLR_PLAIN}"
    fi

    # Building the prompt
    PS1=""
    PS1+="${LIGHT_BLUE}["    # [
    PS1+="${CURRUSER}"       # user
    PS1+="${LIGHT_BLUE}@"    # @
    PS1+="${YELLOW}\h"       # hostname
    PS1+="${NORM_PURPLE} \t" # time h:m:s
    PS1+="${LIGHT_BLUE}]["   # ][
    PS1+="$EXIT"             # return code, green if 0, red otherwise
    PS1+="${LIGHT_BLUE}]"    # ]
    PS1+="${WHITE} \w"       # current work dir
    PS1+="${YELLOW}$(parse_git_branch)" # Git Branch if applicable
    PS1+=" ${PROMPTCHAR}" # closing prompt char

    # old one 
    # PS1+="\[\033[0;36m\][\[\033[1;34m\]\u\[\033[0;36m\]@\[\033[40;0;33m\]\h\[\033[0;35m\] \t\[\033[0;36m\]][$EXIT]\[\033[0;37m\] \w\[\033[0m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
    
    # history trick
    history -a; history -c; history -r

}


# General aliases
alias v='vi'
alias vi='vim'
alias l='ls -l'
alias ls='ls --color'
alias ll='ls -al'
alias c='cat'
alias h='head'
alias t='tail'
alias sshn='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias vf='vim -o $(find . -type f)'
alias fv=vf
alias vo=vf
# Git
alias g=git
alias gs='git status'
alias gp='git push'
alias gca='git commit -a'
alias gcam='git commit --amend'
alias gcm='git commit --amend'
alias gc='git commit'
alias gd='git diff'
alias ga='git add'
alias gb='git branch'
#alias gch='git checkout'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gf='git fetch'
alias gr='git rebase'
alias gra='git rebase --autostash'
alias t=tig


# neat title in the bar
echo -ne "\033]0;${USER}@$(hostname -s)\007"

# More history tricks
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

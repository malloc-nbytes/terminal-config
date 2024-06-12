# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
        # Shell is non-interactive.  Be done now!
        return
fi

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[95m\]\h\[\e[0m\] \w (\[\e[93m\]${PS1_CMD1}\[\e[0m\]) = '

alias c='clear'
alias ls='ls -lah --color=auto'
alias syslog='tail -F /var/log/syslog'
alias ..='cd ..'
alias t='tmux'
alias nano='nano --syntax=none'
alias cs='code'
alias p='python3'

function go_back() {
    if [ -z $1 ]; then
      echo "Usage: cdd <number>"
      return
    fi

    local num=$1
    local dir=""
    for i in $(seq 1 $num); do
        dir="../$dir"
    done
    cd $dir
}

alias cdd=go_back

LS_COLORS=$LS_COLORS:'di=1;37:fi=3;33:' ; export LS_COLORS

# Removes syntax highlighting from `less`
unset LESSOPEN

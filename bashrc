# vim:fdm=marker
# basics#{{{

# export paths etc.#{{{

export EDITOR="vim"
export PYTHONPATH="/home/${USER}/lib/python"

# Exclude grepping through .svn folders.
# http://stefaanlippens.net/how_to_be_a_better_grepper
GREP_OPTIONS="--exclude-dir=\.svn"
export GREP_OPTIONS

# export paths etc.#}}}
# shopt settings#{{{

# append to the history file, don't overwrite it
shopt -s histappend

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# more shopt-options
shopt -s cdspell
shopt -s cmdhist
shopt -s expand_aliases
shopt -s extglob
shopt -s extquote
shopt -s force_fignore
shopt -s interactive_comments
shopt -s progcomp
shopt -s promptvars
shopt -s sourcepath
shopt -s checkwinsize

# shopt settings#}}}
# histcontrol#{{{

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL="ignoreboth"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTIGNORE="history:\
    cd:\
    cd\ \-:\
    cd\ \.\.:\
    clear:\
    cmus:\
    fg:\
    lst:\
    ls:\
    mutt:\
    muttb:\
    muttt:\
    vima:\
    vimb:\
    vv"

# histcontrol#}}}

# basics#}}}
# source external files#{{{

## source aliases
if [[ -f "/home/${USER}/.bash/aliases" ]]; then
    source "/home/${USER}/.bash/aliases"
elif [[ -f "/home/${USER}/.bash/tmux" ]]; then
    source "/home/${USER}/.bash/tmux"
elif [[ -f "/home/${USER}/.bash/colors" ]]; then
    source "/home/${USER}/.bash/colors"
elif ! shopt -oq posix; then
    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
    # sources /etc/bash.bashrc).
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        source "/usr/share/bash-completion/bash_completion"
    elif [ -f /etc/bash_completion ]; then
        source "/etc/bash_completion"
    fi
fi

# source external files#}}}
# other settings#{{{

# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# allow crontab access to my X display
xhost +local:zapata > /dev/null
# [[ $DISPLAY ]] && xhost +localhost:$LOGNAME
# [[ $DISPLAY ]] && xhost +local:$LOGNAME > /dev/null

# other settings#}}}

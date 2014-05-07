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

# allow crontab access to my X display
xhost +local:zapata > /dev/null
# [[ $DISPLAY ]] && xhost +localhost:$LOGNAME
# [[ $DISPLAY ]] && xhost +local:$LOGNAME > /dev/null

# other settings#}}}
# colorscheme and paths#{{{

# syntax-highlighting in less
# http://blog.tersmitten.nl/how-to-enable-syntax-highlighting-in-less.html
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"  # interferes with source-highlighting!

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color)
        color_prompt=yes
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
        ;;
    xterm*|rxvt*)
        # If this is an xterm set the title to user@host:dir
        # PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        PS1='${debian_chroot:+($debian_chroot)}[\t]@\h:\w\$ '
        # export TERM=xterm-256color
        ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

unset color_prompt force_color_prompt

# colorscheme and paths#}}}
# tmux #{{{

# Change the TERM environment variable (to get 256 colors) and make Vim
# connecting to X Server even if running in a terminal emulator (to get
# dynamic update of syntax highlight and Object Browser):
if [ "x$DISPLAY" != "x" ]
then
    if [ "screen" = "$TERM" ]
    then
        export TERM=screen-256color
    else
        export TERM=xterm-256color
    fi
    alias vim='vim --servername VIM'
    if [ "x$TERM" == "xxterm" ] || [ "x$TERM" == "xxterm-256color" ]
    then
        function tvim(){ tmux -2 new-session "TERM=screen-256color vim --servername VIM $@" ; }
    else
        function tvim(){ tmux new-session "vim --servername VIM $@" ; }
    fi
else
    if [ "x$TERM" == "xxterm" ] || [ "x$TERM" == "xxterm-256color" ]
    then
        function tvim(){ tmux -2 new-session "TERM=screen-256color vim $@" ; }
    else
        function tvim(){ tmux new-session "vim $@" ; }
    fi
fi

# sources tmux-plugin
if [[ -f "/home/${USER}/.vim/bundle/tmux-config/tmux-autwrite/autowrite-vim.sh" ]]; then
    # enable VIM autosaving
    # https://github.com/pivotal/tmux-config
    source ~/.vim/bundle/tmux-config/tmux-autowrite/autowrite-vim.sh
fi

# TMUX#}}}

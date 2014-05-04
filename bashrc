# sources

## source aliases
if [[ -f "/home/${USER}/.bash/aliases" ]]; then
    source "/home/${USER}/.bash/aliases"
fi


# sources tmux-plugin
if [[ -f "/home/${USER}/.vim/bundle/tmux-config/tmux-autwrite/autowrite-vim.sh" ]]; then
    # enable VIM autosaving
    # https://github.com/pivotal/tmux-config
    source ~/.vim/bundle/tmux-config/tmux-autowrite/autowrite-vim.sh
fi


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

# set colorscheme and paths
export TERM="xterm-256color" # Displaying 256 colors
export EDITOR="vim"
export PYTHONPATH="/home/${USER}/lib/python"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color)
        color_prompt=yes
    ;;
    xterm*|rxvt*)
        # If this is an xterm set the title to user@host:dir
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
esac

# Exclude grepping through .svn folders.
# http://stefaanlippens.net/how_to_be_a_better_grepper
GREP_OPTIONS="--exclude-dir=\.svn"
export GREP_OPTIONS

# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}[\t]@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# allow crontab access to my X display
xhost +local:zapata > /dev/null
# [[ $DISPLAY ]] && xhost +localhost:$LOGNAME
# [[ $DISPLAY ]] && xhost +local:$LOGNAME > /dev/null

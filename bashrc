# vim:fdm=marker
# export # #{{{

# env#{{{

# to have a universal /bin folder in ~
export PATH=~/bin:$PATH
#some helpful env vars
export PAGER='less'
export EDITOR='vim'
export VISUAL='vim'
export PYTHONPATH="/home/${USER}/lib/python"
export LS3=''

# env#}}}
# paths#{{{

export SEM="Sommer2014"
export UNI="/home/zapata/Unimaterialien"
export DOK="/home/zapata/Dokumente"
export LIX="$DOK/Linux"
export VOL="/media/zapata/Volume"
export USB="/media/zapata/ES02224159"

# paths#}}}
# histcontrol#{{{

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL="ignoreboth:ignoredups:erasedups"

# Preserve bash history in multiple terminal windows
# http://unix.stackexchange.com/a/48116
HISTSIZE=9000
HISTFILESIZE=$HISTSIZE

history() {
  _bash_history_sync
  builtin history "$@"
}

_bash_history_sync() {
  builtin history -a         #1
  HISTFILESIZE=$HISTSIZE     #2
  builtin history -c         #3
  builtin history -r         #4
}

PROMPT_COMMAND=_bash_history_sync

# Commands to ignore in history prompt
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
    hs:\
    v:\
    vv"

# histcontrol#}}}
# less#{{{

# ignorecase in search, status, no bell
# -I ignorecase
# -F text amounts lesser than one page are not shown
# -J status column at left edge of screen
# -m -M long prompt
# -N line numbers
# -n no line numbers
# -q quiet (no bell rung)
# -w hilite unread
#export LESS="-q -J -I" # DONT, else git log output is b/w...

# LESS COLORS FOR MAN PAGES
export LESS_TERMCAP_mb=$'\E[1;31m'                    # begin blinking
# CHANGE FIRST NUMBER PAIR FOR COMMAND AND FLAG COLOR
export LESS_TERMCAP_md=$'\E[1;32m'                    # begin bold... now Green
# CHANGE FIRST NUMBER PAIR FOR PARAMETER COLOR
export LESS_TERMCAP_us=$'\E[1;33m'                    # begin underline ... now Yellow
export LESS_TERMCAP_me=$'\E[0m'                       # end mode
export LESS_TERMCAP_se=$'\E[0m'                       # end standout-mode
export LESS_TERMCAP_so=$'\E[38m'                      # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'                       # end underline

# Colorcodes:
# Black       0;30     Dark Gray     1;30
# Red         0;31     Light Red     1;31
# Green       0;32     Light Green   1;32
# Brown       0;33     Yellow        1;33
# Blue        0;34     Light Blue    1;34
# Purple      0;35     Light Purple  1;35
# Cyan        0;36     Light Cyan    1;36
# Light Gray  0;37     White         1;37

#}}}
# start tmux#{{{


# This snippet checks if tmux is installed before trying to launch it. It also
# tries to reattach you to an existing tmux session at logout, so that you can
# shut down every tmux session quickly from the same terminal at logout.
# https://wiki.archlinux.org/index.php/tmux#Start_tmux_on_every_shell_login

# TMUX
if which tmux 2>&1 >/dev/null; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux
    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi

# start tmux#}}}

# export # #}}}
# source#{{{

# include aliases
source "/home/${USER}/.bash/aliases"      # ~/.bash/aliases

# source git-prompt shell script
source "/home/${USER}/.bash/git-sh-prompt"

# source#}}}
# prompt (PS1)#{{{

# PS1 - The value of this parameter is expanded (see PROMPTING below) and used
#       as the primary prompt string. The default value is \s-\v\$ .
# PS2 - The value of this parameter is expanded as with PS1 and used as the
#       secondary prompt string. The default is >
# PS3 - The value of this parameter is used as the prompt for the select
#       command
# PS4 - The value of this parameter is expanded as with PS1 and the value is
#       printed before each command bash displays during an execution trace. The
#       first character of PS4 is replicated multiple times, as necessary, to
#       indicate multiple levels of indirection. The default is +

# base layout:
# PS1='[\u@\H \W]\$'
# \e[37;40m\]       # equals 'white on black'
# \e[32;40m\]       # equals 'green on black'

# but background color can be omitted when using 1m font will be bold and further
# all non-printing chars (not part of base layout) should be enveloped in '\[ \]'...
# ... if it is not, strange errors may occur:

# deleting the prompt with backspace after having typed something?
# afterwards use '\[\e[0m\]' to reset things for following line...

# Black       30;0m     Dark Gray     30;1m
# Blue        34;0m     Light Blue    34;1m
# Green       32;0m     Light Green   32;1m
# Cyan        36;0m     Light Cyan    36;1m
# Red         31;0m     Light Red     31;1m
# Purple      35;0m     Light Purple  35;1m
# Brown       33;0m     Yellow        33;1m
# Light Gray  37;0m     White         37;1m

# This will limit the path to 30 characters.
# http://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html#comment-143559
PROMPT_COMMAND='if [ ${#PWD} -gt 30 ]; then myPWD=${PWD:0:8}...${PWD:${#PWD}-19}; else myPWD=$PWD; fi'

# show # of tmux-pane in bashprompt
# http://superuser.com/a/385890/322005
tmux_winidx() {
    local winidx=$(tmux display-message -p '#{pane_id}')
    [ -n $TMUX ] && echo " $winidx "
}

# set a fancy prompt (non-color, unless we know we "want" color)
# we add an additional *git* variable to show status of branches $(__git_ps1)
case "$TERM" in
    xterm-color)
        color_prompt=yes
        # If this is an xterm-color set the title to user@host:dir
        # PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$ "
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
        ;;
    xterm*|rxvt*)
        PS1='\[\e[31;1m\]['
        PS1+='\[\e[32;1m\]\u'
        PS1+='\[\e[32;1m\]@'
        PS1+='\[\e[36;1m\]$(tmux_winidx)'
        PS1+='\[\e[35;1m\]$(__git_ps1 "[%s] ")'
        PS1+='\[\e[32;1m\]$myPWD'
        PS1+='\[\e[31;1m\]]'
        PS1+='\[\e[36;1m\]\$ '
        PS1+='\[\e[0m\]'
        export TERM=xterm-256color
        ;;
esac
export PS1="$PS1"

# Add additional options for git-prompt in shell
# http://alblue.bandlem.com/2011/07/git-tip-of-week-autocompletion-in.html
export GIT_PS1_SHOWDIRTYSTATE=true        # will show a * if there are unstaged and + if there are staged (but uncommitted) changes
export GIT_PS1_SHOWSTASHSTATE=true        # will show a $ if there are stashed files
export GIT_PS1_SHOWTRACKEDFILES=true      # will show a % if there are tracked files
export GIT_PS1_SHOWUPSTREAM=auto          # will show a = if you are at the same commit, < if you are behind, >
                                          # if you are ahead and <> if you have diverged from the upstream branch.

# prompt (PS1)#}}}
# bash completion#{{{

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        source "/usr/share/bash-completion/bash_completion"
    elif [ -f /etc/bash_completion ]; then
        source "/etc/bash_completion"
    fi
fi

#}}}
# grep#{{{

# Exclude grepping through .svn folders.
# http://stefaanlippens.net/how_to_be_a_better_grepper
GREP_OPTIONS="--exclude-dir=\.svn"
export GREP_OPTIONS

#}}}
# shopt #{{{

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

# shopt #}}}
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

# color --auto # {{{

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -A --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# }}}
# syntax-highlighting in less#{{{

# http://blog.tersmitten.nl/how-to-enable-syntax-highlighting-in-less.html
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# syntax-highlighting in less#}}}
# colored prompt#{{{

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
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

# colored prompt#}}}

# colorscheme and paths#}}}

# eval $(ssh-agent|\grep -v echo)
# ssh-add > /dev/null

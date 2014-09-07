" to check for errors, enter 'exit' before the suspected line. This makes vim
" finish reading your vimrc before EOF.
" File: .vimrc
" Author: Jonas Petong
" Description: Please feel free to fork my vimrc!!!
" Last Modified: Januar 04, 2014

" Neovim for Python
if has('neovim')
    " let s:python_host_init = 'python -c "import neovim; neovim.start_host()"'
    let s:python_host_init = 'python2 -c "import neovim; neovim.start_host()"'
    let &initpython = s:python_host_init
endif

" set env VIMRC="/home/zapata/.vim"

" This source imports all of my general settings. Indent, hilight, etc.
source $HOME/.vim/vimrc_general
" This source sets Colorscheme etc.
source $HOME/.vim/vimrc_colors
" This source imports all plugins
source $HOME/.vim/vimrc_plugs
" This source imports all of my plugin settings and bindings.
source $HOME/.vim/vimrc_mappings
" This source sets mutt configs
source $HOME/.vim/vimrc_mutt

" This source sets R configs
source $HOME/.vim/ftplugin/r.vim
" This source sets LaTeX configs
source $HOME/.vim/ftplugin/tex.vim

"------------------
" Xterm-Style-Keys
"------------------
" let Vim automatically recognize xterm-style modified keys
" found at http://unix.stackexchange.com/a/58469/34158
if &term !~ '^gnome'
    " execute "set <xUp>=\e[1;*A"
    " execute "set <xDown>=\e[1;*B"
    " execute "set <xRight>=\e[1;*C"
    " execute "set <xLeft>=\e[1;*D"
    " execute "set <xHome>=\e[1;*H"
    " execute "set <xEnd>=\e[1;*F"
    " execute "set <PageUp>=\e[5;*~"
    " execute "set <PageDown>=\e[6;*~"
    execute "set <F1>=\eOP"
    execute "set <F2>=\eOQ"
    execute "set <F3>=\eOR"
    execute "set <F4>=\eOS"
    execute "set <xF1>=\eO1;*P"
    execute "set <xF2>=\eO1;*Q"
    execute "set <xF3>=\eO1;*R"
    execute "set <xF4>=\eO1;*S"
    execute "set <F5>=\e[15;*~"
    execute "set <F6>=\e[17;*~"
    execute "set <F7>=\e[18;*~"
    execute "set <F8>=\e[19;*~"
    execute "set <F9>=\e[20;*~"
    execute "set <F10>=\e[21;*~"
    execute "set <F11>=\e[23;*~"
    execute "set <F12>=\e[24;*~"
endif

" Lines added by the Vim-R-plugin command :RpluginConfig (2014-Jul-16 09:45):
" Force Vim to use 256 colors if running in a capable terminal emulator:
" if &term =~ "xterm" || &term =~ "256" || $DISPLAY != "" || $HAS_256_COLORS == "yes"
"     set t_Co=256
" endif

# About

Config files for various tools I use, such as
[vim](http://www.vim.com/),
[bash](http://tiswww.case.edu/php/chet/bash/bashtop.html) and
[git](http://git-scm.com/).

The actual filenames don't include the leading dot. This is for
visibility and it's slightly more convenient managing the files with git
that way. It's very unlikely that anyone will want to use this directly;
the more interesting directories are:

* [bashrc](bashrc) - configuration and startup files for bash shell.
* [bash/aliases](bash/aliases) - my personal shell aliases.
* [vim/vimrc_mappings](vim/vimrc_mappings) - all of my personalized vim
  keybinds.
* [gitconfig](gitconfig) - add slightly more sophisticated shortcuts for
  git commands. These aliases are to be used together with
`command_not_found()` function in my [bashrc/aliases](bash/aliases). It
basically works like this (it's weird as first but makes absolute sense,
especially when using together with a customized version of my
[gitconfig](gitconfig)):

```sh

command_not_found_handle() {
    g*) git ${1#g} "${@:2}"
        return 0
        ;;
    esac

}

# If nothing else works, just do what bash would have done
printf "%s: command not found\n" "$1" >&2 return 127

```

The function lets you call predefined snippet-commands from the
Command-Line, which makes spaces after a command obsolete. This means
you may call `git` while the function automatically parses all trailing
characters as arguments.

As an example you could define the letter `p` as an alias for the `push
origin master` command in your ~/.gitconfig. Then call it by executing
`gp` in a command line of your choice, it's simple as that!

# Author
 In case you find any issues I'd be happy you get in contact at
:octocat:

< emzap79 [at] gmail [dot] com >

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
* [gitconfig](gitconfig) - add slightly more sophisticated shortcuts for git
  commands (see description!).

## More Sophisticated Github Aliases

My [Github Aliases](gitconfig) become especially handy when using together with
the `command_not_found_handle()` function represented below. It basically lets
you call `git-aliases` from the command-line as a on string command. This makes
spaces obsolete when calling multiple argument commands like `git add -A .` or
`git push origin`.

It may sound weird at first but makes things incredibly more easy on a daily
base level, especially when talking about `github's` rather complex command
strings.

### Bashrc Function

Just add the following snip of code to your [bashrc](bashrc):

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

### Description

This code alone lets you call execute `git commit` by simply typing: `gcommit`.
It saves you the inconvenience of hitting two characters ('it') and a space
every time you call git's `commit` command. But it gets even better!

As an example you could define the letter `p` as an alias for `push origin
master` in your ~/.gitconfig by adding a new line: `p = push origin`. Then call
it by executing `gp` from your shell, and it'll trigger your previously defined
alias from within the config file. Just as you would expect `git push` to work,
your commited changes now will be pushed to `origin/master`.

Remember: `g` is automatically getting replaced by `git` because of your
`command_not_found_handle` function, as simple as that!

# Author
In case you find any issues I'd be happy you get in contact:

< emzap79 [at] gmail [dot] com >

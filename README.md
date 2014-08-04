# About

Config files for various tools I use, such as
[vim](http://www.vim.com/),
[bash](http://tiswww.case.edu/php/chet/bash/bashtop.html) and
[git](http://git-scm.com/).

It's very unlikely that anyone will want to use this directly;
the more interesting directories are:

* [bashrc](bashrc) - configuration and startup files for bash shell.
* [bash/aliases](bash/aliases) - my personal shell aliases.
* [vim/vimrc_mappings](vim/vimrc_mappings) - all of my personalized vim
  keybinds.
* [gitconfig](gitconfig) - add slightly more sophisticated shortcuts for git
  commands (see description!).

The actual filenames don't include the leading dot. This is for visibility and
it's slightly more convenient managing the files with git that way. 

## More Sophisticated Github Aliases

My [github aliases](gitconfig) become especially handy when using together with
the `command_not_found_handle()` function described below. It basically lets
you call `git-aliases` from the command-line as a one word command. This makes
spaces obsolete when calling multiple argument commands like `git add -A .` or
`git push origin`.

It may sound weird at first but makes things incredibly more easy on a daily
base level, especially when talking about Github's rather complex command and
subcommand strings.

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

This code alone lets you trigger `git commit` by simply typing: `gcommit`. It
saves you the inconvenience of hitting two characters ('it') and a space every
time you call git's `commit` command. But it gets even better!

As an example you could define the letter `p` as an alias for `push origin
master` in your ~/.gitconfig. Just add a new line: `p = push origin master`.
Then call it as `gp` out off of your terminal, and it'll call your previously
defined alias, as simple as that! Just as you would expect `git push` to work,
your commited changes now will be pushed to `origin/master`.

Remember: `g` is automatically getting replaced with `git` because of your
`command_not_found_handle` function. You could even expand that function to
other commands (refer to my [bash/aliases](bash/aliases) for further examples).

Warrant: Obviously this is more a *hack* than a proven \*.nix shell operation.
You should check all possible command names first before setting a new one. If
you'd define an github alias

``` sh
s = show
```
it surely enough would interfere with *ghostscript*'s short abbreviation: `gs`.
Just rename your alias then to e.g. `sh = show`.

# Author
In case you find any issues I'd be happy you get in contact:

< emzap79 [at] gmail [dot] com >

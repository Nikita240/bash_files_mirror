# Bash files

This is a "bash files" Project for Linux, which also works on OS X when using the [GNU coreutils](https://www.gnu.org/software/coreutils/coreutils.html) (see installation instructions). The project grew out of a few personal tweaks and additions that extended over time.

It's called `bash_files` even if the main component consists of a "Start Screen" with infos since it also includes further helpful things such as aliases, history, window title configuration and a nice bash prompt. Check out the feature list below or have a look at the source for more information.

##### Inspiration
Inspiration was taken from [oh-my-zsh
](https://github.com/robbyrussell/oh-my-zsh/tree/master/lib), [bash-it](https://github.com/revans/bash-it) and many other small tweaks, improvements and dotfiles projects. While many features where availble, they weren't in a form that was suitable for my personal needs, which is why I created `bash_files`.

##### Current status
`bash_files` is a work in progress project, everything is a bit quick and dirty. Nevertheless, major features should be pretty stable.

Feel welcome to contribute, reuse, clone, ...

-binaryanomaly

<br>
---

#### Screenshot
The version from 15.03.2015 looks like this:

![Bash_files start screen](http://i.imgur.com/2D5fg2D.png "Bash_files start screen")

<br>
---
<br>

#### Last updates

... 05.09.2015
- Many small corrections and additions

<br>
---
<br>


#### Feature list

##### Generic features
 - Config vars for features
 - OS type detection support for Linux and OS X
 - Cross-platform robust checks
 - Aliases


##### Start screen - Info sections
 - Hostname (figlets, lolcat supported)
 - CPU, RAM info
 - Distribution info
 - External (public) IP
 - SSH connection info
 - System info (kernel, architecture)
 - File system info
 - Last logins
 - Random bash comand info (whatis)
 - Reboot required check and message on welcome screen and/or in prompt

Most sections can be turned on and off in `config/config.sh`

#### Functions
 - **extip** - Display external (public) ip using dig/opendns
 - **colors** - Display the 256 colors/nr that can be used with bash

<br>
---
<br>


### Installation instructions

Clone the repository into your home directory, it will create the `.bash_files` subdirectory:

```bash
git clone https://github.com/binaryanomaly/bash_files ~/.bash_files
```


#### Invoke init file from .bash_profile

Add the following to the end of your `.bash_profile` in your home directory:

```bash
# .bash_files initialization
if [ -f ~/.bash_files/init.sh ]; then
    . ~/.bash_files/init.sh
fi
```

We put this in `.bash_profile` and not .bashrc because we only want it to be executed when bash is executed i.e. a user is logging in - aka login shell.
Therefore it may be necessary on Linux to enable an option such as "Run command as a login shell" so that the `.bash_profile` file is considered.

#### OS X

1. Install [homebrew](http://brew.sh)
2. Install coreutils ```brew install coreutils``` to use the more up to date linux coreutils

#### Dependencies

The following Standard Linux commands are needed:

- `dig` to determine the public ip via opendns
- `free` for ram info
- `df` for diskspace info
- `last` for last logins
- `whatis` for command related infos


#### Optional dependencies

The following optional packages are recommended to be installed:

- `figlet` for big ascii letter hostname
- `lolcat` to colorize the ascii letter hostname

Install them using apt (Linux) or homebrew (Mac)

The script will autodetect if each of those is installed and disable the features if not found.



<br>
---
<br>

### Directory and file structure

The project lives in `~/.bash_files/`

| Directory | Description |
| ---- | ----------- |
| aliases/  | Directory for alias definitions - `*aliases.sh` gets sourced |
| config/  | Directory for config files - `*config.sh` gets sourced |
| lib/ | Directory where base functionality is stored - `base*.sh` gets sourced |

<br>


| File | Description |
| ---- | ----------- |
| init.sh  | Init file that sources all the other dirs/files |

<br>
---
<br>

### Conventions

 - Use `_bf_` prefix for variable names

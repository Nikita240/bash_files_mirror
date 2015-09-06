# Bash startscreen

The project is in progress of refactoring to become modular parts

- Startscreen
- Theme (prompt)
- Aliases
- Other plugins

The goal is to migrate those features to [bash-it](https://github.com/Bash-it/bash-it)

-binaryanomaly

<br>
---

#### Screenshot
The version from 15.03.2015 looks like this:

![Bash_files start screen](http://i.imgur.com/2D5fg2D.png "Bash_files start screen")

<br>
---
<br>


#### Feature list

##### Generic features
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


#### Functions
 - **extip** - Display external (public) ip using dig/opendns
 - **colors** - Display the 256 colors/nr that can be used with bash

<br>
---
<br>


### Installation instructions

Clone the repository into your home directory, it will create the `.bash_files` subdirectory:

```bash
git clone https://github.com/binaryanomaly/bash_startscreen ~/.bash_startscreen
```


#### Invoke init file from .bash_profile

Add the following to the end of your `.bash_profile` in your home directory:

```bash
# .bash_startscreen initialization
if [ -f ~/.bash_startscreen/init.sh ]; then
    . ~/.bash_startscreen/init.sh
fi

# invoke .bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
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
- `fortune-mod` for fortune telling

Install them using apt (Linux) or homebrew (Mac)

The script will autodetect if each of those is installed and automatically disable the features if not found.

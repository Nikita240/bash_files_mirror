#!/bin/bash


function _set_ls_aliases()
{
	# Original Source: http://tldp.org/LDP/abs/html/sample-bashrc.html

	# # Add colors for filetype and  human-readable sizes by default on 'ls':
	#alias ls='ls --color'
	alias lx='ls -lXB --color'         #  Sort by extension.
	alias lk='ls -lSr --color'         #  Sort by size, biggest last.
	alias lt='ls -ltr --color'         #  Sort by date, most recent last.
	alias lc='ls -ltcr --color'        #  Sort by/show change time,most recent last.
	alias lu='ls -ltur --color'        #  Sort by/show access time,most recent last.

	# # The ubiquitous 'll': directories first, with alphanumeric sorting:
	alias ll="ls -lv --group-directories-first --color"
	alias lm='ll |more'        #  Pipe through 'more'
	alias lr='ll -R'           #  Recursive ls.
	alias la='ll -A'           #  Show hidden files.
	alias tree='tree -C'    #  Nice alternative to 'recursive ls' ...
}

_set_ls_aliases


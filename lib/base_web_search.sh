#!/bin/bash
#

# ------------------------------------------------------------------------------
# Open web browser with passed on url
# Usage: _open "$1"
# Param: $1  Url
# ------------------------------------------------------------------------------
#
_open()
{
	if [[ -x $(which xdg-open) ]]; then
		xdg-open $1 >nul 2>&1
	else
		error_exit "xdg-open not found!"
	fi
}


google()
{
	local url=https://www.google.com/search?q="$1"
	_open "$url"
}


wiki()
{
	local url=http://en.wikipedia.org/w/index.php?search="$1" 
	_open "$url"
}

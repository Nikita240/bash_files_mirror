#!/bin/bash
#
#

# ------------------------------------------------------------------------------
#
# Printf helper functions
# -----------------------
#
# Provides the following functions:
# - Print line _print_line()
# - Print ASCII art _print_ascii_art()
# - Print ASCII art with lolcat coloring _print_ascii_art_lolcat()
# - Print a string centered related to terminal width _print_centered_string()
# - Print a multiline string centered related to terminal width
#   where the longest string is considered for determining the offset
#   _print_centered_multiline()
# - Print string with a fixed offset _print_fixed_singleline() as a helper
#   function for _print_centered_multiline()
#
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
# Print a 80 char - line
# Usage: _print_line
# ------------------------------------------------------------------------------
#
_print_line()
{
    # 80 chars line
    local line="--------------------------------------------------------------------------------"
    
    printf "${GREY}"
    _print_centered_string "$line" "0"
    printf "\n"
}

# ------------------------------------------------------------------------------
# Print a string centered with figlet
# Usage: _print_ascii_art "$1"
# Param: $1  String variable to print
# ------------------------------------------------------------------------------
#
_print_ascii_art()
{
    if [[ -x $(which figlet) ]]; then
        printf "%s\n" "$1" | figlet -w $COLUMNS -c
        printf "${ORANGE}"
        _print_centered_string "$2"
    else
        error_exit "figlet not found!\n"
    fi
}


# ------------------------------------------------------------------------------
# Print a string centered with figlet and lolcat coloring
# Usage: _print_ascii_art_lolcat "$1"
# Param: $1  String variable to print
# ------------------------------------------------------------------------------
#
_print_ascii_art_lolcat()
{
    { printf "%s\n" "$1" | figlet -w $COLUMNS -c ; _print_centered_string "$2" ; } | lolcat -S 550
}


# ------------------------------------------------------------------------------
# Print a string, centered on the terminal
# Usage: _print_centered_string "$1"
# Param: $1  String variable to print
# ------------------------------------------------------------------------------
#
_print_centered_string()
{
    local c_string="$1"
    local len_c_string="${#c_string}"
    local t_width="$(tput cols)"
    local c_sum=$((len_c_string+t_width))
    local mid=$((c_sum/2))
    local leftspace=$((${mid}-${#c_string}))

    # printf "%s\n" "len_c_string: $len_c_string"
    # printf "%s\n" "t_width: $t_width"
    # printf "%s\n" "c_sum: $c_sum"
    # printf "%s\n" "mid: $mid"
    # printf "%s\n" "leftspace: $leftspace"
    printf "%-*s%s\n" $leftspace " " "$c_string"
}


# ------------------------------------------------------------------------------
# Print a multlinestring, centered on the terminal where the longest line is
# determining the offset
# Usage: _print_centered_multiline "$1"
# Param: $1  Multiline string variable to print
# Param: $2  Fixed offset (optional)
# ------------------------------------------------------------------------------
#
_print_centered_multiline()
{
    local c_longest=0
    local t_width="$(tput cols)"

    
    # Find longest string
    while IFS= read -r line
    do
        # Store length
        if [ ${#line} -gt $c_longest ]; then
            c_longest="${#line}"
        fi
    done <<< "$1"

    # Apply offset if provided
    if [[ ! -z "$2" ]]; then

        local offset=$2
        local c_longest=$(($c_longest-$offset))

    fi

    local c_sum=$((c_longest+t_width))
    local c_mid=$((c_sum/2))
    local c_leftspace=$((c_mid-c_longest))


    # Print each line with offset of longest string
    while IFS= read -r line
    do
        printf "%-*s%s\n" $c_leftspace " " "$line"

    done <<< "$1"

    strlen=0
}

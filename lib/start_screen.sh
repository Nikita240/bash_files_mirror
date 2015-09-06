#!/bin/bash
#

# ############################################################################ #
#                                                                              #
# Change order of sections etc. below                                          #
#                                                                              #
# ############################################################################ #

startscreen()
{
  _print_hostname
  _print_cpuram
  _print_kernel
  _print_distro
  _print_ext_ip
  _print_ssh_status

  _print_line
  _print_diskstats

#  _print_line
#  _print_lastlogins

#  _print_line
#  _print_random_cmdinfo

  _bf_fortune
}


# Start screen bling bling
local _bf_figlet_on="1"
local _bf_lolcat_on=


# Launch Startscreen
clear
startscreen
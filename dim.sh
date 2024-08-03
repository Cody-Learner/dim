#!/bin/bash
# Monitor brightness setting script: dim-12/19/2020
# Program used       : ddcutil
# Kernel modules used: i2c-dev
# Setup: http://www.ddcutil.com/i2c_permissions/
# Notes & man page: $ manl ddcutil

# Unset unavailable optionions (positional parameter) so options are diasplayed.

	[[ $1 != -1 ]] && \
	[[ $1 != -3 ]] && \
	[[ $1 != -5 ]] && \
	[[ $1 != -7 ]] && \
	[[ $1 != -9 ]] && \
	[[ -n $1 ]] && set --

# Display options upon calling script w/o options

	[[ -z $1 ]] &&
echo "  Script path: $(which dim)
  Settings   : $(echo ~/.cache/dim)

  Monitor brightness control
  Usage: dim [-1 -3 -5 -7 -9]

  -1  Dim	Monitor
  -3  D/M	Monitor
  -5  Mid	Monitor
  -7  M/B	Monitor
  -9  Bright	Monitor

$(cat ~/.cache/dim 2>/dev/null)
"
#                                            Property:      Bright:  Contrast:	Blue:

	[[ $1 == -1 ]] &&	ddcutil setvcp 10		00				&& \
			 	ddcutil setvcp 12			01			&& \
			 	ddcutil setvcp 1a				00		&& \

	printf 'Current Settings : 1 \nBrightness : 00%% \nContrast   : 01%% \nBlue       : 00%% \n' | tee /dev/tty >~/.cache/dim

	[[ $1 == -3 ]] &&	ddcutil setvcp 10		12				&& \
			 	ddcutil setvcp 12			25			&& \
			 	ddcutil setvcp 1a				00		&& \

	printf 'Current Settings : 3 \nBrightness : 10%% \nContrast   : 25%% \nBlue       : 00%% \n' | tee /dev/tty >~/.cache/dim

	[[ $1 == -5 ]] &&	ddcutil setvcp 10		25				&& \
			 	ddcutil setvcp 12			50			&& \
			 	ddcutil setvcp 1a				00		&& \

	printf 'Current Settings : 5 \nBrightness : 25%% \nContrast   : 50%% \nBlue       : 00%% \n' | tee /dev/tty >~/.cache/dim

	[[ $1 == -7 ]] &&	ddcutil setvcp 10		50				&& \
			 	ddcutil setvcp 12			50			&& \
			 	ddcutil setvcp 1a				10		&& \

	printf 'Current Settings : 7 \nBrightness : 50%% \nContrast   : 50%% \nBlue       : 10%% \n' | tee /dev/tty >~/.cache/dim

	[[ $1 == -9 ]] &&	ddcutil setvcp 10		50				&& \
			  	ddcutil setvcp 12			50			&& \
			  	ddcutil setvcp 1a				50		&& \

	printf 'Current Settings : 9 \nBrightness : 50%% \nContrast   : 50%% \nBlue       : 50%% \n' | tee /dev/tty >~/.cache/dim




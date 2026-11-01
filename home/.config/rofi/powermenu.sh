#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x

# CMDs
uptime="$(uptime -p | sed -e 's/up //g')"

# Options
shutdown='󰐥'
reboot='󰜉'
lock=''
suspend=''
logout='󰍃'

# Rofi CMD
rofi_cmd() {
	# pkill rofi
	rofi -dmenu \
		-p "" \
		-mesg "Uptime: $uptime" \
		-theme "$HOME/.config/rofi/themes/powermenu.rasi"
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$shutdown\n$reboot\n$lock\n$suspend\n$logout" | rofi_cmd
}

# Execute Command
run_cmd() {
	case $1 in
		--shutdown)
			if [[ -x '/usr/bin/systemctl' ]]; then
				systemctl poweroff --no-wall
			elif [[ -x '/usr/bin/loginctl' ]]; then
				loginctl poweroff
			else
				pkexec poweroff
			fi
			;;
		--reboot)
			if [[ -x '/usr/bin/systemctl' ]]; then
				systemctl reboot --no-wall
			elif [[ -x '/usr/bin/loginctl' ]]; then
				loginctl reboot
			else
				pkexec reboot
			fi
			;;
		--lock)
			if [[ -x '/usr/bin/hyprlock' ]]; then
				hyprlock
			elif [[ -x '/usr/bin/swaylock' ]]; then
				swaylock
			elif [[ -x '/usr/bin/betterlockscreen' ]]; then
				betterlockscreen -l
			elif [[ -x '/usr/bin/i3lock' ]]; then
				i3lock
			fi
			;;
		--suspend)
			mpc -q pause
			# amixer set Master mute
			if [[ -x '/usr/bin/systemctl' ]]; then
				systemctl suspend
			elif [[ -x '/usr/bin/loginctl' ]]; then
				loginctl suspend
			fi
			;;
		--logout)
			if uwsm check is-active; then 
				uwsm stop
			else
				case "$DESKTOP_SESSION" in
					mango)
						mmsg dispatch quit
						;;
					hyprland)
						hyprctl dispatch 'hl.dsp.exit()'
						;;
					sway)
						swaymsg exit
						;;
					openbox)
						openbox --exit
						;;
					bspwm)
						bspc quit
						;;
					i3)
						i3-msg exit
						;;
					plasma)
						qdbus org.kde.ksmserver /KSMServer logout 0 0 0
						;;
					*)
						pkill "$DESKTOP_SESSION"
				esac
			fi
			;;
	esac
}

# Actions
chosen="$(run_rofi)"
case "${chosen}" in
    "${shutdown}")
		run_cmd --shutdown
        ;;
    "${reboot}")
		run_cmd --reboot
        ;;
    "${lock}")
    	run_cmd --lock
        ;;
    "${suspend}")
		run_cmd --suspend
        ;;
    "${logout}")
		run_cmd --logout
        ;;
esac

dir="~/.config/polybar/scripts/rofi"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
suspend="⏾ Sleep"
logout=" Logout"

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
		systemctl poweroff
        	;;
    $reboot)
		systemctl reboot
        	;;
    $lock)
		i3lock -i ~/.config/lockscreen.png
       		;;
    $suspend)
		systemctl suspend
        	;;
    $logout)
		i3-msg exit
        	;;
	*)
esac

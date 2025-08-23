#!/usr/bin/env zsh

# Uptime and host
uptime="$(uptime -p | sed -e 's/up //g')"
host="$(hostname)"

# Options
shutdown='Shutdown '
reboot='Reboot '
lock='Lock 󰌾'
suspend='Suspend 󰒲'
logout='Logout 󰍃'
yes='Yes '
no='No '

# Wofi dmenu wrapper
wofi_cmd() {
    wofi --dmenu --prompt "Uptime: $uptime"
}

# Confirmation menu
confirm_cmd() {
    echo -e "$yes\n$no" | wofi --dmenu --prompt "Are you sure?"
}

# Main menu
run_wofi() {
    echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | wofi_cmd
}

# Run actions with confirmation
run_cmd() {
    selected="$(confirm_cmd)"
    if [[ "$selected" == "$yes" ]]; then
        case "$1" in
            --shutdown)
                systemctl poweroff
                ;;
            --reboot)
                systemctl reboot
                ;;
            --suspend)
                mpc -q pause
                amixer set Master mute
                systemctl suspend
                ;;
            --logout)
                case "$DESKTOP_SESSION" in
                    openbox) openbox --exit ;;
                    bspwm) bspc quit ;;
                    i3) i3-msg exit ;;
                    plasma) qdbus org.kde.ksmserver /KSMServer logout 0 0 0 ;;
                    xfce) killall xfce4-session ;;
                    hyprland) killall Hyprland ;;
                esac
                ;;
        esac
    fi
}

# Main logic
chosen="$(run_wofi)"
case ${chosen} in
    $shutdown) run_cmd --shutdown ;;
    $reboot) run_cmd --reboot ;;
    $lock) swaylock ;;
    $suspend) run_cmd --suspend ;;
    $logout) run_cmd --logout ;;
esac

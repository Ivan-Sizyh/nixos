{ config, lib, pkgs, ... }:

let
  dedupAndPoweroff = pkgs.writeShellScript "dedup-poweroff" ''
    sudo duperemove -dr --io-threads="$(nproc)" --hashfile=/var/cache/duperemove.db /
    systemctl poweroff
  '';

  powerMenu = pkgs.writeShellScript "power-menu" ''
    echo -e "dedup & poweroff\npoweroff\nreboot\nsuspend\nlock\nlogout" | while IFS= read -r item; do
      echo "$item"
    done
    PS3="choice: "
    select choice in "dedup & poweroff" "poweroff" "reboot" "suspend" "lock" "logout"; do
      case "$choice" in
        "dedup & poweroff") ${dedupAndPoweroff} ;;
        poweroff) systemctl poweroff ;;
        reboot)   systemctl reboot ;;
        suspend)  systemctl suspend ;;
        lock)     swaymsg input type:keyboard xkb_switch_layout 0 && swaylock ;;
        logout)   swaymsg exit ;;
      esac
      break
    done
  '';
in
{
  _module.args.menus = {
    power = "foot -e ${powerMenu}";
  };
}

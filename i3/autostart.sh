#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

## run (only once) processes which spawn with different name
if (command -v gnome-keyring-daemon && ! pgrep gnome-keyring-d); then
    gnome-keyring-daemon --daemonize --login &
fi
if (command -v start-pulseaudio-x11 && ! pgrep pulseaudio); then
    start-pulseaudio-x11 &
fi
if (command -v /usr/lib/mate-polkit/polkit-xfce4-authentication-agent-1 && ! pgrep polkit-xcfe4-aut) ; then
    /usr/lib/xfce4-polkit/polkit-xfce4-authentication-agent-1 &
fi
if (command -v  xfce4-power-manager && ! pgrep xfce4-power-man) ; then
    xfce4-power-manager &
fi
# System-config-printer-applet is not installed in minimal edition
if (command -v system-config-printer-applet && ! pgrep applet.py ); then
  system-config-printer-applet &
fi


run xfsettingsd
run "light-locker"
run "thunar --daemon"
run blueman-applet
run "msm_notifier"
run "variety"
run "xfce4-power-manager"
run "/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1"
run "numlockx on"
run "volumeicon"
#run "cerebro"
#run "synapse"
run "nitrogen --restore"
run "light-locker"
run "compton"
run ".conky/conky-startup.sh"
#pkill compton
sleep 3
#run compton -C --config ~/.config/compton.conf
#run "compton"
pkill conky


sleep 3
#run "conky -c $HOME/.config/awesome/system-overview"
#run "conky -c $HOME/.config/awesome/conky/conkyrc.lua"
run "conky -c $HOME/.config/awesome/conky/conky_green"
run "conky -c $HOME/.config/awesome/conky/conky1.10_shortcuts_green" 
#run "conky -c $HOME/.config/awesome/conky/conky_draw.lua"
#sleep 1
#run "conky -c $HOME/.config/awesome/conky/seamod_rings.lua"


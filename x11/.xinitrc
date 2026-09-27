#!/bin/sh

export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=i3
export GTK_THEME=Adwaita:dark 

[ -f "$HOME/.Xresources" ] && xrdb -merge "$HOME/.Xresources"

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unsef f
fi

dbus-update-activiation-environment --systemd \
	DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE GTK_THEME

exec i3

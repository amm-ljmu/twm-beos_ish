#!/bin/sh
# $Xorg: xinitrc.cpp,v 1.3 2000/08/17 19:54:30 cpqbld Exp $

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    /usr/bin/xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    /usr/bin/xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    /usr/bin/xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    /usr/bin/xmodmap $usermodmap
fi

# start some nice programs

/usr/bin/twm &
/usr/bin/xsetroot -solid "#336698"
# Show the BeOS logo
# TWM Icon Manager location set in .twmrc
/usr/bin/feh -B gray -g 164x40+1756+0 /home/amarkov/.fvwm/icons/beos-icons/logos/start-here.png &
/usr/bin/xclock -geometry 50x50-1+1010 &
/usr/bin/xterm -geometry 120x70+40+40 &
#/usr/bin/xterm -geometry 80x20+494-0 &
exec /usr/bin/xterm -geometry 80x20+0+0 -name login

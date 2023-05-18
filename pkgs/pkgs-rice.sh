#!/bin/sh -e

add() {
    emerge --verbose --noreplace "$@"
}

has() {
    grep "$i" /var/lib/portage/world >/dev/null || return 1
}

add \
    app-misc/neofetch \
    app-misc/toilet

# THEMES
add \
    lxde-base/lxappearance \
    x11-themes/arc-theme

if ! has papirus-icon-theme ; then
    eselect repository enable 4nykey
    emerge --sync 4nykey
    add x11-themes/papirus-icon-theme
fi

if ! has paper-icon-theme ; then
    eselect repository enable tastytea
    emerge --sync tastytea
    add x11-themes/paper-icon-theme
fi

# -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# X11 Rice Stuff
# -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# add \
#     x11-misc/dunst \
#     x11-misc/parcellite \
#     x11-misc/pcmanfm \
#     x11-misc/picom \
#     x11-misc/lightdm \
#     x11-misc/i3lock-fancy-rapid \
#     x11-wm/i3 \
#     x11-misc/polybar
# -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

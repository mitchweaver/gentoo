#!/bin/sh -e

add() {
    emerge --verbose --noreplace "$@"
}

add \
    gui-wm/sway \
    gui-apps/swaybg \
    gui-apps/swayidle \
    gui-apps/swaylock \
    gui-libs/xdg-desktop-portal-wlr \
    gui-apps/wl-clipboard

add \
    gui-apps/mako \
    gui-apps/grim \
    gui-apps/slurp \
    gui-apps/wofi \
    x11-misc/gammastep


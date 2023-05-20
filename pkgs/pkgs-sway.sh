#!/bin/sh -e

add() {
    emerge --verbose --noreplace "$@"
}

add \
    gui-wm/sway \
    gui-apps/swaybg \
    gui-libs/xdg-desktop-portal-wlr \
    gui-apps/grim \
    gui-apps/slurp

# gui-apps/wl-clipboard

# x11-misc/lightdm
#gui-libs/display-manager-init

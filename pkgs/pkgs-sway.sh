#!/bin/sh -e

add() {
    emerge --verbose --noreplace "$@"
}

add \
    gui-wm/sway \
    gui-apps/grim \
    gui-apps/slurp


# gui-apps/wl-clipboard

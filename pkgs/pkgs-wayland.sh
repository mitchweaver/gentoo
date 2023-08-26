#!/bin/sh -e

add() {
    emerge --verbose --noreplace "$@"
}

add \
    gui-libs/egl-wayland \
    gui-apps/grim \
    gui-apps/slurp \
    x11-misc/gammastep


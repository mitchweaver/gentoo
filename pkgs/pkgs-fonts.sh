#!/bin/sh -e

add() {
    emerge --verbose --noreplace "$@"
}

# FONTS
add \
    x11-apps/mkfontscale \
    media-libs/fontconfig \
    media-fonts/font-util \
    media-fonts/fontawesome \
    media-fonts/liberation-fonts \
    media-fonts/noto \
    media-fonts/noto-cjk \
    media-fonts/noto-emoji \
    media-fonts/roboto \
    media-fonts/terminus-font \
    media-fonts/dejavu \
    media-fonts/hack \
    media-fonts/ibm-plex

eselect repository enable guru
emerge --sync guru

add \
    media-fonts/robotomono-nerdfont::guru \
    media-fonts/gohufont::guru \
    media-fonts/iosevka-nerdfont::guru

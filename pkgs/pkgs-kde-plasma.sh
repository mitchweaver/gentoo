#!/bin/sh -e
#
# install a minimal kde-plasma environment by bypassing plasma-meta
# including only enough to get plasma-desktop working without issues
#
# Note this is also WITHOUT selecting the kde profile.
# See all my use flags in kde-plasma.use in /etc/portage
#
# note: needed use flags
#       polkit, dbus, elogind (if no systemd)
# ========================================================================


# ========================================================================
# REMOVAL: just emerge --unmerge plasma-desktop then depclean
# ========================================================================


add() {
    emerge -avnuN "$@"
}

alias confirm='echo "Enter to continue..." ; read -r _'

add \
    kde-plasma/plasma-desktop

confirm

add \
    kde-plasma/powerdevil \
    kde-plasma/systemsettings \
    kde-plasma/kdeplasma-addons \
    kde-plasma/xembed-sni-proxy \
    kde-plasma/kscreen \
    kde-apps/dolphin


add \
    display-manager-init \
    sddm \
    sddm-kcm \
    xf86-input-libinput

add \
    xdg-desktop-portal-kde

echo 'DISPLAYMANAGER="sddm"' > /etc/conf.d/display-manager
rc-update add elogind default
#######rc-update add display-manager default

cat <<"EOF"
=============== NOTE ======================
If using proprietary nvidia driver,
need this kernel parameter::

nvidia-drm.modeset=1
===========================================
EOF

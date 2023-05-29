#!/bin/sh -e
#
# install a minimal gnome environment through gnome-light
# meaning excluding most of the junk apps that is normally included
#
# Note this is also WITHOUT selecting the kde profile.
# See all my use flags in gnome.use in /etc/portage
#
# note: needed use flags
#       polkit, dbus, elogind (if no systemd)
# ========================================================================

add() {
    emerge -avnuN "$@"
}

alias confirm='echo "Enter to continue..." ; read -r _'

if ! grep 'sys-apps/accountsservice' /var/lib/portage/world >/dev/null ; then
    printf '\n%s' "Are you using musl libc? (y/n):"
    read -r ans

    case $ans in
        y|yes)
            add sys-apps/accountsservice::musl
            ;;
        n|no)
            add sys-apps/accountsservice::gentoo
            ;;
        *)
            exit 1
    esac
fi

add \
    gnome-base/gnome-light \
    gnome-base/gdm

##############    dev-libs/gjs::mitchw

confirm

add \
    gnome-base/nautilus \
    gnome-extra/gnome-shell-extensions \
    gnome-extra/gnome-tweaks \
    media-gfx/gnome-screenshot

confim

add \
    dev-libs/libgweather

###############app-eselect/eselect-gnome-shell-extensions

confirm

# add \
#     x11-misc/gpaste

# add \
#     gnome-extra/gnome-shell-extension-appindicator \
#     gnome-extra/gnome-shell-extension-dash-to-panel \
#     gnome-extra/gnome-shell-extension-control-blur-effect-on-lock-screen \
#     gnome-extra/gnome-shell-extension-pop-shell \
#     gnome-extra/gnome-shell-extension-alphabetical-grid \
#     gnome-extra/gnome-shell-extension-bluetooth-quick-connect \
#     gnome-extra/gnome-shell-frippery

confirm

add \
    gui-libs/display-manager-init

confirm

# eselect repository enable 4nykey
# emerge --sync 4nykey
# add \
#     gnome-extra/gnome-shell-extension-openweather

# -------------------------------
# REMOVING
# -------------------------------
# pkg d \
#     sys-apps/accountsservice \
#     gnome-base/gnome-light \
#     gnome-base/gdm \
#     gnome-base/nautilus \
#     gnome-extra/gnome-shell-extensions \
#     gnome-extra/gnome-tweaks \
#     media-gfx/gnome-screenshot \
#     gnome-extra/gnome-shell-extension-appindicator \
#     gnome-extra/gnome-shell-extension-dash-to-panel \
#     gnome-extra/gnome-shell-extension-control-blur-effect-on-lock-screen \
#     gnome-extra/gnome-shell-extension-pop-shell \
#     gnome-extra/gnome-shell-extension-alphabetical-grid \
#     gnome-extra/gnome-shell-extension-bluetooth-quick-connect \
#     gnome-extra/gnome-shell-frippery \
#     dev-libs/libgweather \
#     x11-misc/gpaste \
#     dev-libs/gjs

# -------------------------------
# After install
# -------------------------------

echo 'DISPLAYMANAGER="gdm"' > /etc/conf.d/display-manager
rc-update add elogind default

echo "you may want to: 'rc-update add display-manager default'"

# see: https://wiki.gentoo.org/wiki/GNOME/Guide#Non-root_user_authentication_for_dialogs
mkdir -p /etc/polkit-1/rules.d
cat > /etc/polkit-1/rules.d/49-wheel.rules <<"EOF"
polkit.addAdminRule(function(action, subject) {
    return ["unix-group:wheel"];
});
EOF


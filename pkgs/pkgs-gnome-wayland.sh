#!/bin/sh

# ===================================================================================
# sometimes I use gnome, but the mouse input lag drives me insane
# everyone I talk to says its not a thing, ITS DEFINITELY A THING...
#
# I can't explain it. It's not as bad on X11 gnome as Wayland gnome, but its there.
#
# Something to do with its compositor... Like its forced vsync or something.
#
# Call me crazy.
# ===================================================================================

add() {
    emerge --verbose --noreplace "$@"
}

add \
    gnome-base/gnome-light \
    gnome-base/nautilus \
    gnome-base/gdm \
    gnome-extra/gnome-shell-extensions \
    gnome-extra/gnome-tweaks \
    app-eselect/eselect-gnome-shell-extensions \
    gnome-extra/extension-manager \
    media-gfx/gnome-screenshot

add \
    x11-misc/gpaste

add \
    gui-libs/display-manager-init

add \
    gnome-extra/gnome-shell-extension-appindicator \
    gnome-extra/gnome-shell-extension-dash-to-panel \
    gnome-extra/gnome-shell-extension-control-blur-effect-on-lock-screen \
    gnome-extra/gnome-shell-extension-pop-shell \
    gnome-extra/gnome-shell-extension-alphabetical-grid \
    gnome-extra/gnome-shell-extension-bluetooth-quick-connect \
    gnome-extra/gnome-shell-frippery

eselect repository enable 4nykey
emerge --sync 4nykey
add \
    gnome-extra/gnome-shell-extension-openweather

# -------------------------------
# After install
# -------------------------------

echo 'DISPLAYMANAGER="gdm"' > /etc/conf.d/display-manager
rc-update add elogind default
rc-update add display-manager default

# see: https://wiki.gentoo.org/wiki/GNOME/Guide#Non-root_user_authentication_for_dialogs
cat > /etc/polkit-1/rules.d/49-wheel.rules <<"EOF"
polkit.addAdminRule(function(action, subject) {
    return ["unix-group:wheel"];
});
EOF


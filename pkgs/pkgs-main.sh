#!/bin/sh -e
#
# Main package script. Meant to be used with all machines.
#
# =============================================================

add() {
    emerge -av --noreplace --update --verbose-conflicts "$@" || return 1
}

# GENTOO-SPECIFIC
add \
    app-eselect/eselect-python \
    app-eselect/eselect-repository \
    app-portage/gentoolkit \
    app-portage/portage-utils

# SYSTEM DAEMONS
add \
    app-admin/sysklogd \
    sys-process/cronie \
    net-misc/chrony

# terminal userland
add \
    x11-terms/kitty \
    app-editors/neovim \
    app-misc/ranger \
    app-i18n/translate-shell \
    app-text/tree \
    sys-apps/pv \
    sys-apps/progress \
    sys-apps/exa \
    sys-apps/bat

# terminal userland needed libraries
add \
    dev-python/pynvim

# langs
add \
    dev-lang/go \
    dev-lang/rust \
    dev-lang/typescript \
    net-libs/nodejs

# development
add \
    dev-util/shellcheck-bin \
    app-containers/docker \
    app-containers/docker-compose \
    app-misc/jq \
    www-apps/hugo \
    dev-python/pylint \
    dev-python/pillow \
    dev-python/pip

# system utils
add \
    app-admin/doas \
    app-admin/sudo \
    sys-process/htop  \
    sys-process/lsof \
    sys-apps/lm-sensors \
    sys-apps/pciutils \
    sys-apps/usbutils \
    sys-apps/smartmontools \
    app-admin/sysstat \
    sys-process/iotop-c

# ARCHIVE
add \
    app-arch/p7zip \
    app-arch/unrar \
    app-arch/unzip \
    app-arch/zip \
    app-arch/lz4

# scripting utilities
add \
    app-admin/entr \
    app-misc/detox \
    app-text/dos2unix \
    sys-fs/inotify-tools \
    app-misc/dateutils

######    app-text/pandoc

# FILESYSTEM
add \
    net-fs/cifs-utils \
    net-fs/samba \
    sys-fs/dosfstools \
    sys-fs/ntfs3g

# SECURITY
add \
    app-antivirus/clamav \
    net-analyzer/fail2ban \
    sys-apps/firejail

# GFX
add \
    media-gfx/gimp \
    media-plugins/gimp-lqr \
    media-gfx/imagemagick \
    media-gfx/jpegoptim \
    media-libs/exiftool

# VIDEO
add \
    media-video/mpv \
    media-video/ffmpegthumbnailer \
    net-misc/yt-dlp

# AUDIO
add \
    app-cdr/cuetools \
    media-sound/alsa-utils \
    media-libs/alsa-ucm-conf \
    media-plugins/alsa-plugins \
    media-sound/pavucontrol \
    media-sound/shntool \
    media-sound/vorbis-tools \
    media-sound/wavpack

# NETWORKING
add \
    net-analyzer/openbsd-netcat \
    net-analyzer/nmap \
    net-analyzer/wireshark \
    net-analyzer/speedtest-cli \
    net-dns/bind-tools \
    net-misc/curl \
    net-misc/dhcpcd \
    net-misc/rdesktop \
    net-misc/socat \
    net-vpn/openvpn \
    net-vpn/wireguard-tools \
    net-wireless/bluez \
    net-wireless/bluez-tools \
    media-sound/bluez-alsa \
    sys-apps/ethtool \
    net-dns/dnsmasq \
    net-libs/ldns \
    net-misc/nextcloud-client \
    net-fs/nfs-utils

# PRINTING
add \
    net-print/cups \
    net-print/cups-filters \
    net-print/cups-pdf \
    net-print/hplip

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
    media-fonts/dejavu

# MISC LIBS
add \
    dev-cpp/nlohmann_json \
    dev-python/numpy \
    dev-python/scipy


# ===============================================================================
# flatpak
# ===============================================================================
add \
    sys-apps/flatpak

# ===============================================================================
# big stuff below
# ===============================================================================

# add \
#     libreoffice

# # VIDEO EDITING
# add \
#     media-video/shotcut \
#     media-video/obs-studio

# MAILSPRING
# eselect repository enable edgets
# emerge --sync edgets
# add mailspring

# ===============================================================================
# OLD WORLD
# ===============================================================================
## # PROPRIETARY
# add \
#     net-im/discord \
#     media-sound/spotify
## LLVM / Clang / lld
# add \
#     sys-devel/clang \
#     sys-devel/llvm \
#     sys-devel/lld
## add \
#     app-text/zathura \
#     app-text/zathura-meta
# eselect repository enable broverlay
# emerge --sync broverlay
# add nodejs-bin
####media-video/x264-encoder \
###media-libs/x264 \
####    media-libs/x265 \
# media-plugins/gst-plugins-x264 \
# media-plugins/gst-plugins-x265 \
# media-libs/gst-plugins-ugly \
# media-libs/gst-plugins-bad \
###media-video/v4l2loopback \
## # DRIVERS / FIRMWARE
# add \
#     x11-base/xorg-drivers \
#     x11-drivers/xf86-input-libinput \
#     sys-firmware/sof-firmware

#!/bin/sh -e

add() {
    emerge --verbose --noreplace "$@"
}

# ===============================================================================
# wireless
# ===============================================================================
add \
    net-wireless/iw \
    net-wireless/wireless-tools \
    net-wireless/wpa_supplicant \

# ===============================================================================
# keyboard backlighting
# ===============================================================================
# add \
#     sys-power/acpi \
#     sys-power/acpilight

# ===============================================================================
# power management
# ===============================================================================
# https://wiki.gentoo.org/wiki/Power_management/Guide#About_laptop-mode-tools
#
# note: remember copy tlp.conf from this repo
# add \
#     sys-power/thermald \
#     sys-power/tlp \
#     sys-power/powertop
#
# rc-update add thermald default
# rc-update add tlp default
# rc-service thermald start
# rc-service tlp start

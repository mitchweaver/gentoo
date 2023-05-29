#!/bin/sh

eselect repository add librewolf git https://gitlab.com/librewolf-community/browser/gentoo.git
emerge --sync librewolf
emerge librewolf

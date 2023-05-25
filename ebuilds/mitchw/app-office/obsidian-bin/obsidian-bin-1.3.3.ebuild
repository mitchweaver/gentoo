# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

DESCRIPTION="A second brain, for you, forever."
HOMEPAGE="https://obsidian.md"

SRC_URI_AMD64="https://github.com/obsidianmd/obsidian-releases/releases/download/v${PV}/Obsidian-${PV}.AppImage"
SRC_URI_ARM64="https://github.com/obsidianmd/obsidian-releases/releases/download/v${PV}/Obsidian-${PV}-arm64.AppImage"

SRC_URI="
	amd64? ( ${SRC_URI_AMD64} )
	arm64? ( ${SRC_URI_ARM64} )
"

LICENSE="Obsidian-EULA"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="sys-fs/fuse:0"

S="${WORKDIR}"

IUSE="-musl"

src_install() {
	if use musl ; then
		die "AppImage is only for glibc"
	fi

	if use amd64 ; then
		BIN_NAME=Obsidian-1.2.8.AppImage
	elif use arm64 ; then
		BIN_NAME=Obsidian-1.2.8-arm64.AppImage
	fi

	cp "${DISTDIR}/${BIN_NAME}" ${PN} || die
	dobin ${PN}
}

# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake-multilib

DESCRIPTION="Unit testing framework for C"
HOMEPAGE="https://cmocka.org/"
SRC_URI="https://cmocka.org/files/$(ver_cut 1-2)/${P}.tar.xz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux"
IUSE="doc examples static-libs test"
RESTRICT="!test? ( test )"

BDEPEND="doc? ( app-doc/doxygen[dot] )"

# add patch from alpine linux to allow compilation under musl-libc
# see: https://pkgs.alpinelinux.org/package/edge/main/aarch64/cmocka
PATCHES=(
	"${FILESDIR}"/wordsize-musl.patch
)

multilib_src_configure() {
	local mycmakeargs=(
		-DWITH_EXAMPLES=$(usex examples)
		-DWITH_STATIC_LIB=$(usex static-libs)
		-DUNIT_TESTING=$(usex test)
		$(multilib_is_native_abi && cmake_use_find_package doc Doxygen \
			|| echo -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=ON)
	)

	cmake_src_configure
}

multilib_src_compile() {
	cmake_src_compile
	multilib_is_native_abi && use doc && cmake_src_compile docs
}

multilib_src_install() {
	if multilib_is_native_abi && use doc; then
		local HTML_DOCS=( "${BUILD_DIR}"/doc/html/. )
	fi

	cmake_src_install
}

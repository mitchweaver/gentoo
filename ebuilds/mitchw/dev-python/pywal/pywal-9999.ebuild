EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Generate and change color-schemes on the fly"
HOMEPAGE="https://github.com/dylanaraps/pywal"

inherit git-r3
EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="MIT"
SLOT="0"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# require Internet
	tests/test_socks.py::TestSOCKSProxy::test_create_connection_resolve_good
)

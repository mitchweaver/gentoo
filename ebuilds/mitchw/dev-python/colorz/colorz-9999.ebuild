EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="A k-means color scheme generator"
HOMEPAGE="https://github.com/metakirby5/colorz"

inherit git-r3
EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="MIT"
SLOT="0"

DEPEND="
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# require Internet
	tests/test_socks.py::TestSOCKSProxy::test_create_connection_resolve_good
)

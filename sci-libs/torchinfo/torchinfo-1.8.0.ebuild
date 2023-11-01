# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1

inherit cuda distutils-r1

DESCRIPTION="View model summaries in PyTorch"
HOMEPAGE="https://github.com/TylerYep/torchinfo"
SRC_URI="https://github.com/TylerYep/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
#S="${WORKDIR}/vision-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	')
	=sci-libs/pytorch-2.0*[${PYTHON_SINGLE_USEDEP}]
	sci-libs/torchvision[${PYTHON_SINGLE_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
	test? (
		$(python_gen_cond_dep '
		dev-python/mock[${PYTHON_USEDEP}]
		')
	)"

distutils_enable_tests pytest

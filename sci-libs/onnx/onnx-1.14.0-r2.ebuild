# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1 python-r1

MY_PN="onnx"
MY_P="$MY_PN-$PV"

DESCRIPTION="Open Neural Network Exchange (ONNX)"
HOMEPAGE="https://github.com/onnx/onnx"
SRC_URI="https://github.com/onnx/${MY_PN}/archive/refs/tags/v${PV}.tar.gz
	-> ${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~riscv"
RESTRICT="test"

DEPEND="dev-libs/protobuf:="
RDEPEND="${DEPEND}"
BDEPEND="${PYTHON_DEPS}"

PATCHES=( $FILESDIR/${MY_P}-cxx_14.patch )

S="$WORKDIR/$MY_P"

distutils_enable_tests pytest

src_prepare() {
	default
	sed -i '/pytest-runner/d' setup.py
}

src_configure() {
	export CMAKE_ARGS="-DONNX_USE_PROTOBUF_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/usr -DONNX_USE_LITE_PROTO=ON"
	distutils-r1_src_configure
}

#python_install() {
#	esetup.py install --root="${T}" --optimize=1 --skip-build
#}

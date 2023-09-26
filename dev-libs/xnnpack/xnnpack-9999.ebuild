# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake git-r3
DESCRIPTION="High-efficiency floating-point neural network inference operators"
HOMEPAGE="https://github.com/google/XNNPACK/"
EGIT_REPO_URI="https://github.com/google/XNNPACK.git"
#S="${WORKDIR}/${P}"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-libs/pthreadpool-2023.08.29"

src_configure() {
	local mycmakeargs=(
		-DXNNPACK_USE_SYSTEM_LIBS=ON
		-DXNNPACK_BUILD_BENCHMARKS=OFF
		-DXNNPACK_BUILD_TESTS=OFF
		-DXNNPACK_LIBRARY_TYPE=shared
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON
	)

	cmake_src_configure
}

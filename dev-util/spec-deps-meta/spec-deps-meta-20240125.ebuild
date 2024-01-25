EAPI="8"
SLOT="0"

DESCRIPTION="Build dependencies for the Spec project"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""

RDEPEND="=dev-util/conan-1.59.0
	sci-libs/mkl
	dev-libs/c-blosc
	sci-libs/ceres-solver
	sci-biology/imagej[plugins]
        x11-apps/mesa-progs
        dev-util/vulkan-tools
        dev-debug/strace
"

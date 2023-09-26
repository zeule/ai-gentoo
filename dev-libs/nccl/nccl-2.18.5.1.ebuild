EAPI=8
SLOT=0
KEYWORDS="~amd64"

LICENSE="NVIDIA-SDK"

inherit cuda git-r3
EGIT_REPO_URI="https://github.com/NVIDIA/nccl.git"
EGIT_COMMIT="559b70f86c190a0d8f67f0d7a0f2c9810dd1e8c7"


RDEPEND="dev-util/nvidia-cuda-toolkit"

src_prepare() {
	default
	cuda_src_prepare
}

src_compile() {
	emake \
		PREFIX=${EPREFIX}/usr \
		CXX=$(cuda_gccdir)/c++ \
		CUDA_HOME=/opt/cuda \
		src.build
}

src_install() {
	mkdir -p ${D}/usr/lib64
	mkdir -p ${D}/usr/lib64/pkgconfig
	mkdir -p ${D}/usr/include
	cp -P -v build/lib/lib* ${D}/usr/lib64/
	cp -P -v build/lib/pkgconfig/* ${D}/usr/lib64/pkgconfig/
	cp -v build/include/* ${D}/usr/include/
}

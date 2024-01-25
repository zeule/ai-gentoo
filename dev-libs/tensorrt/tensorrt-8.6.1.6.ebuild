EAPI=8
SLOT=0
KEYWORDS="~amd64 ~amd64-linux"

DESCRIPTION="NVIDIA TensorRT is a platform for high performance deep learning inference."
HOMEPAGE="https://developer.nvidia.com/tensorrt"

MY_PN="TensorRT"

SRC_URI="https://developer.nvidia.com/downloads/compute/machine-learning/${MY_PN}/secure/${PV}/tars/${MY_PN}-${PV}.Linux.x86_64-gnu.cuda-11.8.tar.gz"
RESTRICT="fetch"
LICENSE="NVIDIA-SDK"

RDEPEND="=dev-util/nvidia-cuda-toolkit-11*"
BDEPEND="dev-util/patchelf"

S="${WORKDIR}/${MY_PN}-${PV}"

QA_PREBUILT="/opt/cuda/targets/x86_64-linux/lib/*"

src_install() {
	# nvinfer loads libnvinfer_builder_resource.so.8.6.1 via dlopen(), but does not
	# use full path name. To make that work we set RPATH
	patchelf  --set-rpath '$ORIGIN' targets/x86_64-linux-gnu/lib/libnvinfer.so || die
	patchelf  --set-rpath '$ORIGIN' targets/x86_64-linux-gnu/lib/libnvinfer_lean.so || die

	insinto /opt/cuda/targets/x86_64-linux
	doins -r include targets/x86_64-linux-gnu/lib

	exeinto /opt/cuda/bin
	doexe targets/x86_64-linux-gnu/bin/trtexec
}

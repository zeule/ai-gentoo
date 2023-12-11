EAPI=8
SLOT=0

DESCRIPTION="Cross-platform inference and training machine-learning accelerator."
HOMEPAGE="https://onnxruntime.ai"
SRC_URI="https://github.com/microsoft/onnxruntime/releases/download/v${PV}/onnxruntime-linux-x64-gpu-${PV}.tgz -> ${P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror test"

RDEPEND="dev-util/nvidia-cuda-toolkit:0/11
    dev-libs/cudnn:0/8
"

S="$WORKDIR"/onnxruntime-linux-x64-gpu-${PV}

src_install() {
	into /opt/onnxruntime-bin
	dolib.so lib/libonnxruntime.so.${PV}
	dosym libonnxruntime.so.${PV} /opt/onnxruntime-bin/lib64/libonnxruntime.so

	dolib.so lib/libonnxruntime_providers_cuda.so
	dolib.so lib/libonnxruntime_providers_shared.so
	dolib.so lib/libonnxruntime_providers_tensorrt.so

	insinto /opt/onnxruntime-bin
	doins -r include
	doins VERSION_NUMBER

	dodoc LICENSE Privacy.md README.md ThirdPartyNotices.txt
}

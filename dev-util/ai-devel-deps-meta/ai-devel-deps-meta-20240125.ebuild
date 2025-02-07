EAPI="8"
SLOT="0"

DESCRIPTION="Build dependencies for the AI(ML) projects"
LICENSE="metapackage"

KEYWORDS="~x86 ~amd64"
IUSE="cuda"

DEPEND=""

RDEPEND="
	sci-libs/caffe2[cuda=]
	sci-libs/pytorch
	sci-libs/torchvision[cuda=]
	sci-libs/torchinfo
	dev-python/matplotlib
	dev-python/natsort
	dev-cpp/cli11
	cuda? ( dev-libs/tensorrt
		|| ( sci-libs/onnxruntime[cuda] sci-libs/onnxruntime-bin )
	)
"

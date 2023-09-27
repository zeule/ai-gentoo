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
"

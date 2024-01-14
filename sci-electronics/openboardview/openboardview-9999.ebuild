# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{5..12} )
inherit cmake git-r3 python-single-r1 xdg-utils

DESCRIPTION="Linux SDL/ImGui edition software for viewing .brd files."
HOMEPAGE="http://openboardview.org/"
EGIT_REPO_URI="https://github.com/OpenBoardView/OpenBoardView"

LICENSE="MIT"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

BDEPEND="${PYTHON_DEPS}
	x11-libs/gtk+:3
	media-libs/libsdl2
	media-libs/libpng
	sys-libs/zlib
	dev-db/sqlite
	media-libs/fontconfig
"
RDEPEND="${BDEPEND}"
DEPEND="${BDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
	)
cmake_src_configure
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

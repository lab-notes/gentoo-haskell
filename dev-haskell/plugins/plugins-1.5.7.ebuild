# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Dynamic linking for Haskell and C objects"
HOMEPAGE="https://github.com/stepcut/plugins"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/cabal-1.6:=[profile?]
	dev-haskell/ghc-paths:=[profile?]
	dev-haskell/haskell-src:=[profile?]
	dev-haskell/random:=[profile?]
	>=dev-lang/ghc-6.10:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
"

PATCHES=(
	"${FILESDIR}"/${P}-ghc-8.4.patch
	"${FILESDIR}"/${P}-ghc-8.patch
)

src_prepare() {
	default

	if has_version ">=dev-haskell/cabal-2.2.0.0"; then
		sed -e "s@../../../config.h@${S}/dist/build/config.h@" \
			-i "${S}"/src/System/Plugins/Consts.hs \
			"${S}"/src/System/Plugins/Env.hs \
			"${S}"/src/System/Plugins/Load.hs \
			"${S}"/src/System/Plugins/Parser.hs \
			"${S}"/src/System/Plugins/Utils.hs \
			|| die
	fi
}

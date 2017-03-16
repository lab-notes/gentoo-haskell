# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Pandoc filter for cross-references"
HOMEPAGE="http://hackage.haskell.org/package/pandoc-crossref"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT=test # missing file

RDEPEND=">=app-text/pandoc-1.17.1:=[profile?] <app-text/pandoc-1.20:=[profile?]
	>=dev-haskell/data-accessor-0.2.2.6:=[profile?] <dev-haskell/data-accessor-0.3.0.0:=[profile?]
	>=dev-haskell/data-accessor-template-0.2.1.12:=[profile?] <dev-haskell/data-accessor-template-0.3.0.0:=[profile?]
	>=dev-haskell/data-accessor-transformers-0.2.1.6:=[profile?] <dev-haskell/data-accessor-transformers-0.3.0.0:=[profile?]
	>=dev-haskell/data-default-0.4:=[profile?] <dev-haskell/data-default-0.8:=[profile?]
	>=dev-haskell/mtl-1.1:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
	>=dev-haskell/pandoc-types-1.16:=[profile?] <dev-haskell/pandoc-types-1.18:=[profile?]
	>=dev-haskell/roman-numerals-0.5:=[profile?] <dev-haskell/roman-numerals-0.6:=[profile?]
	>=dev-haskell/syb-0.4:=[profile?]
	>=dev-haskell/utility-ht-0.0.11:=[profile?] <dev-haskell/utility-ht-0.1.0:=[profile?]
	>=dev-lang/ghc-7.10.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.22.2.0
	test? ( dev-haskell/hspec )
"

src_prepare() {
	default

	cabal_chdeps \
		'syb >= 0.4 && < 0.7' 'syb >= 0.4'
}
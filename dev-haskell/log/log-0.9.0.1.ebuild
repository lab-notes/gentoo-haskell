# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Structured logging solution with multiple backends"
HOMEPAGE="https://github.com/scrive/log"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT=test # tries to access network

RDEPEND=">=dev-haskell/log-base-0.7.1.1:=[profile?] <dev-haskell/log-base-0.9:=[profile?]
	>=dev-haskell/log-elasticsearch-0.9.0.1:=[profile?]
	>=dev-haskell/log-postgres-0.7.0.1:=[profile?] <dev-haskell/log-postgres-0.9:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( dev-haskell/aeson
		dev-haskell/bloodhound
		dev-haskell/exceptions
		dev-haskell/http-client
		dev-haskell/http-types
		dev-haskell/random
		dev-haskell/tasty
		dev-haskell/tasty-hunit
		dev-haskell/text
		dev-haskell/transformers )
"

src_prepare() {
	default

	cabal_chdeps \
		'log-elasticsearch >= 0.9.0.1 && < 0.10' 'log-elasticsearch >= 0.9.0.1'
}

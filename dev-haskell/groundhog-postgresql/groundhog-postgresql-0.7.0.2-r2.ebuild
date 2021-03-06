# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.4.3

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="PostgreSQL backend for the groundhog library"
HOMEPAGE="https://hackage.haskell.org/package/groundhog-postgresql"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/attoparsec-0.8.5.3:=[profile?]
	>=dev-haskell/blaze-builder-0.3:=[profile?] <dev-haskell/blaze-builder-0.5:=[profile?]
	>=dev-haskell/groundhog-0.7:=[profile?] <dev-haskell/groundhog-0.8:=[profile?]
	>=dev-haskell/monad-control-0.3:=[profile?] <dev-haskell/monad-control-1.1:=[profile?]
	>=dev-haskell/monad-logger-0.3:=[profile?]
	>=dev-haskell/postgresql-libpq-0.6.1:=[profile?]
	>=dev-haskell/postgresql-simple-0.3:=[profile?]
	>=dev-haskell/resource-pool-0.2.1:=[profile?]
	>=dev-haskell/text-0.8:=[profile?]
	>=dev-haskell/transformers-0.2.1:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
"

src_prepare() {
	cabal_chdeps \
		'postgresql-simple        >= 0.3       && < 0.5' 'postgresql-simple        >= 0.3' \
		'transformers             >= 0.2.1     && < 0.5' 'transformers             >= 0.2.1'
}

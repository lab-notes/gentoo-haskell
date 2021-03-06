# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.3.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour" # test-suite"
inherit haskell-cabal

DESCRIPTION="Test discovery for the tasty framework"
HOMEPAGE="http://git.coop/lwm/tasty-discover"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="test" # test suite fails to build
RDEPEND=">=dev-haskell/glob-0.8:=[profile?] <dev-haskell/glob-1.0:=[profile?]
	>=dev-lang/ghc-7.10.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.22.2.0"
# 	test? ( dev-haskell/hedgehog
# 		dev-haskell/tasty
# 		dev-haskell/tasty-hedgehog
# 		dev-haskell/tasty-hspec
# 		dev-haskell/tasty-hunit
# 		dev-haskell/tasty-quickcheck
# 		dev-haskell/tasty-smallcheck )
# "

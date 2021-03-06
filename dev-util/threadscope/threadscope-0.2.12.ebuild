# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.4

CABAL_FEATURES=""
inherit haskell-cabal

DESCRIPTION="A graphical tool for profiling parallel Haskell programs"
HOMEPAGE="https://www.haskell.org/haskellwiki/ThreadScope"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="<dev-haskell/cairo-0.14:=
	<dev-haskell/file-embed-0.1:=
	>=dev-haskell/ghc-events-0.5:= <dev-haskell/ghc-events-0.13:=
	<dev-haskell/glib-0.14:=
	>=dev-haskell/gtk-0.12:= <dev-haskell/gtk-0.16:=
	<dev-haskell/mtl-2.3:=
	<dev-haskell/pango-0.14:=
	>=dev-haskell/temporary-1.1:= <dev-haskell/temporary-1.4:=
	<dev-haskell/text-1.3:=
	>=dev-lang/ghc-8.2.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.0.0.2
"

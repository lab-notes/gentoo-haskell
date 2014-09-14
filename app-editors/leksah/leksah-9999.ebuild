# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.4.2.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour test-suite"
CABAL_FEATURES+=" nocabaldep" # needs ghc's version as uses leksah-server and ltk linked against ghc's Cabal
inherit haskell-cabal git-2 pax-utils

DESCRIPTION="Haskell IDE written in Haskell"
HOMEPAGE="http://www.leksah.org"
EGIT_REPO_URI="https://github.com/leksah/leksah.git"

LICENSE="GPL-2"
SLOT="0/${PV}"
KEYWORDS=""
REQUIRED_USE="dyre? ( yi )"
IUSE="dyre +gtk3 loc +webkit yi"
# tests fail to compile: confused by gtk2 in slot 2 and gtk2hs upstream using
# the exact same version numbers for gtk2 on hackage and gtk2 in git.
# GHCi runtime linker: fatal error: I found a duplicate definition for symbol
#    gtk2hs_closure_new
# whilst processing object file
#    /usr/lib64/glib-0.12.4/ghc-7.6.2/HSglib-0.12.4.o
RESTRICT="test"

RDEPEND=">=app-editors/leksah-server-0.13.1.0:=[profile?] <app-editors/leksah-server-0.14:=[profile?]
	>=dev-haskell/binary-0.5.0.0:=[profile?] <dev-haskell/binary-0.8:=[profile?]
	>=dev-haskell/binary-shared-0.8.2:=[profile?] <dev-haskell/binary-shared-0.9:=[profile?]
	>=dev-haskell/cabal-1.10.2.0:=[profile?] <dev-haskell/cabal-1.22:=[profile?]
	>=dev-haskell/conduit-1.1:=[profile?] <dev-haskell/conduit-1.2:=[profile?]
	dev-haskell/conduit-extra:=[profile?]
	>=dev-haskell/executable-path-0.0.3:=[profile?] <dev-haskell/executable-path-0.1:=[profile?]
	>=dev-haskell/gio-0.12.2:=[profile?] <dev-haskell/gio-0.13:=[profile?]
	>=dev-haskell/glib-0.10:=[profile?] <dev-haskell/glib-0.13:=[profile?]
	>=dev-haskell/haskell-src-exts-1.13.5:=[profile?] <dev-haskell/haskell-src-exts-1.16:=[profile?]
	>=dev-haskell/hlint-1.8.59:=[profile?] <dev-haskell/hlint-1.9:=[profile?]
	>=dev-haskell/hslogger-1.0.7:=[profile?] <dev-haskell/hslogger-1.3:=[profile?]
	>=dev-haskell/ltk-0.13.2.0:=[profile?] <dev-haskell/ltk-0.14:=[profile?]
	>=dev-haskell/mtl-1.1.0.2:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
	>=dev-haskell/network-2.2:=[profile?] <dev-haskell/network-3.0:=[profile?]
	>=dev-haskell/parsec-2.1.0.1:=[profile?] <dev-haskell/parsec-3.2:=[profile?]
	>=dev-haskell/quickcheck-2.4.2:2=[profile?] <dev-haskell/quickcheck-2.8:2=[profile?]
	>=dev-haskell/regex-base-0.93:=[profile?] <dev-haskell/regex-base-0.94:=[profile?]
	>=dev-haskell/regex-tdfa-1.1:=[profile?] <dev-haskell/regex-tdfa-1.3:=[profile?]
	>=dev-haskell/shakespeare-2.0.0.1:=[profile?] <dev-haskell/shakespeare-2.1:=[profile?]
	>=dev-haskell/strict-0.3.2:=[profile?] <dev-haskell/strict-0.4:=[profile?]
	>=dev-haskell/text-0.11.1.5:=[profile?] <dev-haskell/text-1.2:=[profile?]
	>=dev-haskell/transformers-0.2.2.0:=[profile?] <dev-haskell/transformers-0.5:=[profile?]
	>=dev-haskell/utf8-string-0.3.1.1:=[profile?] <dev-haskell/utf8-string-0.4:=[profile?]
	>=dev-haskell/vado-0.0.1:=[profile?] <dev-haskell/vado-0.1:=[profile?]
	>=dev-haskell/vcsgui-0.0.4:=[profile?] <dev-haskell/vcsgui-0.1:=[profile?]
	>=dev-haskell/vcswrapper-0.0.4:=[profile?] <dev-haskell/vcswrapper-0.1:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	gtk3? ( >=dev-haskell/gtk-0.12.4:3=[profile?] <dev-haskell/gtk-0.13:3=[profile?]
		>=dev-haskell/gtksourceview-0.10.0:3=[profile?] <dev-haskell/gtksourceview-0.13:3=[profile?]
		webkit? ( dev-haskell/webkit:3=[profile?]
				dev-haskell/webkitgtk-javascriptcore:3=[profile?] ) )
	!gtk3? ( >=dev-haskell/gtk-0.12.4:2=[profile?] <dev-haskell/gtk-0.13:2=[profile?]
			dev-haskell/gtk:2=[profile?]
			>=dev-haskell/gtksourceview-0.10.0:2=[profile?] <dev-haskell/gtksourceview-0.13:2=[profile?]
			webkit? ( dev-haskell/webkit:2=[profile?]
				dev-haskell/webkitgtk-javascriptcore:2=[profile?] ) )
	loc? ( dev-haskell/hgettext:=[profile?]
		dev-haskell/setlocale:=[profile?] )
	webkit? ( dev-haskell/blaze-html:=[profile?]
			dev-haskell/ghcjs-codemirror:=[profile?]
			dev-haskell/ghcjs-dom:=[profile?]
			dev-haskell/hamlet:=[profile?]
			dev-haskell/jsaddle:=[profile?]
			dev-haskell/lens:=[profile?]
			>=dev-haskell/pretty-show-1.6.3:=[profile?] <dev-haskell/pretty-show-1.7:=[profile?] )
	yi? ( >=app-editors/yi-0.8.1:=[profile?] <app-editors/yi-0.9:=[profile?]
		dyre? ( >=dev-haskell/dyre-0.8.3:=[profile?] <dev-haskell/dyre-0.9:=[profile?] ) )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( dev-haskell/monad-loops
		yi? ( >=app-editors/yi-0.8.1 <app-editors/yi-0.9 ) )
	gtk3? ( test? ( !webkit? ( dev-haskell/webkit:3 ) ) )
	!gtk3? ( test? ( !webkit? ( dev-haskell/webkit:2 ) ) )
"

src_configure() {
	threaded_flag=""
	if $(ghc-getghc) --info | grep "Support SMP" | grep -q "YES"; then
		threaded_flag="--flags=threaded"
		einfo "$P will be built with threads support"
	else
		threaded_flag="--flags=-threaded"
		einfo "$P will be built without threads support"
	fi
	cabal_src_configure $threaded_flag \
		$(cabal_flag dyre dyre) \
		$(cabal_flag gtk3 gtk3) \
		$(cabal_flag loc loc) \
		$(cabal_flag webkit webkit) \
		$(cabal_flag yi yi) \
		--constraint="Cabal == $(cabal-version)"
}

src_install() {
	cabal_src_install
	# leksah uses GHC-api to process TH source.
	# TH requires GHCi which needs mmap('rwx') (bug #299709)
	pax-mark m "${D}/usr/bin/${PN}"
}

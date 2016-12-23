# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

# ebuild generated by hackport 0.5.9999

CABAL_FEATURES="bin"
inherit haskell-cabal

MY_PN="QuickFuzz"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="An experimental grammar fuzzer in Haskell using QuickCheck"
HOMEPAGE="http://quickfuzz.org/"
SRC_URI="https://dev.gentoo.org/~slyfox/distfiles/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="archs codes docs imgs media net pki"

RDEPEND="dev-haskell/abstract-par:=
	dev-haskell/argparser:=
	dev-haskell/derive:=
	dev-haskell/linear:=
	dev-haskell/monad-par:=
	dev-haskell/mtl:=
	dev-haskell/parallel-io:=
	dev-haskell/primitive:=
	dev-haskell/process-extras:=
	dev-haskell/quickcheck:2=
	dev-haskell/quickcheck-unicode:=
	dev-haskell/random:=
	dev-haskell/split:=
	dev-haskell/text:=
	dev-haskell/vector:=
	dev-haskell/wl-pprint:=
	>=dev-lang/ghc-7.8.2:=
	archs? ( dev-haskell/base16-bytestring:=
			>=dev-haskell/tar-0.5:=
			dev-haskell/zip-archive:= )
	!archs? ( net? ( dev-haskell/base16-bytestring:= ) )
	codes? ( dev-haskell/haxml:=
			dev-haskell/json:=
			dev-haskell/language-bash:=
			dev-haskell/language-css:=
			dev-haskell/language-dot:=
			dev-haskell/language-ecmascript:=
			dev-haskell/language-glsl:=
			dev-haskell/language-lua:=
			dev-haskell/language-python:=
			dev-haskell/shell-escape:=
			dev-haskell/uniplate:= )
	docs? ( app-text/pandoc:=
		dev-haskell/data-default:=
		dev-haskell/hcg-minus:=
		dev-haskell/hps:=
		dev-haskell/icalendar:=
		dev-haskell/pandoc-types:= )
	imgs? ( dev-haskell/ac-ppm:=
		dev-haskell/memory:=
		dev-haskell/attoparsec:=
		dev-haskell/lens:=
		dev-haskell/scientific:=
		dev-haskell/thyme:=
		dev-haskell/xml:=
		>=dev-haskell/zlib-0.6:= )
	!imgs? ( archs? ( >=dev-haskell/zlib-0.6:= ) )
	media? ( dev-haskell/hcodecs:=
			dev-haskell/hunit:=
			dev-haskell/mtl:=
			dev-haskell/old-locale:=
			dev-haskell/random:=
			dev-haskell/idiii:=
			dev-haskell/bitwise:=
			dev-haskell/monad-loops:=
			dev-haskell/mtl:=
			dev-haskell/wavy:= )
	net? ( dev-haskell/concurrent-extra:=
		dev-haskell/dns:=
		dev-haskell/http:=
		dev-haskell/iproute:=
		dev-haskell/network:=
		dev-haskell/network-uri:=
		dev-haskell/unbounded-delays:= )
	pki? ( dev-haskell/hourglass:=
		dev-haskell/asn1-types:=
		dev-haskell/asn1-parse:=
		dev-haskell/cryptonite:=
		dev-haskell/hourglass:=
		dev-haskell/memory:= )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
"

PATCHES=(
	"${FILESDIR}"/${P}-ghc-8.0.2_rc1.patch
	"${FILESDIR}"/${P}-directory-1.3.patch
)

# $1 - target tarball name (not including extension)
make_snapshot() {
	ln -s "${S}" "${WORKDIR}"/"$1" || die
	tar \
		--dereference \
		--directory="${WORKDIR}" \
		--exclude="$1"/bundled/Juicy.Pixels/tests \
		-zcvvf \
		"${WORKDIR}"/"$1".tar.gz "$1"/ || die
}

# As of 2016-09-10 QuickFuzz forks a few hackage packages
# without renames:
# - asn1-encoding: stabilised handling of corrupterd data
# - hogg: more functions are exported directly
# - juicypixels: more functions and modules are exported,
#                unsafe functions are changed to safe
# - svg-tree: upstream, build agains patched juicypixels
# - x509: stabilised handling of corrupterd data
# - megadeth: not a fork but has no releases
# - ttasm: cabalised, renamed module

src_prepare() {
	default

	# inline dependencies of bundled dependencies
	cabal_chdeps \
		'JuicyPixels'   'memory' \
		'asn1-encoding' 'hourglass' \
		'hogg'          'array' \
		'megadeth'      'base' \
		'svg-tree'      'attoparsec, lens, scientific, thyme' \
		'ttasm'         'bitwise, mtl, monad-loops' \
		'x509'          'asn1-parse, cryptonite, hourglass, memory' \
		\
		'hs-source-dirs:      src' 'hs-source-dirs: src, bundled/Juicy.Pixels/src, bundled/hogg, bundled/hs-asn1-encoding, bundled/hs-certificate-x509, bundled/megadeth, bundled/svg-tree/src, bundled/ttasm'
}

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag archs archs) \
		$(cabal_flag codes codes) \
		$(cabal_flag docs docs) \
		$(cabal_flag imgs imgs) \
		$(cabal_flag media media) \
		$(cabal_flag net net) \
		$(cabal_flag pki pki)
}

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="PHP Libsodium extension"
HOMEPAGE="https://pecl.php.net/package/libsodium/2.0.0"
SRC_URI="https://github.com/jedisct1/libsodium-php/archive/2.0.0.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="pam"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-lang/php-7.0.0
	dev-libs/libsodium"

S=${WORKDIR}/libsodium-php-2.0.0

src_configure() {
	if [[ -x ${ECONF_SOURCE:-.}/configure ]] ; then
        econf 
		phpize ${S}
    fi
}

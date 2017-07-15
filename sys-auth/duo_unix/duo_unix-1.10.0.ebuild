# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Duo Unix - Two-Factor Authentication for SSH with PAM Support"
HOMEPAGE="https://duo.com/docs/duounix#overview"
SRC_URI="https://github.com/duosecurity/duo_unix/archive/duo_unix-1.10.0.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="pam"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/openssl
	pam? ( sys-libs/pam )"

S="${WORKDIR}/${PN}-${P}"

src_unpack() {
    if [ "${A}" != "" ]; then
        unpack ${A}
    fi
}


src_configure() {
	configure_options="--prefix=/usr"

	if use pam ; then
		configure_options="$configure_options --with-pam"
	fi

	if [[ -x ${ECONF_SOURCE:-.}/configure ]] ; then
        econf ${configure_options}
    fi
}


src_compile() {
    if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ]; then
        emake || die "emake failed"
    fi
}

src_install() {
    if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]] ; then
        emake DESTDIR="${D}" install
    fi
    einstalldocs
}


# musl

# NOTE: at time of this writing, recommended to use =sys-devel/gcc-12.2.1_p20230428-r1
#       encountering too many problems on gcc-13

# hardened stage3
https://bouncer.gentoo.org/fetch/root/all/releases/amd64/autobuilds/20230507T164658Z/stage3-amd64-musl-hardened-20230507T164658Z.tar.xz

# make portage not suck

cat >/etc/portage/make.conf <<"EOF"
USE="musl hardened -systemd"
MAKEOPTS="-j32 -l32"
COMMON_FLAGS="-O2 -pipe -march=native"
CFLAGS="${COMMON_FLAGS}"
CXXFLAGS="${COMMON_FLAGS}"
FCFLAGS="${COMMON_FLAGS}"
FFLAGS="${COMMON_FLAGS}"

### -*-*-*-*-*-*-*-* NOTICE: change me if not x86_64! -*-*-*-*-*-*-*-*-*-*-*-*
CHOST="x86_64-gentoo-linux-musl"
### -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

EMERGE_DEFAULT_OPTS="--alphabetical --ask --ask-enter-invalid --verbose"
FEATURES="fail-clean parallel-fetch parallel-install network-sandbox ipc-sandbox userpriv userfetch compress-build-logs compressdebug nodoc noinfo -news -ccache"

ACCEPT_LICENSE="-* @FREE @BINARY-REDISTRIBUTABLE GPL-2.0 GPL-3.0"
L10N="en"
LC_MESSAGES=C
ACCEPT_KEYWORDS="~amd64"
EOF

# add musl overlay

emerge --sync
emerge --update --oneshot portage
emerge eselect-repository dev-vcs/git
eselect repository enable musl
emerge --sync musl
rm -rf /etc/portage
copy your /etc/portage config now
# reset profile to muls-hardened with eselect profile
continue with normal lto install

**\* REMEMBER YOU NEED YOUR CHOST SET FOR MUSL OR ELSE GCC WILL FAIL TO BOOTSTRAP \***

## further notes/steps
0. grab gentoo.shellrc aliases
1. emerge sudo
2. pkg a mold
3. uncomment LDFLAGS in make.conf
4.

## note on mold

note: any changes to your toolchain will often require rebuilding mold

```
LDFLAGS= emerge --oneshot sys-devel/mold
```

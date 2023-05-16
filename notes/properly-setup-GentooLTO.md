# Properly set up GentooLTO

0. copy your custom configs over `/etc/portage`
1. comment `include /etc/portage/make.conf.lto` out in make.conf (may
   also need to comment out mold if using mold)
2. add the gentoo-lto overlay
3. install ltoize
4. uncomment `make.conf.lto`
5. update world

if you have tons of ram, like 32gb+ add this to speed up compile to `/etc/fstab`, then `mount /var/tmp/portage`
```
tmpfs		/var/tmp/portage		tmpfs	size=12G,uid=portage,gid=portage,mode=775,nosuid,noatime,nodev	0 0
```

## Commands

```
emerge --sync
emerge --update --oneshot --noreplace portage
emerge --noreplace  eselect-repository dev-vcs/git
eselect repository enable lto-overlay
eselect repository enable mv
emerge --sync lto-overlay
emerge --sync mv
emerge ltoize
# now uncomment make.conf.lto include in your make.conf
# you will notice that at this point nothing will be able to compile
# this is because you are requesting lto but toolchain is not capable of it
#
# rebuild gcc to add lto/pgo/graphite support:
# (note: the change comes from ltoize, notice we are requesting
#        -lto -pgo flags here, this is because we can't use them yet)
mkdir -p /var/tmp/notmpfs
CFLAGS="-O2 -march=native -pipe" USE="-lto -pgo graphite" emerge -av gcc

# set your new gcc as your CC
eselect gcc list
eselect gcc set XXXX

# clean old crap we dont need anymore
emerge --depclean

# rebuild gcc, now with lto/pgo/graphite on itself
# warning: this will take ages
emerge --newuse --with-bdeps y --update --verbose gcc

# ltoize the world
emerge --deep --with-bdeps y --verbose --keep-going @world

# update with any new flags after
emerge --newuse --deep --with-bdeps y --update --verbose --keep-going @world
mkdir -p /var/tmp/notmpfs
```


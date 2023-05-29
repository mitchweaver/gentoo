#!/bin/sh -e

add() {
    emerge --verbose --noreplace "$@"
}

add app-shells/oksh::mitchw

if ! grep oksh /etc/shells >/dev/null ; then
    echo $(which oksh) >> /etc/shells
fi

>&2 echo "You may want to 'chsh -s $(which oksh) mitch'"


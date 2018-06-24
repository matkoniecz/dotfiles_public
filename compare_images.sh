#!/bin/bash
set -Eeuo pipefail
IFS=$'\n\t'

err_report() {
    echo "Error on line $1"
}
trap 'err_report $LINENO' ERR

# from http://www.akikoskinen.info/image-diffs-with-git/
compare $2 $1 png:- | montage -geometry +4+4 $2 - $1 png:- | display -title "$1" - || true
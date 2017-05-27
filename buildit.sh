#!/bin/bash -x
target=$1
tgt=""
case "$target" in
hwup  )
  tgt=rpi-hwup-image
  ;;
base )
  tgt=rpi-base-image
  ;;
tst )
  tgt=rpi-test-image
  ;;
esac
cd ..
source oe-init-build-env rpi-build
pwd # should be in yocto/poky/rpi-build, these things depend on directories
echo "Try to make $tgt$"
bitbake ${tgt}

#!/bin/bash

function die () {
  echo 2>&1 $1
  exit 1
}

if [ $(whoami) != "root" ] ; then
  sudo $0 $@ || die "Not run as root or cannot sudo to root"
  exit $?
fi

THISDIR=$(cd $(dirname $0) && pwd)
CLOUDSTEAD_ADDITIONAL_DBS="cloudos_appstore cloudstead" ${THISDIR}/cloudos/$(basename $0)

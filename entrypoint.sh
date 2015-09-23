#!/usr/bin/env bash

set -e

if (( "$#" != 0 )) ; then
    exec $@
else
    ./update-root-password.sh
    ./run-mysql.sh
fi

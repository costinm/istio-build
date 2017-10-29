#!/bin/bash

set -x
echo $*
echo | /usr/bin/repo init $*

/usr/bin/repo sync -c

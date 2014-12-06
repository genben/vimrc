#!/bin/bash
############################
# .make.sh
# This script creates symlinks to Vim configuration files
############################

# curdir=`dirname $0`
curdir=$(dirname $(readlink -f $0))

ln -s $curdir/vim ~/.vim
ln -s $curdir/vimrc ~/.vimrc

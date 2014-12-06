#!/bin/bash
############################
# .make.sh
# This script creates symlinks to Vim configuration files
############################

curdir=`dirname $0`

ln -s $curdir/vim/vim ~/.vim
ln -s $curdir/vim/vimrc ~/.vimrc

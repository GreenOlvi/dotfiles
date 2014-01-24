#!/bin/sh

curr=$(pwd)
home=$HOME

FILES=".vim
.vimrc
.gvimrc
.bash_aliases
.gitconfig
.screenrc"

mkdir -p "$curr/bak"

for FILE in $FILES
do
   echo "$home/$FILE"
   if [ -e "$home/$FILE" ]
   then
      mv -f "$home/$FILE" "$curr/bak"
   fi
done

cd $home

ln -s "$curr/vim"          "$home/.vim"
ln -s "$curr/vim/vimrc"    "$home/.vimrc"
ln -s "$curr/vim/gvimrc"   "$home/.gvimrc"
ln -s "$curr/bash_aliases" "$home/.bash_aliases"
ln -s "$curr/gitconfig"    "$home/.gitconfig"
ln -s "$curr/screenrc"     "$home/.screenrc"

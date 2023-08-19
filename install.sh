#!/bin/bash

package_name="libsixel"

echo "checking if $package_name is installed"

if pacman -Qs "$package_name" > /dev/null; then
    echo "$package_name is installed"
else
    echo "$package_name is not installed"
    sudo pacman -S "$package_name"
fi

echo "cloning repo to /tmp/ folder..."
cd /tmp/
git clone https://github.com/ayxkaddd/jimmy

clear

echo "installing..."

chmod +x jimmy
sudo mv jimmy /usr/local/bin/

mkdir -p $HOME/.local/jimmy/
mv pics/* $HOME/.local/jimmy/

echo "cleaning..."
rm -rf /tmp/jimmy/
echo "! Done !"


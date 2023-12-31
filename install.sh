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
git clone https://github.com/ayxkaddd/jimmy /tmp/jimmy/

echo "installing..."

chmod +x /tmp/jimmy/jimmy
sudo mv /tmp/jimmy/jimmy /usr/local/bin/

mkdir -p $HOME/.local/share/jimmy/
mv /tmp/jimmy/assets/* $HOME/.local/share/jimmy/

echo "cleaning..."
rm -rf /tmp/jimmy/
echo "! Done !"


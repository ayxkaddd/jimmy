#!/bin/bash

package_name="libsixel"

echo "checking if $package_name is installed"

if pacman -Qs "$package_name" > /dev/null; then
    echo "$package_name is installed"
    read -p "continue to installation? (Y/n): " choice

    if [[ "$choice" == "yes" || "$choice" == "y" || "$choice" == "Y" ]]; then
        echo "okay"
    else
        echo "bleeeh. bye"
        exit 0
    fi
else
    echo "$package_name is not installed"
    read -p "do you want to install $package_name? (Y/n): " choice

    if [[ "$choice" == "yes" || "$choice" == "y"  || "$choice" == "Y" ]]; then
        sudo pacman -S "$package_name"
    else
        echo "bleeeh. bye"
        exit 0
    fi
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


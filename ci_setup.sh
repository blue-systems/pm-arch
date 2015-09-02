#!/bin/sh
set -ex

pacman -Sy --noconfirm archlinux-keyring
pacman -Syu --noconfirm
pacman-db-upgrade
pacman -S --noconfirm git archiso openssh

cd /tmp/working
rm -rf out/
rm -rf work/

if [ -d out && -d work ]; then
    exit 1;
fi

mkdir /run/shm

./build.sh -v


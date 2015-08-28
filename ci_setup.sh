#!/bin/sh
set -ex

pacman -Sy --noconfirm archlinux-keyring
pacman -Syu --noconfirm
pacman-db-upgrade
pacman -S --noconfirm git archiso openssh

cd /tmp/working
rm -rf out/
rm -rf work/

mkdir /run/shm

./build.sh -v


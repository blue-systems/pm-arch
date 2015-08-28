#!/bin/sh
set -ex

cleanup() {
    rm -rf {work, out}
}

pacman -Sy --noconfirm archlinux-keyring
pacman -Syu --noconfirm
pacman-db-upgrade
pacman -S --noconfirm git archiso openssh

cd /tmp/working
cleanup

mkdir /run/shm

./build.sh -v


#!/bin/sh
set -ex

cleanup() {
    rm -rf {work, out}
}

cleanup

pacman-key --refresh
pacman -Syu --noconfirm
pacman-db-upgrade
pacman -S --noconfirm git archiso openssh

cd /tmp/working

mkdir /run/shm

./build.sh -v


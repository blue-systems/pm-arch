#!/bin/sh
set -ex

cleanup() {
    rm -rf {work, out}
}

pacman-key --refresh
pacman -Syu --noconfirm
pacman-db-upgrade
pacman -S --noconfirm git archiso openssh

cd /tmp/working

mkdir /run/shm

./build.sh -v

iso_name=archlinux-$(date +%Y.%m.%d)-x86_64.iso

scp -i ~/.ssh/arch.pem out/$iso_name ubuntu@54.246.99.99:/var/www/ISO/plasma-mobile/$iso_name
echo "ISO uploaded successfully"

cleanup

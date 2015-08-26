#!/bin/sh
set -ex

bash

pacman-key --refresh
pacman -Syu --noconfirm
pacman-db-upgrade
pacman -S --noconfirm git archiso openssh

cp -r /tmp/working /tmp/working2

cd /tmp/working2

./build.sh -v

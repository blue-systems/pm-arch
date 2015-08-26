#!/bin/sh
set -ex

bash

pacman-key --refresh
pacman -Syu --noconfirm
pacman-db-upgrade
pacman -S --noconfirm git archiso openssh

cd /tmp/working

./build.sh -v

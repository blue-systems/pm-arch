#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# === This file is part of Calamares - <http://github.com/calamares> ===
#
#   Copyright 2014, Teo Mrnjavac <teo@kde.org>
#
#   Calamares is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   Calamares is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with Calamares. If not, see <http://www.gnu.org/licenses/>.

import libcalamares


def run():

    root_mount_point = libcalamares.globalstorage.value("rootMountPoint")
    target_kernel_path = "{}/boot/vmlinuz-linux".format(root_mount_point)

    libcalamares.utils.debug("Removing the dhcpcd rule for eth0")
    libcalamares.utils.check_chroot_call(["rm", "/etc/udev/rules.d/81-dhcpcd.rules"])

    libcalamares.utils.debug("Removing pacman's choose-mirror service")
    libcalamares.utils.check_chroot_call(["systemctl", "disable", "pacman-init.service", "choose-mirror.service"])
    libcalamares.utils.check_chroot_call(["rm", "-r", "/etc/systemd/system/choose-mirror.service"])
    libcalamares.utils.check_chroot_call(["rm", "-r", "/etc/systemd/system/pacman-init.service"])
    libcalamares.utils.check_chroot_call(["rm", "-r", "/etc/systemd/system/etc-pacman.d-gnupg.mount"])
    libcalamares.utils.check_chroot_call(["rm", "/etc/systemd/scripts/choose-mirror"])

    libcalamares.utils.debug("Removed un-necessary files")
    libcalamares.utils.check_chroot_call(["rm", "-r", "/etc/mkinitcpio-archiso.conf"])
    libcalamares.utils.check_chroot_call(["rm", "-r", "/etc/initcpio"])

    os.system("cp -vaT /run/archiso/bootmnt/arch/boot/x86_64/vmlinuz {}".format(target_kernel_path))

    return None

# plasma-arch

Attempt to make Plasma Mobile available on the Arch Linux base.

# Introduction

Plasma Mobile offer a Free (as in Freedom and beer), user-friendly, privacy-enabling and customizable platform for mobile devices. Plasma Mobile is Free software and developed in an open process. Plasma Mobile is currently under development, a prototype running on a smartphone and providing basic functionality is available.

Currently KUbuntu based reference images are available which is flashable on LG Nexus 5 and some other images. Also there is amd64 LiveCD available.

This project in perticular attempts to have Arch Linux based Plasma Mobile images.

# Planning

Plan of action to provide Arch Linux based images for Plasma mobile

## Milestone 1

- [ ] Remaster Arch Linux ISO and have minimum packages required for kwin_wayland/plasma-workspace
- [ ] Organize required packages for the plasma-mobile
- [ ] Write PKGBUILDs for the missing packages
- [ ] Provide Plasma mobile images based on the amd64/x86_64 which allows to test plasma-mobile

## Milestone 2

- [ ] Have Arch Linux ARM installed on the Nexus 5
- [ ] Package Plasma Mobile packages for armv7
- [ ] Remaster alarm image to have Plasma Mobile components installed
- [ ] Have it tested on other devices

# Current status

Currently archiso tool is used to create remastered Arch Linux x86_64 image. This is modified releng profile of ArchISO.

# plasma-arch

Attempt to make Plasma Mobile available on the Arch Linux base.

# Introduction

Plasma Mobile offer a Free (as in Freedom and beer), user-friendly, privacy-enabling and customizable platform for mobile devices. Plasma Mobile is Free software and developed in an open process. Plasma Mobile is currently under development, a prototype running on a smartphone and providing basic functionality is available.

Currently KUbuntu based reference images are available which is flashable on LG Nexus 5 and some other images. Also there is amd64 LiveCD available.

This project in perticular attempts to have Arch Linux based Plasma Mobile images.

# Planning

Plan of action to provide Arch Linux based images for Plasma mobile

## Milestone 1

- [x] Remaster Arch Linux ISO and have minimum packages required for kwin_wayland/plasma-workspace
- [x] Organize required packages for the plasma-mobile ( see #1 )
- [x] Write PKGBUILDs for the missing packages
- [x] Provide Plasma mobile images based on the amd64/x86_64 which allows to test plasma-mobile

## Milestone 2

- [ ] Have Arch Linux ARM installed on the Nexus 5
- [ ] Package Plasma Mobile packages for armv7
- [ ] Remaster alarm image to have Plasma Mobile components installed
- [ ] Have it tested on other devices

# Current status

~~Currently archiso tool is used to create remastered Arch Linux x86_64 image. This is modified releng profile of ArchISO.~~

- Initial scripts for remastering ISO based on archiso tool
- Some of core packages packaged and available on : http://arch.pangea.pub/plasma-mobile/ (Only 64 bit packages are available)

Add in pacman.conf

```
[plasma-mobile]
SigLevel = Optional
Server = http://arch.pangea.pub/plasma-mobile/$arch
```

# Creating ISO

## On non-arch hosts

```
docker run --rm=true --privileged=true -v `pwd`:/tmp/working \
     -v /var/cache/pacman:/var/cache/pacman \
     base/archlinux /tmp/working/ci_setup.sh
```

## On arch hosts

```
git clone https://github.com/bhush9/plasma-arch.git
cd plasma-arch
sudo build.sh -v
```

# Co-installing with Plasma packages

This method is unsupported since, some stuffs are not working nicely with plasma-desktop and have side effects on plasma-desktop like notifications applet from plasma-mobile is loaded in the desktop session and much more.

```
sudo pacman -Syu
sudo pacman -S qt5-wayland
sudo pacman -S plasma-phone-components-git plasma-mobile-git \
               kwinwrapper-git plasma-maliit-framework-git \
               plasma-maliit-plugins-git plasma-settings-git
```

Once installed, switch to tty2 and run `kwinwrapper`

# Adding package in ISO

If you want to add new packages in ISO just add its package name in packages.both file.

# Custom packages that are not available in repository

Open a issue if you want new application to be packaged in [plasma-mobile] repository


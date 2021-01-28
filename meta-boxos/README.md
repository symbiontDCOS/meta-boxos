This README file contains information on the contents of the meta-boxos layer.

Please see the corresponding sections below for details.

Dependencies
============

  URI: git://git.yoctoproject.org/poky.git  
  branch: dunfell

  URI: git://git.openembedded.org/openembedded-core  
  branch: dunfell

  URI: git://git.yoctoproject.org/meta-intel  
  branch: dunfell

  URI: git://git.yoctoproject.org/meta-cloud-services  
  branch: dunfell

  URI: git://git.yoctoproject.org/meta-virtualization  
  branch: dunfell

  .
  .
  .

Patches
=======

Please submit any patches against the meta-boxos layer to the xxxx mailing list (xxxx@zzzz.org)
and cc: the maintainer:

Maintainer: XXX YYYYYY <xxx.yyyyyy@zzzzz.com>

Table of Contents
=================

  I. Adding the meta-distro layer to your build
 II. Misc


I. Adding the meta-distro layer to your build
=================================================

Run 'bitbake-layers add-layer meta-distro'

II. Misc
========

## Systemd Components

Meta-boxos creates a systemd based container operating system.  There is no docker/podman software installed with this layer. 
It makes use of the primitives provided by systemd only.  The following systemd features are installed:

- systemd-networkd  
- systemd-resolved  
- systemd-nspawn  
- systemd-portabled  
- systemd-hostnamed  
- systemd-timedated  
- systemd-timesyncd

## Control Plane 

The control plane consists of a `SaltStack Minion` and `pystemd` python library.  `Nspawn` and `Portable Service` images are `zstd` compressed `btrfs subvolumes`.  

## Image Attributes

Meta-boxos provides for A/B type root partition based upon the [Discoverable Partitions Specification](https://systemd.io/DISCOVERABLE_PARTITIONS/) and 
uses `systemd-boot` as its bootloader.


## Notes

yocto01➜  build  ᐅ  bitbake-layers show-layers
NOTE: Starting bitbake server...
layer                 path                                      priority  

meta                  /home/rcallicotte/poky/meta               5  
meta-poky             /home/rcallicotte/poky/meta-poky          5  
meta-yocto-bsp        /home/rcallicotte/poky/meta-yocto-bsp     5  
meta-systemd          /home/rcallicotte/build/meta-systemd      6  
meta-intel            /home/rcallicotte/build/meta-intel        5  
meta-oe               /home/rcallicotte/build/meta-openembedded/meta-oe  6  
meta-filesystems      /home/rcallicotte/build/meta-openembedded/meta-filesystems  6  
meta-networking       /home/rcallicotte/build/meta-openembedded/meta-networking  5  
meta-python           /home/rcallicotte/build/meta-openembedded/meta-python  7  
meta-cloud-services   /home/rcallicotte/build/meta-cloud-services  5  
meta-webserver        /home/rcallicotte/build/meta-openembedded/meta-webserver  6  
meta-virtualization   /home/rcallicotte/build/meta-virtualization  8  
meta-openstack        /home/rcallicotte/build/meta-cloud-services/meta-openstack  5  
meta-boxos            /home/rcallicotte/build/meta-boxos        6  
meta-saltstack        /home/rcallicotte/build/meta-saltstack    6  


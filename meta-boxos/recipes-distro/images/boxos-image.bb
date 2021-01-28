DESCRIPTION = "A console-only image based around systemd."

IMAGE_FEATURES += "ssh-server-openssh"

IMAGE_INSTALL = "\
    packagegroup-core-boot \
    packagegroup-core-full-cmdline \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    "


IMAGE_INSTALL += "dmidecode systemd-container python3 python3-pystemd"
IMAGE_INSTALL += "btrfs-tools glusterfs glusterfs-server glusterfs-fuse zstd"
IMAGE_INSTALL += "kernel-module-bridge"

PACKAGE_EXCLUDE = "busybox-udhcpc"

inherit core-image

TARGETS = mountkernfs.sh hostname.sh udev mountdevsubfs.sh networking mountall.sh mountall-bootclean.sh urandom hwclock.sh mountnfs.sh mountnfs-bootclean.sh checkroot.sh procps checkfs.sh checkroot-bootclean.sh bootmisc.sh mtab.sh kmod udev-mtab
INTERACTIVE = udev checkroot.sh checkfs.sh
udev: mountkernfs.sh
mountdevsubfs.sh: mountkernfs.sh udev
networking: mountkernfs.sh mountall.sh mountall-bootclean.sh urandom
mountall.sh: checkfs.sh checkroot-bootclean.sh
mountall-bootclean.sh: mountall.sh
urandom: mountall.sh mountall-bootclean.sh hwclock.sh
hwclock.sh: mountdevsubfs.sh
mountnfs.sh: mountall.sh mountall-bootclean.sh networking
mountnfs-bootclean.sh: mountall.sh mountall-bootclean.sh mountnfs.sh
checkroot.sh: hwclock.sh mountdevsubfs.sh hostname.sh
procps: mountkernfs.sh mountall.sh mountall-bootclean.sh udev
checkfs.sh: checkroot.sh mtab.sh
checkroot-bootclean.sh: checkroot.sh
bootmisc.sh: mountnfs-bootclean.sh checkroot-bootclean.sh mountall-bootclean.sh mountall.sh mountnfs.sh udev
mtab.sh: checkroot.sh
kmod: checkroot.sh
udev-mtab: udev mountall.sh mountall-bootclean.sh

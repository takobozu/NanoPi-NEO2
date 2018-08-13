setenv kernel_file	Image
setenv initrd_file	rootfs.cpio.gz
setenv rootfstype	ext2
setenv fdtfile		sun50i-h5-nanopi-neo2.dtb
setenv bootoptionarg	isolcups=1-3 nohz_full=1-3 rcu_nocbs=1-3
setenv ramrootarg rootfstype=${rootfstype}

setenv bootargs console=${console} ${optargs} ${ramrootarg} ${bootoptionarg}

echo "fdt_addr_r	$fdt_addr_r"
echo "ramdisk_addr_r	$ramdisk_addr_r"
echo "kernel_addr_r	$kernel_addr_r"

load mmc 0:1 ${fdt_addr_r}	${fdtfile}
load mmc 0:1 ${ramdisk_addr_r}	${initrd_file};setenv initrd_size ${filesize}
load mmc 0:1 ${kernel_addr_r}	${kernel_file}

booti ${kernel_addr_r} ${ramdisk_addr_r}:${initrd_size} ${fdt_addr_r}


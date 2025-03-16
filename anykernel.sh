### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=Zundamon Kernel by Helium_Studio
do.devicecheck=1
do.cleanup=1
device.name1=raphael
device.name2=raphaelin
supported.versions=11 - 15
'; } # end properties

### AnyKernel install
# boot shell variables
BLOCK=/dev/block/bootdevice/by-name/boot;
IS_SLOT_DEVICE=0;
NO_BLOCK_DISPLAY=1;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
split_boot;
flash_boot;
## end boot install

# dtbo install
flash_dtbo;
## end dtbo install

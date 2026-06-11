### AnyKernel custom methods
## Helium_Studio @ CoolApk

patch_dtb() {
  grep -q "logical" /vendor/etc/fstab.qcom;
  if [ $? -eq 0 ]; then
    fdtput $AKHOME/dtb /firmware/android boot_devices soc/1d84000.ufshc -ts;
    fdtput $AKHOME/dtb /firmware/android/vbmeta compatible -d;
    fdtput $AKHOME/dtb /firmware/android/vbmeta parts -d;
    fdtput $AKHOME/dtb -r /firmware/android/fstab;
    ui_print " " "Retrofit dynamic partitions detected. Using patched dtb...";
  else
    fs_type=$(mount | grep ' /vendor ' | awk '{print $5}');
    if [ "$fs_type" = "erofs" ]; then
      fdtput $AKHOME/dtb /firmware/android/fstab/vendor type erofs -ts;
      fdtput $AKHOME/dtb /firmware/android/fstab/vendor mnt_flags ro -ts;
      ui_print " " "Vendor EROFS detected. Using patched dtb...";
    else
      ui_print " " "No special cases detected. Using default dtb...";
    fi;
  fi;

  cat $AKHOME/Image.gz $AKHOME/dtb > $AKHOME/Image.gz-dtb;
  rm -f $AKHOME/Image.gz $AKHOME/dtb;
}

patch_super_resolution() {
  ANDROID_VERSION=$(file_getprop /system/build.prop ro.build.version.release);
  ANDROID_MAJOR=${ANDROID_VERSION%%.*};
  if [ "$ANDROID_MAJOR" -ge 16 ] 2>/dev/null; then
    ui_print " " "Enabling super-resolution enhancement...";
    patch_cmdline "super_resolution" "super_resolution=10";
  else
    patch_cmdline "super_resolution" "super_resolution=1";
  fi;
}

clean_cache() {
  ui_print " " "Installation done. Cleaning cache...";
  rm -rf /cache/*;
  rm -rf /data/dalvik-cache;
  rm -rf /data/resource-cache;
  rm -rf /data/system/package_cache;
}

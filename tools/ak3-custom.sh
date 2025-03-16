### AnyKernel custom methods
## Helium_Studio @ CoolApk

patch_dtb() {
  grep -q "logical" /vendor/etc/fstab.qcom;
  if [ $? -eq 0 ]; then
    fdtput -t s $AKHOME/dtb /firmware/android/boot_devices "soc/1d84000.ufshc";
    fdtput -d $AKHOME/dtb /firmware/android/shared_meta;
    fdtput -d $AKHOME/dtb /firmware/android/android_q_fstab;
    ui_print " " "Retrofit dynamic partitions detected. Using patched dtb...";
  else
    fs_type=$(mount | grep ' /vendor ' | awk '{print $5}');
    if [ "$fs_type" = "erofs" ]; then
      fdtput $AKHOME/dtb /firmware/android/android_q_fstab/vendor type "erofs";
      fdtput $AKHOME/dtb /firmware/android/android_q_fstab/vendor mnt_flags "ro";
      ui_print " " "Vendor EROFS detected. Using patched dtb...";
    else
      ui_print " " "No special cases detected. Using default dtb...";
    fi;
  fi;
}

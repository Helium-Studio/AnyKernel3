### AnyKernel custom methods
## Helium_Studio @ CoolApk

clean_cache() {
  ui_print " " "Installation done. Cleaning cache...";
  rm -rf /cache/*;
  rm -rf /data/dalvik-cache;
  rm -rf /data/resource-cache;
  rm -rf /data/system/package_cache;
}

### AnyKernel custom methods
## Helium_Studio @ CoolApk

merge_dtb() {
  cat $AKHOME/Image.gz $AKHOME/dtb > $AKHOME/Image.gz-dtb;
  rm -f $AKHOME/Image.gz $AKHOME/dtb;
}

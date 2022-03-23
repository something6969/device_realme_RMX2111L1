#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:134217728:44fcbc33f02c941bea9e34a23659cd5908940815; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot:33554432:62f461464cae18287a28abf0d7b8fa3d1833a640 \
          --target EMMC:/dev/block/by-name/recovery:134217728:44fcbc33f02c941bea9e34a23659cd5908940815 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi

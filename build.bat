@echo off

adb shell "mkdir /data/local/tmp"
adb shell su -c "rm -R /data/local/tmp/*"
adb push "busybox" "/data/local/tmp"
adb shell "chmod 755 /data/local/tmp/busybox"
adb push "Release\%1" "/data/local/tmp"
adb push "build.sh" "/data/local/tmp"
adb shell "chmod 755 /data/local/tmp/build.sh"
adb shell su -c "sh /data/local/tmp/build.sh %1"
adb shell su -c "chmod 666 /data/local/tmp/%1.tar.gz"
adb pull "/data/local/tmp/%1.tar.gz" "Output\%1.tar.gz"
adb shell su -c "rm -R /data/local/tmp/*"

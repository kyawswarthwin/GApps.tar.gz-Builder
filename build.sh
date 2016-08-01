export PATH=/data/local/tmp:$PATH

cd /data/local/tmp
busybox chown -R 0.0 system
busybox chmod -R 0644 system
busybox chmod 0755 system
busybox chmod 0755 system/addon.d
busybox chmod 0755 system/addon.d/70-gapps.sh
busybox chmod 0755 system/app
busybox chmod 0755 system/etc
busybox chmod 0755 system/etc/permissions
busybox chmod 0755 system/framework
busybox chmod 0755 system/lib
busybox chmod 0755 system/priv-app
busybox tar -cvzf $1.tar.gz system

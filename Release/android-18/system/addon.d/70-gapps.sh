#!/sbin/sh
# 
# /system/addon.d/70-gapps.sh
#
. /tmp/backuptool.functions

list_files() {
cat <<EOF
app/Gmail.apk
app/GmsCore.apk
app/GoogleBackupTransport.apk
app/GoogleCalendarSyncAdapter.apk
app/GoogleContactsSyncAdapter.apk
app/GoogleFeedback.apk
app/GoogleLoginService.apk
app/GooglePartnerSetup.apk
app/GoogleServicesFramework.apk
app/Hangouts.apk
app/NetworkLocation.apk
app/Phonesky.apk
app/SetupWizard.apk
etc/g.prop
etc/permissions/com.google.android.maps.xml
etc/permissions/com.google.android.media.effects.xml
etc/permissions/com.google.widevine.software.drm.xml
etc/permissions/features.xml
framework/com.google.android.maps.jar
framework/com.google.android.media.effects.jar
framework/com.google.widevine.software.drm.jar
lib/libgtalk_jni.so
lib/libgtalk_stabilize.so
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/$FILE
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/$FILE $R
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac

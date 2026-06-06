#!/system/bin/sh
# Logo Switcher - uninstall.sh
# Runs when module is removed via KSU Next manager

MODDIR="/data/adb/modules/logo_switcher"
LOGO_PART="/dev/block/by-name/logo"
BACKUP_PATH="${MODDIR}/logo_backup.img"

if [ -f "$BACKUP_PATH" ] && [ -b "$LOGO_PART" ]; then
    dd if="$BACKUP_PATH" of="$LOGO_PART" 2>/dev/null
fi

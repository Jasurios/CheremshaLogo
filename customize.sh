#!/system/bin/sh
# Logo Switcher - customize.sh
# Runs once during module installation

MODDIR="${MODPATH}"
LOGO_PART="/dev/block/by-name/logo"
BACKUP_PATH="${MODDIR}/logo_backup.img"
NEW_LOGO="${MODDIR}/logo.img"

ui_print "==============================="
ui_print "  Logo Switcher by Jasurios    "
ui_print "==============================="

# Backup original partition
ui_print "[*] Backing up original logo partition..."
dd if="$LOGO_PART" of="$BACKUP_PATH" 2>/dev/null
if [ $? -ne 0 ]; then
    abort "[!] Backup failed. Aborting."
fi
ui_print "[+] Backup saved to: logo_backup.img"

# Flash new logo
ui_print "[*] Flashing new logo..."
dd if="$NEW_LOGO" of="$LOGO_PART" 2>/dev/null
if [ $? -ne 0 ]; then
    ui_print "[!] Flash failed! Restoring backup..."
    dd if="$BACKUP_PATH" of="$LOGO_PART" 2>/dev/null
    abort "[!] Restored original. Aborting."
fi

ui_print "[+] New logo flashed successfully!"
ui_print "[*] Reboot to see changes."
ui_print "==============================="

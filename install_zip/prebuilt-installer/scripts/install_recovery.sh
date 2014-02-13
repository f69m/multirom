#!/sbin/sh

set -e

if [ -r /dev/block/mmcblk0p4-orig ]; then
	# Modified recovery
	dd if=/tmp/twrp.blob of=/dev/block/mmcblk0p4-orig
else
	# Unmodifed recovery (first time install?)
	dd if=/tmp/twrp.blob of=/dev/block/mmcblk0p4
fi


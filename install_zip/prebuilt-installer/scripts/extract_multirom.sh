#!/sbin/sh
base=""
if [ -d "/data/media/multirom" ] ; then
    base="/data/media/multirom"
elif [ -d "/data/media/0/multirom" ] ; then
    base="/data/media/0/multirom"
else
    if [ -d "/data/media/0" ] ; then
        base="/data/media/0/multirom"
    else
        base="/data/media/multirom"
    fi

    mkdir "$base"
    chown root:root "$base"
    chmod 770 "$base"

    mkdir "$base/roms"
    chown media_rw:media_rw "$base/roms"
    chmod 777 "$base/roms"

    mkdir "$base/roms/Primary"
    chown media_rw:media_rw "$base/roms/Primary"
    chmod 777 "$base/roms/Primary"

    touch "$base/.nomedia"
    chown media_rw:media_rw "$base/.nomedia"
fi

rm "$base/boot.img-ubuntu"*
rm "$base/infos/"*
cp -r /tmp/multirom/* "$base/"
chmod 755 "$base/multirom"
chmod 755 "$base/busybox"
chmod 750 "$base/trampoline"
chmod 755 "$base/kexec"
chmod 755 "$base/ntfs-3g"
chmod 755 "$base/exfat-fuse"
chmod 755 "$base/lz4"

# This makes does not allows access for media scanner on android, but
# still is enough for ubuntu
chmod 770 "$base"
chown root:root "$base"

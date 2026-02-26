#!/bin/bash

if [ -z "$1" ] || [ ! -f "$1" ]; then
  echo "Invalid file specified"
  exit 1
fi

commands="7z unsquashfs mksquashfs mkpasswd"
for command in $commands; do
    command -v "$command" > /dev/null
    if [ $? -ne 0 ]; then
        echo "Command $command not found"
        exit 1
    fi
done

downloaded_image=$1
old_image_name=$(basename $downloaded_image)
# CR4CU220812S11_ota_img_V1.3.3.5.img
BOARD_SHORT_NAME=$(echo $old_image_name | awk -F '_' '{print $1}')
VERSION=$(echo $old_image_name | awk -F '_' '{print $4}')
CREALITY_VERSION=$(echo $VERSION | sed 's/.img//g' | tr -d 'V')
FIRMWARE_PASSWORD=$(mkpasswd -m md5 "${BOARD_SHORT_NAME}C3_7e_bz" -S cxswfile)
version="${CREALITY_VERSION}"

board_name=$(echo "$old_image_name" | grep -o "\(CR.*\)ota" | sed 's/_ota//g')
old_directory="${board_name}_ota_img_V${CREALITY_VERSION}"
old_sub_directory="ota_v${CREALITY_VERSION}"
directory="${board_name}_ota_img_V${version}"
sub_directory="ota_v${version}"

if [ -d /tmp/$old_directory ]; then
    rm -rf /tmp/$old_directory
fi

7z x $downloaded_image -p"$FIRMWARE_PASSWORD" -o/tmp
rootfs_filename=$(echo $old_image_name | sed 's/\.img/.rootfs.squashfs/g')
cat /tmp/$old_directory/$old_sub_directory/rootfs.squashfs.* > /tmp/$rootfs_filename
echo "Resulting rootfs is /tmp/$rootfs_filename"

rm -rf /tmp/$old_directory

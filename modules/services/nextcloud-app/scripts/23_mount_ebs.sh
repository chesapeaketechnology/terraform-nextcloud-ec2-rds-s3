#!/bin/bash
# Mount config
mkfs -t ext4 /dev/xvdg
mkdir ${data_dir}
mount /dev/xvdg ${data_dir}
echo /dev/xvdg  ${data_dir} ext4 defaults,nofail 0 2 >> /etc/fstab



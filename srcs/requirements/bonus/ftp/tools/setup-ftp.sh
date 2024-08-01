#!/bin/bash

useradd "$FTP_USER"
passwd "$FTP_USER" << EOF
$FTP_PASSWORD
$FTP_PASSWORD
EOF

echo "$FTP_USER" > /etc/vsftpd.chroot_list

chown -R "$FTP_USER":www-data /var/www/html
usermod -d /var/www/html "$FTP_USER"

$@

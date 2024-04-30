#!/bin/bash
service mariadb start;
sleep 1;

mysql_secure_installation <<EOF

Y
Y
$SQL_ROOT_PASSWORD
$SQL_ROOT_PASSWORD
Y
Y
Y
Y
EOF

mysql -u root -p$SQL_ROOT_PASSWORD -e "

CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;

CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';

GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';

FLUSH PRIVILEGES;

";

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown;

$@

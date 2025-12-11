#!/usr/bin/env bash
set -e

NEXTCLOUD_VERSION="latest"
WEBROOT="/var/www"
NC_DIR="${WEBROOT}/nextcloud"

cd /tmp
wget "https://download.nextcloud.com/server/releases/${NEXTCLOUD_VERSION}.zip" -O nextcloud.zip
unzip nextcloud.zip

sudo mv nextcloud "${NC_DIR}"
sudo chown -R www-data:www-data "${NC_DIR}"

sudo cp configs/apache/nextcloud.conf /etc/apache2/sites-available/nextcloud.conf

sudo a2ensite nextcloud.conf
sudo a2dissite 000-default.conf
sudo systemctl reload apache2

echo "Nextcloud installed at ${NC_DIR}."

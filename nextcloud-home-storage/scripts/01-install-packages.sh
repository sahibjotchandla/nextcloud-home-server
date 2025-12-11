#!/usr/bin/env bash
set -e

sudo apt update

sudo apt install -y   apache2   mariadb-server   redis-server   unzip   wget   php   libapache2-mod-php   php-cli   php-gd   php-mysql   php-curl   php-xml   php-zip   php-mbstring   php-intl   php-bz2   php-gmp   php-imagick

sudo a2enmod rewrite headers env dir mime ssl

sudo systemctl enable --now apache2
sudo systemctl enable --now mariadb
sudo systemctl enable --now redis-server

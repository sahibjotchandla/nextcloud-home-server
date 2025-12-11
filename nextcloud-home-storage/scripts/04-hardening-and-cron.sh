#!/usr/bin/env bash
set -e

echo ">>> Run 'sudo mysql_secure_installation' for DB hardening."

if sudo -u www-data crontab -l >/dev/null 2>&1; then
  echo "Cron already exists for www-data."
else
  sudo -u www-data crontab configs/system/cron-nextcloud.example
  echo "Cron installed."
fi

echo "Review /etc/fstab, HTTPS config, firewall rules before internet exposure."

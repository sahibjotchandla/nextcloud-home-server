# Nextcloud Home Storage

Self-hosted private cloud storage platform running Nextcloud on Ubuntu Server, using Apache, MariaDB, Redis, and multiple data disks.  

Accessible from LAN clients (desktop + mobile).

> ⚠️ All IPs, hostnames, UUIDs, and passwords in this repo are placeholders. Replace them with your own values if you want to implement this service.

---

## 🧱 Architecture Overview

**Platform:** Ubuntu Server 24.04 LTS (VirtualBox on Windows)

**Services Included:**
- Apache2 + PHP 8.x (Nextcloud web application)
- MariaDB (Nextcloud database)
- Redis (local cache)
- Cron (Nextcloud background jobs)

> ⚠️ Replace the storage layout with personal disk space if you want to implement this service. Follow the format for any VM tweaking.
**Storage Layout:**
- 220GB SSD → `/mnt/nextcloud-data`
- 110GB SSD → `/mnt/nextcloud-extra`

**Networking:**
- VirtualBox Bridged Adapter → LAN IP (e.g., `<VM_LAN_IP>`)
- Optional Host-Only Adapter (`192.168.56.x`) for Windows admin access

**Clients:**
- Windows desktop browser
- iOS Safari
- iOS Nextcloud Mobile App

See `diagrams/architecture.md` for a diagram explanation.

---

## 📂 Repository Layout

```text
configs/apache/nextcloud.conf             # Apache vhost example
configs/nextcloud/config.php.example      # Sanitized Nextcloud config.php
configs/system/fstab.example              # Example /etc/fstab entries
configs/system/cron-nextcloud.example     # Cron entry for background jobs

mariadb/init-nextcloud.sql                # DB + user initialization script

scripts/01-install-packages.sh            # Install Apache, PHP, MariaDB, Redis
scripts/02-prepare-disks.sh               # Format + mount + chown data disks
scripts/03-configure-apache-nextcloud.sh  # Download + configure Nextcloud
scripts/04-hardening-and-cron.sh          # Hardening and cron job setup

diagrams/architecture.md                  # Architecture explanation

docker/README.md                          # Planned Dockerization notes
terraform/README.md                       # Planned Terraform/IaC notes
```

---

## 🔧 Manual Setup Flow (High-Level)

All scripts are examples for educational use.  
Adjust placeholders before running.

### 1. Prepare the VM

Create an Ubuntu Server VM with:

- 2 vCPUs  
- 4GB RAM (minimum recommended)  
- Two virtual disks (220GB + 110GB)  
- Networking:
  - Adapter 1: Bridged (LAN access)
  - Adapter 2: Host-only (optional admin access)

### 2. Clone this repository

```bash
sudo apt update && sudo apt install -y git
git clone https://github.com/YOUR_GITHUB_USERNAME/nextcloud-home-storage.git
cd nextcloud-home-storage
```

### 3. Install core packages

```bash
sudo chmod +x scripts/*.sh
./scripts/01-install-packages.sh
```

### 4. Prepare disks

> Adjust `/dev/sdb` and `/dev/sdc` inside the script first using `lsblk`.

```bash
./scripts/02-prepare-disks.sh
```

### 5. Configure Apache + Nextcloud

```bash
./scripts/03-configure-apache-nextcloud.sh
```

Then open in a browser:

```text
http://<VM_LAN_IP>/
```

### 6. Initialize the database

```bash
sudo mysql < mariadb/init-nextcloud.sql
```

Use these values during the web installation.

### 7. Complete Nextcloud install

- Data directory: `/mnt/nextcloud-data`
- Database: values from `mariadb/init-nextcloud.sql`

### 8. Install cron

```bash
./scripts/04-hardening-and-cron.sh
```

---

## 🚀 Future Enhancements

Planned but not implemented yet:

- Docker Compose deployment of:
  - Nextcloud
  - MariaDB
  - Redis
- Terraform module to reproduce this environment on a cloud provider
- Reverse proxy + HTTPS (Caddy/Nginx + Let's Encrypt)
- Monitoring + alerting
- Backup strategy

---

## ⚠️ Disclaimer

This project is for portfolio purposes. Please. review and secure all configs (HTTPS, authentication, monitoring) before exposing the service **outside** your LAN.

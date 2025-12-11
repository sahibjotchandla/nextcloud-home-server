# Architecture Diagram (Text Description)

## Components

### Host Machine (Windows)
- Runs VirtualBox
- Can auto-start the VM using Task Scheduler

### Virtual Machine (Ubuntu Server)
- Adapter 1: Bridged → LAN IP (<VM_LAN_IP> placeholder)
- Services:
  - Apache + PHP
  - MariaDB
  - Redis
  - Cron

### Storage
- 220GB → /mnt/nextcloud-data
- 110GB → /mnt/nextcloud-extra

### Clients
- Windows Browser → http://<VM_LAN_IP>
- iOS Safari → http://<VM_LAN_IP>
- iOS Nextcloud App → http://<VM_LAN_IP>

## Suggested Diagram Elements
- Box for Windows Host → VirtualBox → Ubuntu VM
- Service stack inside VM
- Two storage disks attached
- LAN cloud showing clients connecting

-- Example MariaDB initialization script for Nextcloud.

CREATE DATABASE nextcloud
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

CREATE USER 'ncuser'@'localhost'
  IDENTIFIED BY 'CHANGE_ME_STRONG_DB_PASSWORD';

GRANT ALL PRIVILEGES ON nextcloud.* TO 'ncuser'@'localhost';

FLUSH PRIVILEGES;

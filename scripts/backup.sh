#!/bin/bash

# Pindah ke direktori tempat .env berada (asumsi skrip dijalankan dari dalam folder scripts/)
cd ..

# Memuat variabel rahasia dari file .env
source .env

# Membuat format nama file dengan tanggal dan jam (contoh: backup_db_2026-05-29_17-05-00.sql)
TANGGAL=$(date +%F_%H-%M-%S)
NAMA_FILE="scripts/backup_db_$TANGGAL.sql"

echo "Memulai backup database..."

# Menjalankan dump menggunakan variabel dari .env (tanpa hardcode!)
docker exec docker-db-1 mysqldump -u root -p"${MYSQL_ROOT_PASSWORD}" ${MYSQL_DATABASE} > $NAMA_FILE

echo "Backup berhasil disimpan dengan nama: $NAMA_FILE"
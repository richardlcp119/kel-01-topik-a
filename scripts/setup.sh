#!/bin/bash

echo "Memperbarui sistem..."
sudo apt update && sudo apt upgrade -y

echo "Menginstal Docker & Docker Compose..."
sudo apt install docker.io docker-compose -y
sudo systemctl enable docker
sudo systemctl start docker

echo "Mengonfigurasi Firewall (UFW)..."
sudo apt install ufw -y
# Aturan keamanan jaringan wajib dari dosen
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 2222/tcp  # Port SSH yang sudah diamankan
sudo ufw allow 80/tcp    # Port HTTP
sudo ufw allow 443/tcp   # Port HTTPS
# Force enable agar tidak meminta konfirmasi 'y/n' saat instalasi otomatis
sudo ufw --force enable 

echo "Menginstal & Mengaktifkan Fail2Ban..."
sudo apt install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo "Setup Infrastruktur Selesai dan Aman!"
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing Docker..."
sudo apt install docker.io docker-compose -y

echo "Installing Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Installing UFW..."
sudo apt install ufw -y

echo "Installing Fail2Ban..."
sudo apt install fail2ban -y

echo "Setup Selesai!"

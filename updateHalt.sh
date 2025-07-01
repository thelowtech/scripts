sudo apt clean
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt dist-upgrade -y
sudo apt autoclean -y
sudo apt autoremove --purge -y
sudo shutdown -h now

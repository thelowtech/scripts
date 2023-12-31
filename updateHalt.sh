export DEBIAN_FRONTEND=noninteractive
sudo apt clean
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoclean -y
sudo apt autoremove --purge -y
sudo shutdown -h now

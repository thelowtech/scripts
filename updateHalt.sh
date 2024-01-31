export DEBIAN_FRONTEND=noninteractive
sudo apt clean
sudo apt update
sudo apt DEBIAN_FRONTEND=noninteractive upgrade -y
sudo apt DEBIAN_FRONTEND=noninteractive dist-upgrade -y
sudo apt autoclean -y
sudo apt autoremove --purge -y
sudo shutdown -h now

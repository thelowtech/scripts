sudo apt clean
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt dist-upgrade -y
sudo apt autoclean -y
sudo apt autoremove --purge -y

if [ -f /var/run/reboot-required ]; then
  sudo shutdown -r now
fi
echo "Updates Complete"

sudo apt clean
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoclean -y
sudo apt autoremove --purge -y

if [ -f /var/run/reboot-required ]; then
  sudo shutdown -r now
fi
echo "Updates Complete"

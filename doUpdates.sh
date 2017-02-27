sudo apt-get clean
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y

if [ -f /var/run/reboot-required ]; then
  sudo shutdown -r now
fi
echo "Updates Complete"

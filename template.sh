# use caution when using -y (automatic "yes")
sudo apt clean
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoclean -y
sudo apt autoremove --purge -y

# most likely is already installed
sudo apt -y install open-vm-tools

# remove Cloud-Init
sudo apt purge cloud-init

#Stop services for cleanup
sudo service rsyslog stop

#clear audit logs
if [ -f /var/log/wtmp ]; then
    truncate -s0 /var/log/wtmp
fi
if [ -f /var/log/lastlog ]; then
    truncate -s0 /var/log/lastlog
fi

#cleanup /tmp directories
rm -rf /tmp/*
rm -rf /var/tmp/*

#cleanup current ssh keys
rm -f /etc/ssh/ssh_host_*

#add check for ssh keys on reboot...regenerate if neccessary
cat << 'EOL' | sudo tee /etc/rc.local
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.
# dynamically create hostname (optional)
#if hostname | grep localhost; then
#    hostnamectl set-hostname "$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13 ; echo '')"
#fi
test -f /etc/ssh/ssh_host_dsa_key || dpkg-reconfigure openssh-server
exit 0
EOL

# make sure the script is executable
chmod +x /etc/rc.local

#cleanup apt
apt clean

# cleans out all of the cloud-init cache / logs - this is mainly cleaning out networking info
sudo cloud-init clean --logs

#cleanup shell history
cat /dev/null > ~/.bash_history && history -c
history -w

#shutdown
shutdown -h now
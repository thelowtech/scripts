######################################################
# Change the <mac> to the mac Address of your device #
# Change the <wlan> to the Wireless lan adapter id   #
# Requires macchanger                                #
######################################################

read -p "Make sure your Device is powered off and you are not connected to the network then press [Enter] To Continue"
sudo ifconfig <wlan> down
sudo macchanger --mac <mac> <wlan>
sudo ifconfig <wlan> up
read -p "Now connect to the wireless network, Authenticate then press [Enter]"
sudo ifconfig <wlan> down
sudo macchanger --permanent <wlan>
sudo ifconfig <wlan> up
echo "The Device has been conntected to the network"

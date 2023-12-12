#Takes hash of all files in /var/log and puts into another files
sudo sha256sum /var/log/* >> /home/dlq03/reports/comp.txt

#compares hash in base.txt from compOne.sh and compares it the file made here
sudo diff /home/dlq03/reports/base.txt /home/dlq03/reports/comp.txt >> /home/dlq03/reports/changes.txt

#if there are changes it will echo in script else it will say no changes made
if [ -s changes.txt ]; then
	echo "Changes detected in /var/log go to changes.txt for more details"
else
	echo "no changes detected in /var/log"
fi



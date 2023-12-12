sudo sha256sum /var/log/* >> reports/comp.txt
diff reports/base.txt /home/dlara/reports/comp.txt >> /home/dlara/reports/changes.txt

if [ -s changes.txt ]; then
	echo "Changes detected in /var/log go to changes.txt for more details"
else
	echo "no changes detected in /var/log"
fi



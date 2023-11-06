{
  # Getting static hostname
  hostname | awk '{print "Hostname: " $1}'

  # Getting IPv4 Address
  hostname -I | awk '{print "IPv4: " $1}' # for IPv4

  # Get OS
  hostnamectl | awk -F: '/Operating System/ {print "Server Type:" $2}'

  # Show Open Ports
  echo "Open Ports"
  netstat -tuln | awk '/LISTEN/ {print "Open Port:", $4}'

  # Displays firewall rules
  echo "Firewall Status"
  sudo ufw status
} | tee networkInfo.txt

echo "Information also displayed in networkInfo.txt"

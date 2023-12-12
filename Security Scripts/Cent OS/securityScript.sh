#!/bin/bash

DIR="/home/dlara/reports"

if [ -d "$DIR" ]; then
    echo "Security Script Initiated"
else
    mkdir "$DIR"
    echo "Directory created. for first time Security Script"
fi

# Security Script to detect red flags and appends findings to different text files
# sed commands filter out logs that detect commands done which would fall into the grep of the previous

# Detects any authentication-related activity between 12AM to 6AM
sudo grep -E "0[0-6]:[0-9]{2}:[0-9]{2}" /var/log/secure >> "$DIR/12to6.txt"
sudo sed -i '/COMMAND=/d' "$DIR/12to6.txt"

# Detects any failed logins from unknown IPs, IPs that are not 10.0.0.225 or 10.0.0.83 (serverb)
sudo last -f /var/log/btmp | grep -v -e "serverb" -e "10.0.0.225" >> "$DIR/unknownusers.txt"
sudo sed -i '/COMMAND=/d' "$DIR/unknownusers.txt"

# Detects any failed logins in general
sudo grep -E "password check failed" /var/log/secure >> "$DIR/failedlogins.txt"
sudo grep "authentication failure" /var/log/secure >> "$DIR/reportsauthfail.txt"
sudo sed -i '/COMMAND=/d' "$DIR/failedlogins.txt"
sudo sed -i '/COMMAND=/d' "$DIR/reportsauthfail.txt"

# Detects any closed connections if there is a DDoS
sudo grep "closed" /var/log/secure >> "$DIR/closed.txt"
sudo sed -i '/COMMAND=/d' "$DIR/closed.txt"

# Detects any login activity for user dlq03; this account is not used, so any login activity is concerning
sudo grep "dlq03" /var/log/secure >> "$DIR/dlq03.txt"
sudo sed -i '/COMMAND=/d' "$DIR/dlq03.txt"
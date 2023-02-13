#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="bakulssh"
curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/${GitUser}/multi/main/backup/rclone.conf"
git clone https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user Backup2023@gmail.com
from Backup2023@gmail.com
password tyagwudsykqokt
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O backup "https://raw.githubusercontent.com/${GitUser}multi/main/backup/backup.sh"
wget -O restore "https://raw.githubusercontent.com/${GitUser}multi/main/backup/restore.sh"
wget -O limit-speed "https://raw.githubusercontent.com/${GitUser}multi/main/backup/limit-speed.sh"

chmod +x backup
chmod +x restore
chmod +x limit-speed

cd
rm -f /root/set-br.sh


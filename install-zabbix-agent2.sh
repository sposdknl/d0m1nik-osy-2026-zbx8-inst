
sudo apt-get update
sudo apt install -y net-tools uuid-runtime joe aptitude


sudo wget https://repo.zabbix.com/zabbix/8.0/release/debian/pool/main/z/zabbix-release/zabbix-release_latest_8.0+debian13_all.deb


sudo dpkg -i zabbix-release_latest_8.0+debian13_all.deb

sudo apt-get update


sudo apt install -y zabbix-agent2
sudo apt install -y zabbix-agent2-plugin-mongodb zabbix-agent2-plugin-mssql zabbix-agent2-plugin-postgresql

sudo systemctl enable zabbix-agent2

sudo systemctl restart zabbix-agent2
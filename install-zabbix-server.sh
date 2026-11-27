sudo apt update;

sudo apt install -y mariadb-server;

sudo mysql -e "create database zabbix character set utf8mb4 collate utf8mb4_bin;";
sudo mysql -e "create user 'zabbix'@'localhost' identified by 'password';";
sudo mysql -e "grant all privileges on zabbix.* to 'zabbix'@'localhost';";
sudo mysql -e "set global log_bin_trust_function_creators = 1;";
sudo mysql -e "FLUSH PRIVILEGES;";

sudo systemctl enable mariadb.service;
sudo systemctl restart mariadb.service;

sudo apt install -y zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent2;
sudo zcat /usr/share/zabbix/sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -ppassword zabbix;

sudo mysql -e "set global log_bin_trust_function_creators = 0;";

sudo cp -v /etc/zabbix/zabbix_server.conf /etc/zabbix/zabbix_server.conf-orig;
sudo sed -i "s/# DBPassword=/DBPassword=password/g" /etc/zabbix/zabbix_server.conf;

sudo systemctl restart zabbix-server zabbix-agent2 apache2;
sudo systemctl enable zabbix-server zabbix-agent2 apache2;

sudo cp -v /vagrant/zabbix.conf.php /etc/zabbix/web/;
sudo chmod 400 /etc/zabbix/web/zabbix.conf.php;
sudo chown www-data:www-data /etc/zabbix/web/zabbix.conf.php;

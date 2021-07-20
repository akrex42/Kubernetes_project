openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'phpmyadmin'@'%' IDENTIFIED BY '1234';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'phpmyadmin'@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysql -e "CREATE USER 'wordpress'@'%' IDENTIFIED BY '1234';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysql wordpress < wordpress.sql
/usr/bin/supervisord -c etc/supervisord.conf

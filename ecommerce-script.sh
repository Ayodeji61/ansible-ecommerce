

echo "Installing MariaDB"
yum install -y mariadb-server

echo "Create Configuration file"
cat > /etc/my.cnf

echo "Start MariaDB Service"
service mariadb start

echo "Enable MariaDB Service"
sudo systemctl enable mariadb


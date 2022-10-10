

echo "Installing MariaDB"
yum install -y mariadb-server


echo "Start MariaDB Service"
service mariadb start

echo "Enable MariaDB Service"
sudo systemctl enable mariadb



yum install mariadb-server -y

echo "Restart MariaDB Service"
service mariadb restart


# replace "-" with "_" for database username
# MAINDB=${DBNAME}
# MAINUSER=${DBUSER}

# If /root/.my.cnf exists then it won't ask for root password
if [ -f /root/.my.cnf ]; then

    mysql -e "CREATE DATABASE ${DBNAME} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
    mysql -e "CREATE USER ${DBUSER}@localhost IDENTIFIED BY '${PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DBUSER}'@'localhost';"
    mysql -e "FLUSH PRIVILEGES;"

# If /root/.my.cnf doesn't exist then it'll ask for root password
else
    echo "Please enter root user MySQL password!"
    echo "Note: password will be hidden when typing"
    read -sp rootpasswd
    mysql -uroot -p${rootpasswd} -e "CREATE DATABASE ${MAINDB} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
    mysql -uroot -p${rootpasswd} -e "CREATE USER ${MAINDB}@localhost IDENTIFIED BY '${PASSWDDB}';"
    mysql -uroot -p${rootpasswd} -e "GRANT ALL PRIVILEGES ON ${MAINDB}.* TO '${MAINDB}'@'localhost';"
    mysql -uroot -p${rootpasswd} -e "FLUSH PRIVILEGES;"
fi





docker run --name docker_mysqld -e MYSQL_ROOT_PASSWORD=toorex -d mysql:tag


sudo firewall-cmd --add-port=3306/tcp --zone=public --permanent


sudo firewall-cmd --reload


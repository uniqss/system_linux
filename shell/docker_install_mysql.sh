
docker run --name docker_mysqld -e MYSQL_ROOT_PASSWORD=toorex -p 3306:3306 -d mysql:latest


sudo firewall-cmd --add-port=3306/tcp --zone=public --permanent


sudo firewall-cmd --reload


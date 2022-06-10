
docker run -d --restart unless-stopped --name zentao -p 80:80 zentao


sudo firewall-cmd --add-port=80/tcp --zone=public --permanent

sudo firewall-cmd --reload


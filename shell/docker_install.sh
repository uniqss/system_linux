
docker run -d --restart --name redis -p 6379:6379 redis 
docker run -d --restart --name mongodb -p 27017:27017 mongo 
docker run -d --restart --name etcd -p 2379-2380:2379-2380 --env ALLOW_NONE_AUTHENTICATION=yes bitnami/etcd
docker run -d --restart --name nats-main -p 4222:4222 -p 6222:6222 -p 8222:8222 nats


sudo firewall-cmd --add-port=6379/tcp --zone=public --permanent
sudo firewall-cmd --add-port=27017/tcp --zone=public --permanent
sudo firewall-cmd --add-port=2379-2380/tcp --zone=public --permanent
sudo firewall-cmd --add-port=4222/tcp --zone=public --permanent

sudo firewall-cmd --reload


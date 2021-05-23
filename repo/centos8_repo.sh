
sudo mkdir -p /etc/yum.repos.d.bk/

sudo cp -r /etc/yum.repos.d/* /etc/yum.repos.d.bk/

sudo cp ./8/*.repo /etc/yum.repos.d/

sudo yum install -y https://mirrors.ustc.edu.cn/remi/enterprise/remi-release-8.rpm

sudo yum makecache

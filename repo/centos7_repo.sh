
sudo mkdir -p /etc/yum.repos.d.bk/

sudo cp -r /etc/yum.repos.d/* /etc/yum.repos.d.bk/

sudo cp ./7/*.repo /etc/yum.repos.d/

sudo yum install https://mirrors.ustc.edu.cn/remi/enterprise/remi-release-7.rpm

sudo yum makecache

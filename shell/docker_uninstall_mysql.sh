
docker rm -vf $(docker ps -a | grep "mysql" | awk '{print $1}') 2>/dev/null || echo "container not found."


docker stop $(docker ps -a | grep "mysql" | awk '{print $1}') 2>/dev/null || echo "container not found."



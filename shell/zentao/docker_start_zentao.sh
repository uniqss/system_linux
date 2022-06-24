
docker start $(docker ps -a | grep "easysoft/zentao:latest" | awk '{print $1}') 2>/dev/null || echo "container not found."



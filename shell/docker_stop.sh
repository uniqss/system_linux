
docker stop $(docker ps -a | grep "redis" | awk '{print $1}') 2>/dev/null || echo "container not found."
docker stop $(docker ps -a | grep "mongodb" | awk '{print $1}') 2>/dev/null || echo "container not found."
docker stop $(docker ps -a | grep "etcd" | awk '{print $1}') 2>/dev/null || echo "container not found."
docker stop $(docker ps -a | grep "nats-main" | awk '{print $1}') 2>/dev/null || echo "container not found."



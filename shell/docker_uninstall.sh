

for /f "skip=1 tokens=1,2" %%i in ('docker ps -a --format "table {{.ID}}\t{{.Names}}"') do (
	if "%%j" == "redis" docker rm -f %%i
	if "%%j" == "mongodb" docker rm -f %%i
	if "%%j" == "etcd" docker rm -f %%i
	if "%%j" == "nats-main" docker rm -f %%i
)


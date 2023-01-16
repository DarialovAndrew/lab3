docker compose up -d

# init config server
docker compose exec configsvr1 sh -c "mongosh < /inits/config-server-init.js"

# init shards
docker compose exec shard1-a sh -c "mongosh < /inits/shard1-init.js"
docker compose exec shard2-a sh -c "mongosh < /inits/shard2-init.js"
docker compose exec shard3-a sh -c "mongosh < /inits/shard3-init.js"

sleep 5

docker compose exec router1 sh -c "mongosh < /inits/router-init.js"

docker compose exec router1 mongosh --port 2717 --eval "sh.status()"

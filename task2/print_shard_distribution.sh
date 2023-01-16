cd ../task1
docker compose exec router1 mongosh --port 2717 --eval "use london;" --eval "printjson(db.postcodes.getShardDistribution());"

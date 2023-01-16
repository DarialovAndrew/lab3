cd ../task1

docker compose cp "../task4/test.js" router1:"test.js"
docker compose exec router1 mongosh --port 27017 test.js

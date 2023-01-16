FILENAME="london_postcodes-ons-postcodes-directory-feb22.csv"

wget -O ../data/$FILENAME https://data.london.gov.uk/download/postcode-directory-for-london/62b22f3f-25c5-4dd0-a9eb-06e2d8681ef1/$FILENAME

cd ../task1
docker compose exec router1 mongosh --port 2717 --eval "sh.enableSharding('london'); sh.shardCollection('london.postcodes', {_id: 'hashed'})"
docker compose exec router1 mongoimport --port 2717 -d london -c postcodes --type csv --file /data/$FILENAME --headerline

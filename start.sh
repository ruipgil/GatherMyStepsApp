docker rm -f pms-postgis-i
docker rm -f pms-server-i

docker run \
  --name pms-postgis-i \
  -v db:/var/lib/postgresql/data/pgdata \
  -t pms-postgis

sleep 2

docker run \
  --name pms-server-i \
  -p 5000:5000 \
  -v /User/ruipgil/tracks:/input \
  --link pms-postgis-i:postgres \
  -it pms-server

#!/bin/bash

echo "Initiating replica set"
docker-compose exec mongors1 bash -c " echo \"rs.initiate(); sleep(3000);\" | mongo"

echo "Adding replica"
docker-compose exec mongors1 bash -c " echo \"rs.add('mongors2');\" | mongo"

echo "Adding arbiter"
docker-compose exec mongors1 bash -c " echo \"rs.addArb('mongorsarb');\" | mongo"

echo "Replication status"
docker-compose exec mongors1 bash -c " echo \"sleep(1000); rs.status()\" | mongo"

echo "Replication info"
docker-compose exec mongors1 bash -c " echo \"rs.printReplicationInfo()\" | mongo"

echo "Slave Replication info"
docker-compose exec mongors1 bash -c " echo \"rs.printSlaveReplicationInfo()\" | mongo"

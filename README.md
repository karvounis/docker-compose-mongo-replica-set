# MongoDB replica set docker-compose

This repo was created out of the need to have an easily created MongoDB replica set 
locally using Docker for development purposes. 

## Initial set up
Execute `make start` to initiate the Replica Set.

## Files included
 * a docker-compose file with one master node, one replica node and one arbiter.
 Arbiter is required because the number of servers that hold data in the replica set is odd (2).
 * initiate.sh file that contains the mongo commands required to be executed in order to initialize the Replica Set
 , add the slave and the arbiter to the set.
 * Makefile that can be used to help with the management of the docker containers. 
 Execute `make help` to see the list of choices.
 
 Happy coding!
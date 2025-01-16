#Setting Up Container Orchestration Using Docker Swarm

# Step 1: Create a Docker Swarm
docker swarm init

#Step 2: verify nodes
docker node ls

#Deploy a new Swarm service based on the Nginx image. A total of 2 sets of Docker containers should always be running.
docker service create --name webserver --replicas 2 -p 8080:80 nginx

#Step 3: Verify the service
docker service ls

#Step 4: Verify the running containers
docker service ps webserver

#Step 5: Verify with a test case whether Swarm service always maintains 2 set of replicas of the application, even if a production container is stopped or removed.
docker service scale webserver=1

#Step 6: Verify with a test case whether Swarm service can be scaled up or down based on the requirements of the application team.
docker service update --replicas 5 webserver
docker service update --replicas 1 webserver

# docker-swarm-udemy-assignment1
```markdown
# Setting Up Container Orchestration Using Docker Swarm

This guide provides a step-by-step explanation for setting up and managing container orchestration using Docker Swarm. Each step includes commands and their purpose to help you understand the workflow.

---

## Step 1: Create a Docker Swarm
To begin container orchestration, you need to initialize a Docker Swarm. This sets up the current machine as the manager node and allows other nodes to join the cluster.

```bash
docker swarm init
```
- **Explanation**: The `docker swarm init` command initializes a swarm and creates a single-node cluster with the current machine as the manager.

---

## Step 2: Verify Nodes
After initializing the swarm, verify that the nodes are correctly listed in the cluster.

```bash
docker node ls
```
- **Explanation**: The `docker node ls` command lists all the nodes in the swarm, including their roles (manager/worker), status, and availability.

---

## Step 3: Deploy a Swarm Service
Deploy a service using the Nginx image. Configure it to always run 2 replicas and map port 8080 on the host to port 80 in the container.

```bash
docker service create --name webserver --replicas 2 -p 8080:80 nginx
```
- **Explanation**: 
  - `--name webserver`: Assigns a name to the service.
  - `--replicas 2`: Ensures that two instances of the service are always running.
  - `-p 8080:80`: Maps port 8080 on the host to port 80 in the container for external access.

---

## Step 4: Verify the Service
Check the status of the deployed service to ensure it is running as expected.

```bash
docker service ls
```
- **Explanation**: The `docker service ls` command displays details about running services, including their names, number of replicas, and ports.

---

## Step 5: Verify Running Containers
List the individual tasks (containers) running for the deployed service.

```bash
docker service ps webserver
```
- **Explanation**: The `docker service ps` command shows detailed information about the tasks in a service, such as the node where each task is running, the current state, and the assigned ID.

---

## Step 6: Test Replica Maintenance
Test the fault tolerance of Docker Swarm by reducing the number of replicas to 1. Swarm automatically restores the specified number of replicas (2) if a container stops or is removed.

```bash
docker service scale webserver=1
```
- **Explanation**: 
  - `docker service scale webserver=1`: Scales the service down to 1 replica.
  - Docker Swarm monitors the service and restores it to maintain the desired number of replicas.

---

## Step 7: Test Scaling Flexibility
Demonstrate how to scale services up or down based on the application's requirements.

1. **Scale up to 5 replicas**:
   ```bash
   docker service update --replicas 5 webserver
   ```
2. **Scale down to 1 replica**:
   ```bash
   docker service update --replicas 1 webserver
   ```

- **Explanation**: The `docker service update --replicas` command modifies the number of replicas for a running service. This flexibility allows you to adjust resources based on traffic or other needs.

---

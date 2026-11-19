# Project 5 - Docker Fundamentals

## Objective

Learn the fundamentals of Docker, including:

- Docker Installation
- Docker Images
- Docker Containers
- Docker Hub
- Running Containers
- Viewing Logs
- Managing Containers using Ansible

---

# Environment

## Control Node

```text
172.31.36.234
```

Purpose:

```text
Runs Ansible commands and manages remote servers.
```

---

## Target Node

```text
172.31.38.192
```

Purpose:

```text
Runs Docker containers and receives Ansible commands.
```

---

# Docker Installation

Docker was installed on the target-node using an Ansible playbook.

Playbook:

```text
install-docker.yml
```

Execution:

```bash
ansible-playbook -i ../02-ansible-setup/inventory.ini install-docker.yml
```

Verification:

```bash
ansible -i ../02-ansible-setup/inventory.ini all -a "docker --version"
```

Output:

```text
Docker version 29.1.3
```

---

# Docker Permissions

Initially Docker commands failed because the ubuntu user did not have permission to use Docker.

Group membership was verified using:

```bash
ansible -i ../02-ansible-setup/inventory.ini all -a "groups ubuntu"
```

Output confirmed:

```text
ubuntu adm cdrom sudo dip lxd docker
```

This confirmed the ubuntu user had Docker permissions.

---

# Hello World Container

Purpose:

```text
Verify Docker installation and functionality.
```

Command:

```bash
ansible -i ../02-ansible-setup/inventory.ini all -a "docker run hello-world"
```

Result:

```text
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

Learning Outcome:

```text
Docker can download images.
Docker can create containers.
Docker can run containers.
```

---

# Docker Images

Purpose:

```text
Display images stored on the target-node.
```

Command:

```bash
ansible -i ../02-ansible-setup/inventory.ini all -a "docker images"
```

Output:

```text
hello-world:latest
nginx:latest
```

## What is a Docker Image?

Think of an image as a blueprint or template.

Examples:

```text
nginx
ubuntu
mysql
jenkins
```

Images are used to create containers.

---

# Docker Containers

Purpose:

```text
Display containers on the target-node.
```

Command:

```bash
ansible -i ../02-ansible-setup/inventory.ini all -a "docker ps -a"
```

Output showed:

```text
hello-world containers
nginx container
```

## What is a Container?

Think of a container as a running instance of an image.

Example:

```text
Image
  ↓
Container
```

Example:

```text
nginx image
      ↓
nginx container
```

---

# Pulling Nginx Image

Purpose:

```text
Download a real web server image from Docker Hub.
```

Command:

```bash
ansible -i ../02-ansible-setup/inventory.ini all -a "docker pull nginx"
```

Output:

```text
Downloaded newer image for nginx:latest
```

Learning Outcome:

```text
Docker images are downloaded from Docker Hub.
```

---

# Running an Nginx Container

Purpose:

```text
Create and start a web server container.
```

Command:

```bash
ansible -i ../02-ansible-setup/inventory.ini all -a "docker run -d nginx"
```

Explanation:

```text
docker run  = Create container
-d          = Run in background
nginx       = Use nginx image
```

Result:

```text
Container created successfully.
```

---

# Viewing Running Containers

Command:

```bash
ansible -i ../02-ansible-setup/inventory.ini all -a "docker ps"
```

Purpose:

```text
Show containers that are currently running.
```

Result:

```text
nginx container running
```

---

# Viewing Container Logs

Command:

```bash
ansible -i ../02-ansible-setup/inventory.ini all -a "docker logs funny_sammet"
```

Purpose:

```text
Display startup and runtime logs from the nginx container.
```

Important Output:

```text
Configuration complete; ready for start up
```

Meaning:

```text
Nginx started successfully.
```

Additional Output:

```text
start worker process
```

Meaning:

```text
Nginx worker processes started successfully.
```

Learning Outcome:

```text
Logs are used to troubleshoot containers.
```

---

# Key Docker Concepts Learned

## Docker Hub

Repository containing downloadable Docker images.

Examples:

```text
nginx
ubuntu
mysql
jenkins
```

---

## Docker Image

Template used to create containers.

Example:

```text
nginx image
```

---

## Docker Container

Running instance of an image.

Example:

```text
nginx container
```

---

## Docker Logs

Provides application startup and runtime information.

Used for:

```text
Monitoring
Troubleshooting
Error analysis
```

---

# Skills Learned

- Docker Installation
- Docker Images
- Docker Containers
- Docker Hub
- Docker Logs
- Ansible Docker Management
- Container Verification
- Container Troubleshooting

---

# Outcome

Successfully deployed and managed Docker containers using Ansible on AWS EC2 infrastructure.

Architecture:

```text
Laptop
   ↓
Control Node
   ↓ Ansible
Target Node
   ↓
Docker
   ↓
Nginx Container
```

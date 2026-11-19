# Project 3: Server Provisioning with Ansible

## Project Objective

The objective of this project is to learn how to use Ansible to automatically provision and manage a Linux server.

This project demonstrates how to install and manage the Nginx web server on a target-node using Ansible playbooks instead of manually executing commands on the server.

---

## Environment

### Control Node

- Ubuntu EC2 Instance
- Ansible Installed
- Stores inventory files
- Stores playbooks
- Manages remote servers

### Target Node

- Ubuntu EC2 Instance
- Managed by Ansible
- Receives automation tasks from control-node

---

## Project Structure

```text
03-server-provisioning/
│
├── README.md
├── install-nginx.yml
└── manage-nginx.yml
```

---

## Prerequisites

Before starting this project the following tasks were completed:

- Ansible installed on control-node
- SSH trust established between nodes
- inventory.ini created
- Target-node reachable through Ansible
- Ansible ping test successfully returned "pong"

---

## Playbook 1: install-nginx.yml

### Purpose

Install and configure Nginx automatically on the target-node.

### Playbook Tasks

- Update package information
- Install Nginx package
- Start Nginx service
- Enable Nginx service at system startup

### Execution Command

```bash
ansible-playbook -i ../02-ansible-setup/inventory.ini install-nginx.yml
```

---

## Verification Steps

### Verify Nginx Installation

Command:

```bash
ansible -i ../02-ansible-setup/inventory.ini all -a "nginx -v"
```

Purpose:

Verify that Nginx was successfully installed on the target-node.

Expected Result:

```text
nginx version: nginx/1.28.x
```

---

### Verify Nginx Service Status

Command:

```bash
ansible -i ../02-ansible-setup/inventory.ini all -a "systemctl status nginx --no-pager"
```

Purpose:

Verify that the Nginx service is running successfully.

Expected Result:

```text
Active: active (running)
```

---

## Why Nginx Was Chosen

Nginx is one of the most widely used web servers in modern infrastructure.

Common use cases:

- Website hosting
- Reverse proxy
- Load balancing
- SSL termination
- API gateway

Because Nginx is widely used in production environments, it provides an excellent learning example for server provisioning.

---

## Key Learning Outcomes

This project demonstrates:

- Infrastructure as Code (IaC)
- Ansible Playbooks
- Service Installation
- Service Management
- Configuration Management
- Remote Server Provisioning
- Validation and Verification

---

## Skills Developed

- Linux Administration
- Ansible
- YAML
- SSH-Based Automation
- Remote Server Management
- Server Provisioning
- Service Verification

---

## Result

Successfully provisioned the target-node using Ansible.

Verified:

- Nginx installed successfully
- Nginx service running
- Nginx enabled at startup
- Remote management working through Ansible
- Server provisioning automated using Infrastructure as Code

---

## Conclusion

This project demonstrated how Ansible can automate software installation and service management across remote servers.

Instead of manually connecting to servers and running installation commands, the entire process was performed through reusable playbooks, 
making the infrastructure more consistent, repeatable and easier to manage.

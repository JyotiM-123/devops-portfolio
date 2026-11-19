# Project 4: Nginx Configuration Automation Using Ansible

## Project Objective

The objective of this project is to learn how to use Ansible to deploy and manage website content automatically on a remote Linux server.

Instead of manually copying files and configuring services, Ansible automates the entire process using Infrastructure as Code (IaC).

---

## Project Overview

This project builds upon Project 3, where Nginx was installed using Ansible.

In this project:

- A custom website was created.
- Website content was deployed automatically.
- Nginx served the custom web page.
- Deployment was performed using Ansible playbooks.
- Configuration changes were managed through code.

---

## Environment

### Control Node

- Ubuntu EC2 Instance
- Ansible Installed
- Stores inventory files
- Stores website files
- Stores playbooks

### Target Node

- Ubuntu EC2 Instance
- Managed by Ansible
- Hosts the website using Nginx

---

## Project Structure

```text
04-nginx-configuration/
│
├── README.md
├── index.html
└── deploy-website.yml
```

---

## Website File

### index.html

Purpose:

Provide a custom web page that replaces the default Nginx landing page.

Content:

```html
<!DOCTYPE html>
<html>
<head>
    <title>DevOps Portfolio</title>
</head>
<body>
    <h1>Welcome to My DevOps Lab</h1>
    <p>Website deployed using Ansible automation.</p>
</body>
</html>
```

---

## Playbook: deploy-website.yml

Purpose:

Deploy website content automatically to the target-node.

Tasks performed:

1. Copy custom website content.
2. Deploy content to Nginx document root.
3. Restart Nginx service.
4. Make updated content immediately available.

Execution command:

```bash
ansible-playbook -i ../02-ansible-setup/inventory.ini deploy-website.yml
```

---

## Verification Steps

### Verify Website Content on Server

Command:

```bash
ansible -i ../02-ansible-setup/inventory.ini all -a "cat /var/www/html/index.html"
```

Purpose:

Confirm that the website file was successfully copied to the target-node.

---

### Verify Nginx Service

Command:

```bash
ansible -i ../02-ansible-setup/inventory.ini all -a "systemctl is-active nginx"
```

Expected Result:

```text
active
```

---

### Verify Nginx Listening Port

Command:

```bash
ansible -i ../02-ansible-setup/inventory.ini all -a "ss -tln"
```

Expected Result:

```text
0.0.0.0:80
```

This confirms that Nginx is listening for HTTP traffic.

---

### Verify Website Locally

Command:

```bash
ansible -i ../02-ansible-setup/inventory.ini all -a "curl http://localhost"
```

Expected Result:

```html
<h1>Welcome to My DevOps Lab</h1>
```

This confirms the website is being served by Nginx.

---

### Verify Public Connectivity

Command:

```powershell
Test-NetConnection 13.60.36.11 -Port 80
```

Result:

```text
TcpTestSucceeded : True
```

This confirms that the website is reachable through port 80 from outside AWS.

---

## Security Configuration

The Security Group was configured with:

| Protocol | Port | Purpose |
|-----------|---------|-----------|
| TCP | 22 | SSH Access |
| TCP | 80 | HTTP Traffic |

This allows remote administration and web traffic.

---

## Key Learning Outcomes

This project demonstrates:

- Infrastructure as Code
- Website Deployment Automation
- Configuration Management
- Nginx Administration
- Remote File Deployment
- Service Validation
- AWS Security Group Configuration
- End-to-End Web Server Provisioning

---

## Skills Developed

- Ansible Playbooks
- File Deployment
- Linux Administration
- Nginx Configuration
- Website Hosting
- AWS Networking
- Service Troubleshooting
- Infrastructure Automation

---

## Result

Successfully deployed a custom website using Ansible.

Verified:

✅ Website copied to target-node

✅ Nginx serving custom content

✅ Port 80 accessible

✅ Network connectivity verified

✅ Infrastructure managed through code

---

## Conclusion

This project demonstrates how Ansible can automate website deployment and server configuration.

Instead of manually copying files and restarting services, Infrastructure as Code was used to deploy and manage a website on a remote Linux server consistently and repeatably.

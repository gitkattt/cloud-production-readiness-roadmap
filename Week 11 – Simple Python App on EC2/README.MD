# Week 11 - Simple Python App on EC2/ECS

## Objective

Deployed simple web applications to both Amazon EC2 and Amazon ECS using two different deployment approaches:

## Traditional EC2-based application hosting

## Containerized deployment using ECS Fargate and Docker

Focused on application deployment workflows, containerization, reverse proxy configuration, and exposing applications securely to the public internet.

## Tools/Services Used

* Amazon EC2
* Amazon ECS
* AWS Fargate
* Amazon ECR
* Security Groups
* Docker
* Python FastAPI
* Node.js Express
* NGINX
* Linux
* Uvicorn

## Solution Overview

Implemented two separate application deployment solutions:

EC2 Deployment
Deployed a FastAPI application directly on an EC2 instance
Configured NGINX as a reverse proxy
Used systemd to manage the FastAPI service
Exposed the application publicly over HTTP
ECS Deployment
Built and containerized a Node.js Express API using Docker
Uploaded the container image to Amazon ECR
Deployed the containerized application to ECS using AWS Fargate
Configured networking and security groups for external access

Both deployments were validated successfully before infrastructure teardown.

Section 1 - EC2 FastAPI Deployment
EC2 Infrastructure

Created an EC2 instance with a security group configured to allow:

SSH (Port 22)
HTTP (Port 80)

Installed required dependencies:

sudo apt install python3-pip nginx

Installed FastAPI and Uvicorn from requirements.txt and configured the application to run as a service using systemd.

NGINX Reverse Proxy

Configured NGINX to forward incoming HTTP traffic to the FastAPI application running with Uvicorn.

Traffic Flow
Internet → NGINX → FastAPI (Uvicorn)

This allowed the FastAPI application to be accessible through standard HTTP port 80.

Validation
Verified EC2 instance accessibility via SSH
Confirmed NGINX was running correctly
Verified FastAPI application was accessible from the public internet
Confirmed HTTP requests were successfully routed through NGINX
Section 2 - ECS Fargate Deployment
Express API Development

Created a simple Node.js Express API inside index.js that returned a welcome message when accessed.

Created a package.json file containing all required dependencies for the application.

Containerization

Built and tested the Docker container locally before deployment.

Docker Build
docker build -t express-api .
Local Testing
docker run -p 5000:5000 express-api

Verified the application was accessible locally on:

localhost:5000

Amazon ECR Deployment

Pushed the Docker container image to Amazon ECR after authenticating Docker with AWS.

ECS Fargate Deployment

Created:

ECS Cluster
Task Definition
ECS Service

Configured the service to run on AWS Fargate without managing EC2 instances directly.

Security groups were configured to allow inbound traffic on port 5000.

Validation
Verified ECS tasks were running successfully
Confirmed container deployment through ECS Service
Validated public access to the application
Confirmed application responses through browser testing
Architecture Overview

EC2 Deployment Architecture
User → Security Group → EC2 → NGINX → FastAPI
ECS Deployment Architecture
User → Security Group → ECS Service → Fargate Task → Docker Container
Incidents
Docker ECR Push Failure
Main Event

Container image uploads to Amazon ECR consistently failed with the following error:

error saving credentials: error storing credentials - err: exit status 1, out: `The stub received bad data.`
Root Cause

Windows Credential Manager and docker-credential-desktop.exe were causing credential storage compatibility issues during Docker authentication.

Resolution

Removed the following line from Docker configuration:

"credsStore"

from:

.docker/config.json

After removing the credential helper configuration, Docker authentication and ECR image uploads worked successfully.

Key Takeaways
Applications can be deployed using both traditional VM-based and containerized approaches
ECS Fargate simplifies container orchestration by removing EC2 management overhead
Docker enables consistent application packaging and deployment
NGINX reverse proxying is commonly used for production web application routing
Testing applications locally before deployment helps reduce troubleshooting complexity
Troubleshooting Docker credential and authentication issues is an important operational skill
Future Improvements
Add HTTPS using AWS Certificate Manager and Application Load Balancer
Store container images using automated CI/CD pipelines
Deploy ECS services behind an Application Load Balancer
Implement autoscaling for ECS services
Use Infrastructure as Code with Terraform for repeatable deployments
Add CloudWatch logging and monitoring
Replace SSH access with AWS Systems Manager Session Manager
Resume Bullet

Deployed web applications using both Amazon EC2 and Amazon ECS Fargate, implementing Docker containerization, NGINX reverse proxying, Amazon ECR image management, and secure public application access while troubleshooting real-world deployment and authentication issues.

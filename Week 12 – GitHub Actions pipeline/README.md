# Week 12 - GitHub Actions CI/CD Pipeline

## Objective

Implemented a full CI/CD pipeline using: 
* GitHub Actions
* Docker
* AWS EC2

to automate application deployment workflows. The project focused on containerized deployments, self-hosted runners, reverse proxy configuration, and troubleshooting pipeline failures.

## Technologies Used
* Amazon Web Services EC2 (Ubuntu)
* GitHub Actions
* Docker
* NGINX Reverse Proxy
* Linux (Ubuntu)
* VS Studio Code
* YAML Workflow Configuration
* CI/CD Pipeline Overview

## Created a CI/CD workflow where:

Code changes pushed to the repository trigger GitHub Actions workflows.
The application is built and containerized using Docker.
Docker images are pushed to a Docker repository.
The EC2 deployment server automatically pulls the updated image.
Existing containers are stopped and replaced with the latest deployment.
NGINX forwards incoming traffic to the containerized application running on port 8080.
Implementation Steps
Application Setup
Created a sample containerized application in VS Code.
Configured the application to run on port `8080.`
Built Docker images for the application.

## Configured GitHub Actions workflow files:
```
ci.yml
```
```
cd.yml
```

## AWS EC2 Deployment Server
* Launched an Ubuntu EC2 instance.
* Installed Docker on the EC2 instance.
* Configured a self-hosted GitHub Actions runner on the server.
* Verified that GitHub Actions jobs executed successfully on the runner.

## Automated Deployment
* Confirmed successful CI pipeline execution.
* Verified Docker images were correctly pushed to the repository.
* Automated deployment updates on the EC2 instance.
* Confirmed updated containers were automatically deployed after new commits.

## Reverse Proxy Configuration
 * Installed and configured NGINX as a reverse proxy.
 * Forwarded traffic from the EC2 public IP to the containerized application running on port 8080.
 * Verified external access to the application through NGINX.

## Deployment Validation
* Modified the application and rebuilt the Docker image.
* Confirmed the CI/CD pipeline automatically deployed updated application versions.
* Verified the updated application was accessible from the browser.

# Troubleshooting and Debugging

# Authentication Failure: Issue

GitHub Actions failed to push Docker images with the following error:
```
denied: requested access to the resource is denied
```

## Root Cause

Incorrect authentication credentials in the GitHub Actions workflow configuration.

## Resolution

Reviewed and corrected Docker repository credentials in the `ci.yml` workflow.
Verified authentication configuration.
Re-ran the pipeline and confirmed successful image uploads.

## Intentional Failure Testing

To improve troubleshooting skills, <u>intentionally introduced misconfigurations into both:<u>
```
ci.yml
cd.yml
```

This resulted in multiple workflow failures and deployment issues, requiring debugging and correction of:
* YAML syntax
* Workflow configuration
* Authentication settings
* Deployment logic

## Skills Practiced
* CI/CD pipeline design
* GitHub Actions automation
* Docker containerization
* Linux server administration
* Reverse proxy configuration
* Infrastructure troubleshooting
* Deployment automation
* Self-hosted GitHub runners
* YAML workflow debugging
* Cloud deployment workflows



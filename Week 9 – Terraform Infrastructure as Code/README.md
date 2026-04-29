
# Week 9 - Terraform Infrastructure as Code

## Objective

Implemented Infrastructure as Code (IaC) using Terraform to design, deploy, and manage AWS resources. Focused on repeatable deployments, environment consistency, and improving provisioning speed through automation.

![alt image](ADD_YOUR_SCREENSHOT_HERE)

## Services Used

* Amazon VPC
* Public / Private Subnets
* Route Tables
* Internet Gateway
* Security Groups
* Amazon EC2
* Amazon RDS
* AWS IAM
* Terraform

## Solution Overview

Built a modular AWS environment using Terraform consisting of:

* Custom VPC with isolated networking
* Public subnet for compute resources
* Private subnet for database layer
* Internet Gateway for external connectivity
* EC2 instance deployed in public subnet
* RDS instance deployed in private subnet
* Security group configuration enforcing least privilege access

Infrastructure was deployed, destroyed, and redeployed multiple times to validate consistency and reinforce Terraform workflows.

## Terraform Workflow

Used standard Terraform workflow to manage infrastructure:

### Initialization

```bash
terraform init
```
```bash
terraform plan
```
```bash
terraform apply
```

```bash
terraform destroy
```

Repeated apply/destroy cycles to validate idempotency and ensure reliable provisioning.

## Network Architecture

Designed a basic VPC architecture with:

* 1 Public Subnet (EC2)
* 1 Private Subnet (RDS)
* Route Table associated with public subnet
* Internet Gateway attached to VPC
* Security Groups

## EC2 Security Group

* Allow SSH (port 22) for remote access

## RDS Security Group

* Allow database traffic only from EC2 Security Group

## Compute Layer

* Deployed an EC2 instance in the public subnet to act as the application entry point.

## Validation
* Confirmed instance provisioning via Terraform
* Verified SSH connectivity
* Ensured proper network routing through Internet Gateway

## Database Layer

Deployed an Amazon RDS instance in a private subnet to ensure isolation from public access.

## Validation
Confirmed RDS deployment
Verified security group restrictions allowed access only from EC2
Ensured database was not publicly accessible
Iteration & Optimization

To improve deployment speed during testing:

Removed RDS from later iterations
Focused on faster EC2 + networking deployments
Re-ran Terraform workflows multiple times for consistency
Incidents
Terraform Deployment Failures
Encountered multiple syntax and configuration errors during terraform apply

Root Cause

Incorrect syntax and misconfigured resource blocks in Terraform files

Resolution

Used terraform validate and terraform plan for debugging
Referenced official Terraform documentation
Iteratively corrected configuration issues
Key Takeaways
Infrastructure can be defined and deployed entirely through code
Terraform enables consistent and repeatable cloud environments
Iterative deployment improves understanding of resource dependencies
Debugging configuration errors is a critical IaC skill
Automation significantly reduces manual provisioning time
Future Improvements
Refactor configuration into:
main.tf
variables.tf
outputs.tf
Introduce reusable Terraform modules
Implement remote state using S3 and DynamoDB
Restrict SSH access to specific IP ranges or replace with SSM Session Manager
Expand architecture with load balancing and autoscaling
Resume Bullet

Provisioned AWS infrastructure using Terraform, including a custom VPC, public and private subnets, EC2, and RDS, enabling repeatable and automated deployments while improving infrastructure consistency and provisioning efficiency.



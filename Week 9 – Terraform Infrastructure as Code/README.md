
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

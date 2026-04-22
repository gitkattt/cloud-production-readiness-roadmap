# Week 3 - Production Networking

## Objective

Built a production-style AWS networking environment using Infrastructure as Code (IaC), including public/private subnets, NAT gateways, route tables, and layered security controls. Deployed a bastion host architecture and performed network troubleshooting by intentionally breaking connectivity.

## Services Used

* Amazon VPC
* Public / Private Subnets
* Route Tables
* Internet Gateway
* NAT Gateway
* Elastic IP
* Security Groups
* Network ACLs (NACLs)
* Amazon EC2
* AWS CloudFormation

## Network Architecture

Created a full VPC environment containing:

* Public route tables
* Private route tables
* Default public routes
* Default private routes
* Internet Gateway
* NAT Gateway
* Elastic IP addresses
* Public subnets
* Private subnets
* Route table associations
* Security Groups
* Network ACLs

## Infrastructure as Code Deployment

Provisioned the environment using AWS CloudFormation templates.

[image goes here]

### Benefits of CloudFormation

* Repeatable deployments
* Faster provisioning
* Reduced manual configuration errors
* Easier rollback and change management

Verified successful stack creation after deployment.

## Bastion Host Deployment

Launched two EC2 instances:

* **Public EC2 Instance** – Used as bastion host
* **Private EC2 Instance** – Hosted in private subnet

Configured security groups to allow administrative access through the bastion host and validated internet connectivity from the public instance.

## Validation

* Confirmed CloudFormation stack creation
* Verified subnet and route table associations
* Tested internet access from public instance
* Confirmed bastion host connectivity path to private instance
* Validated private/public subnet separation

## Incident Encountered

### Issue

Connectivity was intentionally broken during testing by modifying security group rules.

### Root Cause

Misconfigured security group rules prevented expected traffic flow and administrative access.

### Impact

* Instances failed connectivity tests
* Internet/network testing could not complete
* Temporary administrative access disruption

### Resolution

* Created a corrected security group
* Allowed SSH access on port **22**
* Reattached proper security group rules
* Retested connectivity successfully

## Lessons Learned

* Security groups are stateful and critical to traffic flow
* Routing issues are not always route table related
* Layered troubleshooting should include Security Groups, NACLs, and routes
* Infrastructure as Code simplifies recovery from misconfigurations

## Resume Bullet

Built a production-ready AWS VPC using CloudFormation with public/private subnets, NAT gateways, route tables, and bastion host access, then performed network troubleshooting and security group remediation.


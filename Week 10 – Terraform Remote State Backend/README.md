
Week 10 – Terraform Remote State Backend
Objective

Implemented a remote Terraform state backend using AWS S3 and DynamoDB to follow production best practices for infrastructure management, focusing on consistency, reliability, and team collaboration.

Architecture Overview

Designed and deployed a multi-AZ AWS environment using Terraform:

main.tf
├── variables.tf
└── outputs.tf
Infrastructure Provisioned
VPC (main)
2 Public Subnets (across multiple Availability Zones)
2 Private Subnets (across multiple Availability Zones)
Internet Gateway with routing for public subnets
Security Group allowing SSH access (port 22)
EC2 instances hosting web servers in each public subnet
Key Improvements
Used Terraform variables to improve code reusability
Structured configuration files for maintainability and scalability
Followed infrastructure-as-code best practices for cleaner deployments
Remote State Backend (S3 + DynamoDB)

Configured a remote backend to replace local Terraform state.

S3 Bucket
Enabled versioning for state recovery
Enabled encryption for security
Stores the terraform.tfstate file
DynamoDB Table
Used for state locking
Prevents concurrent Terraform operations
Configuration Files
backend.tf – defines remote backend
provider.tf – defines AWS provider configuration
State Migration

Migrated local state to remote backend using:

terraform init -migrate-state
Why Remote State Matters

Implementing remote state provides:

State Locking → prevents concurrent modifications
Consistency → ensures a single source of truth
Team Collaboration → enables multiple engineers to safely work together
Drift Prevention → reduces unintended infrastructure changes

This setup reflects real-world production Terraform workflows.

Incident & Troubleshooting
Issue

Repeated errors during Terraform operations:

Error acquiring state lock
Root Cause
Accidental deletion of the S3 bucket containing the Terraform state file
Impact
Terraform unable to acquire lock
Infrastructure operations blocked
Resolution
Recreated backend resources (S3 + DynamoDB)
Released stale lock using:
terraform force-unlock
Key Takeaways
Gained hands-on experience with Terraform state recovery
Learned how state locking behaves in failure scenarios
Reinforced the importance of protecting remote state infrastructure
Summary

This lab focused on implementing Terraform best practices by introducing a remote state backend and handling real-world failure scenarios.

By completing this, I strengthened my understanding of:

Infrastructure as Code (IaC)
Terraform state management
Backend configuration and migration
Debugging and recovering from state-related issues

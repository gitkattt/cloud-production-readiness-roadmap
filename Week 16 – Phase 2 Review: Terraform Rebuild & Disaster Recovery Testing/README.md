# Week 16 – Phase 2 Review: Terraform Rebuild & Disaster Recovery Testing

## Overview

Week 16 focused on validating the ability to **rebuild a production-style AWS environment using Infrastructure as Code (Terraform)** and testing the resilience of the architecture through an intentional outage simulation.

The goal of this lab was to recreate the AWS environment built throughout Weeks 8-15 and verify that:

- Infrastructure could be recreated from Terraform configuration
- The application remained available during infrastructure failure
- Auto Scaling and Load Balancing behaved correctly during an outage
- Monitoring and incident response procedures functioned as expected

---

# Objectives

- Perform a full Terraform rebuild of the AWS environment
- Validate infrastructure before deployment
- Deploy a highly available EC2 application architecture
- Simulate an Availability Zone failure
- Validate application recovery behavior
- Document an incident post-mortem

---

# Architecture Rebuild

The environment was rebuilt using Terraform.

The deployed architecture included:

- Amazon VPC
- Two public subnets across multiple Availability Zones
- Internet Gateway
- Route tables and routing configuration
- Application Load Balancer
- Target Group
- Security Groups
- Auto Scaling Group
- EC2 instances
- EC2 User Data configuration

The final architecture:

```
             Users
               |
               |
      Application Load Balancer
               |
    -------------------------
    |                       |

Availability Zone 1 Availability Zone 2
    |                       |
EC2 Instance           EC2 Instance
    \                       /
      \                   /
       Auto Scaling Group
```


---

# Terraform Deployment Process

## Terraform Validation

Before deploying the infrastructure, Terraform configuration was validated.

Commands used:

```
terraform validate
```

The configuration was then reviewed using: `terraform plan`

After confirming the planned resources were correct, the environment was deployed: `terraform apply`

# Infrastructure Validation

## After deployment:

* EC2 instances successfully launched
* Application Load Balancer became available
* Target group health checks passed
* Application was accessible through the ALB endpoint
* Instances successfully displayed metadata information including Availability Zone details

This confirmed that the Terraform rebuild successfully recreated the required production-style environment.

## Disaster Recovery Testing:

AWS Fault Injection Service (AWS FIS)

To simulate a real infrastructure failure, `AWS Fault Injection Service` was used.

The experiment simulated an Availability Zone failure by disrupting EC2 capacity in one Availability Zone.

Failure scenario:
```
Availability Zone 2 Failure

        |
        v

EC2 Instances Become Unhealthy

        |
        v

ALB Health Checks Fail

        |
        v

Traffic Removed From Failed Targets

        |
        v

Auto Scaling Group Replaces Instances

        |
        v

Application Recovers
```

## Results

During the simulated outage:

* CloudWatch monitoring detected unhealthy infrastructure behavior
* Notifications were delivered through configured alerting mechanisms
* The Application Load Balancer redirected traffic to healthy instances
* The Auto Scaling Group replaced unhealthy EC2 instances
* The application remained available during the failure

After stopping the AWS FIS experiment:

* Auto Scaling recreated missing capacity
* Instances returned to healthy status
* Load Balancer resumed routing traffic across both Availability Zones

Recovery time was approximately: `5-10 minutes during simulated outage`

## Monitoring & Security Services Used

The environment included additional AWS operational services:

## AWS CloudWatch

Used for:

* Infrastructure monitoring
* EC2 health monitoring
* Alert notifications

## AWS Config

Used for:

* Configuration compliance monitoring
* Detecting configuration changes

## AWS Security Hub

Used for:

* Security posture visibility
* Security findings aggregation

## AWS Budgets

Used for:

* Cost monitoring
* Preventing unexpected AWS spending


# Incident Post-Mortem

## Incident: Terraform Deployment Failure

**Summary**

During the Terraform rebuild process, infrastructure deployment was initially blocked due to a Terraform syntax error.

**Impact**

Terraform validation failed, preventing the infrastructure from being deployed.

**Detection**

The issue was detected during:

`terraform validate`

**Root Cause**

Incorrect Terraform syntax within the EC2 configuration/user data section caused the Terraform configuration to become invalid.

**Resolution**

Steps taken:

* Reviewed Terraform error output
* Located the invalid syntax
* Corrected the Terraform configuration
* Re-ran validation

Validation completed successfully:

`terraform validate`

The environment was then successfully deployed.

## Prevention

Future improvements:

* Run `terraform fmt`   before validation
* Validate Terraform modules before deployment
* Use Terraform editor extensions for syntax checking
* Maintain smaller reusable Terraform modules

# Skills Demonstrated

This lab demonstrated experience with:

* Infrastructure as Code (Terraform)
* AWS networking
* Multi-AZ architecture design
* Application Load Balancing
* Auto Scaling
* CloudWatch monitoring
* AWS Fault Injection Service
* Disaster recovery testing
* Incident response documentation
* Cloud troubleshooting

# Key Takeaways

Week 16 validated that the environment could be rebuilt from code and survive infrastructure failure.

The main focus shifted from simply deploying cloud resources to operating them:

* Detect failures
* Recover automatically
* Validate resilience
* Document incidents

This represents a production-oriented cloud engineering workflow.

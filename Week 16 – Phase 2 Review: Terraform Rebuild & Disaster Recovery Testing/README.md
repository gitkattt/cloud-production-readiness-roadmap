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

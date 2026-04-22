
# Week 8 - Production Capstone Deployment

## Objective

Designed and deployed a production-style AWS application environment that combined concepts from previous weeks into a single end-to-end architecture. The solution focused on scalability, high availability, monitoring, backups, and disaster recovery.

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/f466ad3151c36e32f8776749fd7d5070886373d0/Week%208%20%E2%80%93%20Production%20Capstone%20Deployment%3A%20Phase%201%20Review/Screenshots/Pasted%20image%2020260420111553.png)

## Services Used

* Amazon VPC
* Public / Private Subnets
* Route Tables
* Internet Gateway
* Security Groups
* Amazon EC2
* Auto Scaling Group (ASG)
* Application Load Balancer (ALB)
* Amazon RDS (Multi-AZ MySQL)
* Amazon S3
* Cross-Region Replication (CRR)
* Amazon CloudWatch
* AWS CloudTrail
* Amazon Machine Images (AMI)
* EBS / RDS Snapshots
* AWS CloudFormation

## Solution Overview

Built a production-ready web application environment consisting of:

* Flask web application hosted on EC2 instances
* Auto Scaling Group across two Availability Zones
* Application Load Balancer for traffic distribution
* Multi-AZ RDS database in private subnets
* S3 buckets for backup storage with cross-region replication
* CloudWatch monitoring and alerting
* CloudTrail auditing and activity logging
* Snapshot and AMI-based recovery workflows

## Network Architecture

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/f466ad3151c36e32f8776749fd7d5070886373d0/Week%208%20%E2%80%93%20Production%20Capstone%20Deployment%3A%20Phase%201%20Review/Screenshots/Pasted%20image%2020260420111600.png)

Used AWS CloudFormation to deploy a custom VPC with:

* 2 Public Subnets
* 2 Private Subnets
* Route Tables
* Internet Gateway
* Secure subnet associations

### Security Groups

**ALB Security Group**

* Allow HTTP / HTTPS from the internet

**EC2 Security Group**

* Allow HTTP only from ALB Security Group
* Allow SSH only from trusted IP address

**RDS Security Group**

* Allow MySQL port **3306** only from EC2 Security Group

## Database Layer

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/f466ad3151c36e32f8776749fd7d5070886373d0/Week%208%20%E2%80%93%20Production%20Capstone%20Deployment%3A%20Phase%201%20Review/Screenshots/db.webp)

Deployed Amazon RDS MySQL in a Multi-AZ configuration across separate Availability Zones.

### Validation

* Confirmed database connectivity from application tier
* Verified data persistence after writes
* Restored snapshots successfully during testing

## Application Layer

Created a test EC2 instance running Amazon Linux and installed:

* Python 3
* pip
* Flask
* PyMySQL

Developed a Flask application that allowed users to:

* View usernames stored in the database
* Add new usernames through the web interface

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/f466ad3151c36e32f8776749fd7d5070886373d0/Week%208%20%E2%80%93%20Production%20Capstone%20Deployment%3A%20Phase%201%20Review/Screenshots/final.webp)

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/f466ad3151c36e32f8776749fd7d5070886373d0/Week%208%20%E2%80%93%20Production%20Capstone%20Deployment%3A%20Phase%201%20Review/Screenshots/flask%20code.png)

Validated functionality locally and through public HTTP access.

## Golden Image and Scaling

Created a Golden AMI containing the fully configured application stack.

Used the AMI to launch:

* Auto Scaling Group
* Multiple web servers across two Availability Zones

Attached instances to an Application Load Balancer and confirmed traffic distribution across healthy targets.

## Backup & Disaster Recovery

### S3 Cross-Region Replication

Created two versioned S3 buckets with replication enabled.

Used buckets for backup storage and off-site redundancy.

### Snapshot Recovery

Performed:

* RDS snapshots and restore validation
* EC2 AMI recovery testing
* EBS-based backup workflows

## Monitoring & Auditing

### CloudWatch

Created alarms for:

* Unhealthy load balancer targets
* EC2 status check failures
* Instance termination events

Configured notifications to alert team members.

### CloudTrail

Enabled logging for API and account activity to support auditing and operational review.

## Failure Testing

### EC2 Instance Failure

* Terminated multiple EC2 instances
* Confirmed Auto Scaling launched replacements
* Verified Load Balancer routed traffic only to healthy targets

### Availability Zone Failure Simulation

* Simulated AZ disruption
* Verified traffic failover to healthy Availability Zone
* Restored normal multi-AZ traffic distribution after recovery

## Recovery Metrics

### Estimated RTO / RPO

* **EC2 Application Tier RTO:** ~2–5 minutes using Auto Scaling / AMI recovery
* **RDS RTO:** ~15–20 minutes depending restore scenario
* **RPO:** Near zero for Multi-AZ failover, higher if relying on snapshots only

## Lessons Learned

* Combining services creates real-world operational complexity
* Golden AMIs accelerate scaling and recovery
* Multi-layer backups improve resilience
* Monitoring and alerting are critical in production systems
* High availability requires testing, not assumptions
* Infrastructure as Code greatly reduces deployment time

## Resume Bullet

Designed and deployed a production-style AWS environment featuring a multi-AZ web application on Auto Scaling EC2 instances behind an Application Load Balancer, integrated with private RDS, S3 cross-region backups, monitoring, and disaster recovery testing.

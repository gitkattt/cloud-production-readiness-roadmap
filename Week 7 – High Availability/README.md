
# Week 7 - High Availability

## Objective

Designed and deployed a highly available web application architecture using an Auto Scaling Group and Application Load Balancer across multiple Availability Zones. Simulated instance failure and validated self-healing behavior.

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/a2149e49ff9026c37eeceac548c0b85e771e9113/Week%207%20%E2%80%93%20High%20Availability/Screenshots/1.png)

## Services Used

* Amazon EC2
* EC2 Launch Templates
* Auto Scaling Group (ASG)
* Elastic Load Balancing (Application Load Balancer)
* Target Groups
* Health Checks
* Amazon VPC / Multi-AZ Networking

## Deployment Approach

This week’s environment was built manually through the AWS Console rather than CloudFormation to strengthen hands-on operational knowledge of service configuration and dependencies. (4/22/26 EDIT: I re-did this lab to gather screenshots, I used CloudFromation to save time with the deployment)

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/a2149e49ff9026c37eeceac548c0b85e771e9113/Week%207%20%E2%80%93%20High%20Availability/Screenshots/2.png)

## Auto Scaling Group and Load Balancer Deployment

### Launch Template

Created an EC2 launch template containing:

* Preconfigured instance settings
* Security group configuration
* Required networking settings
* User data to display the current Availability Zone of each instance

### High Availability Architecture

Created an Application Load Balancer with an attached target group and integrated it with a newly created Auto Scaling Group.

Configured the Auto Scaling Group to launch instances across multiple Availability Zones.

### Validation

Used the Load Balancer DNS name to access the application and confirmed traffic was distributed between instances in separate Availability Zones.

Observed traffic responses from:

* **us-east-1c**
* **us-east-1b**

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/a2149e49ff9026c37eeceac548c0b85e771e9113/Week%207%20%E2%80%93%20High%20Availability/Screenshots/3.png)
![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/a2149e49ff9026c37eeceac548c0b85e771e9113/Week%207%20%E2%80%93%20High%20Availability/Screenshots/4.png)

## Instance Failure Simulation

Performed failure testing by manually terminating one EC2 instance.

### Load Balancer Response

* Health checks detected unhealthy instance status
* Traffic was automatically removed from failed instance
* Requests continued routing to healthy instance in remaining Availability Zone

### Auto Scaling Group Response

* ASG detected capacity reduction
* Replacement instance launched automatically
* New instance passed health checks
* Load Balancer resumed traffic distribution across both zones

## Validation

Confirmed restored traffic flow across:

* **us-east-1c**
* **us-east-1b**

## Operational Notes

No major incidents occurred during this week’s deployment. Build time increased because all resources were provisioned manually without Infrastructure as Code.

## Lessons Learned

* High availability depends on redundancy across Availability Zones
* Health checks are critical for automatic traffic rerouting
* Auto Scaling provides self-healing infrastructure
* Manual builds improve understanding of service relationships
* Infrastructure as Code would significantly speed future deployments

## Resume Bullet

Deployed a multi-AZ high availability AWS architecture using Auto Scaling Groups and an Application Load Balancer, then validated self-healing recovery through simulated EC2 instance failure testing.

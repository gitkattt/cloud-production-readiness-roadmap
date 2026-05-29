
# Week 13 - AWS Cost Optimization

## Objective

Focused on AWS cost optimization techniques by implementing AWS Budgets, Cost Anomaly Detection, S3 Lifecycle Policies, and EC2 right-sizing strategies. The goal of this lab was to gain hands-on experience reducing unnecessary AWS spending while learning operational best practices for production environments.

---

# AWS Budgets and Cost Anomaly Detection

## AWS Budgets

For the first section of this lab, I created an AWS Budget to help prevent accidental overspending during future labs and projects.

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/482d31c71770203a05e1b3964d2ebd4b20142de8/Week%2013%20-%20AWS%20Cost%20Optimization/Screenshots/1.png)

Initially, I misconfigured the budget and did not receive alerts when I exceeded my spending threshold. During my Week 8 Capstone Deployment, I unintentionally exceeded the budget and reached a total of approximately `$6.07 USD`.

To correct this issue, I recreated the budget with proper email notifications enabled. The updated budget was configured with a `$2 USD` threshold to notify me immediately if costs started increasing unexpectedly.

### AWS Budget Actions

I also implemented **AWS Budget Actions** to automate cost control.

The budget action was configured to automatically stop EC2 and RDS instances once the configured spending threshold was reached. This demonstrated how AWS Budgets can be integrated with automated remediation workflows to reduce unnecessary cloud spending.

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/482d31c71770203a05e1b3964d2ebd4b20142de8/Week%2013%20-%20AWS%20Cost%20Optimization/Screenshots/3.png)

---

## AWS Cost Anomaly Detection

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/482d31c71770203a05e1b3964d2ebd4b20142de8/Week%2013%20-%20AWS%20Cost%20Optimization/Screenshots/Pasted%20image%2020260529133549.png)

I configured **AWS Cost Anomaly Detection** to automatically detect unusual spending patterns and provide root cause analysis.

### Configuration:

* Created a Cost Monitor
* Configured email notifications
* Set an anomaly threshold of approximately `$5 USD`

Unlike standard AWS Budget alerts, Cost Anomaly Detection focuses on identifying unexpected spikes or abnormal cost behavior.

The service also provides root cause analysis, helping identify which AWS services contributed to the increased spending.

---

# S3 Lifecycle Policies

For this section of the lab, I implemented Amazon S3 Lifecycle Policies to automate storage cost optimization.

S3 Lifecycle Policies help reduce storage costs by automatically transitioning objects into cheaper storage classes based on access patterns.

I created a test S3 bucket containing sample data and configured lifecycle rules under the bucket management settings.

## Lifecycle Configuration

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/482d31c71770203a05e1b3964d2ebd4b20142de8/Week%2013%20-%20AWS%20Cost%20Optimization/Screenshots/Pasted%20image%2020260529133607.png)

The following lifecycle action was enabled:

* Transition current versions of objects between storage classes

### Configured Rules:

* Transition objects to **S3 Standard-IA** after `30 days`
* Transition objects to **S3 Glacier Deep Archive** after `365 days`

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/482d31c71770203a05e1b3964d2ebd4b20142de8/Week%2013%20-%20AWS%20Cost%20Optimization/Screenshots/5.png)

This demonstrated how organizations can automate long-term archival storage while minimizing manual intervention and storage costs.

---

# EC2 Right-Sizing

For this lab, I intentionally created an oversized EC2 instance and then resized it to better fit the workload requirements.

The EC2 instance was running a simple web server on a `t3.medium` instance type, which was unnecessarily large for the workload.

## Right-Sizing Process

1. Stopped the EC2 instance
2. Changed the instance type
3. Restarted the instance

![alt image]()

### Instance Migration

* Original Instance Type: `t3.medium`
* New Instance Type: `t2.micro`

The instance was successfully resized without changing:

* Instance ID
* Private IP Address

This exercise demonstrated how AWS allows compute resources to be resized quickly while maintaining instance identity and networking configuration.

---

# Cost Optimization Strategy Summary

## 1. Identify and Eliminate Waste

### Clean Up Unused Resources

* Remove unattached EBS volumes
* Delete outdated snapshots and AMIs
* Regularly audit unused cloud resources

### Automate Non-Production Shutdowns

* Use AWS Instance Scheduler or AWS Lambda to automatically stop development and staging environments during off-hours

---

## 2. Right-Size and Automate Compute Resources

### Downsize Over-Provisioned Instances

* Use AWS Cost Explorer and CloudWatch metrics to identify underutilized EC2 instances
* Migrate workloads to more cost-efficient instance families when appropriate

### Implement Auto Scaling

* Automatically scale resources based on workload demand
* Prevent overpaying for idle infrastructure

### Utilize Spot Instances

* Use Spot Instances for fault-tolerant or batch-processing workloads
* Reduce compute costs significantly compared to On-Demand pricing

---

## 3. Commit to Discount Pricing Models

### Savings Plans

* Commit to long-term compute usage for discounted pricing on:

  * Amazon EC2
  * AWS Lambda
  * AWS Fargate

### Reserved Instances

* Use Reserved Instances for predictable, long-running workloads

---

## 4. Optimize Storage and Data Transfer

### Archive Logs and Cold Data

* Configure CloudWatch log retention policies
* Transition infrequently accessed data into lower-cost storage tiers

### Use S3 Lifecycle Policies

* Automate object transitions into:

  * S3 Standard-IA
  * S3 Glacier
  * S3 Glacier Deep Archive

---

# Week 13 - Incidents

During Week 13, there were no major incidents to report. All labs were completed successfully while following AWS documentation and best practices.

---

# Skills Demonstrated

* AWS Budgets
* AWS Budget Actions
* AWS Cost Anomaly Detection
* Amazon S3 Lifecycle Policies
* Amazon EC2 Right-Sizing
* Cloud Cost Optimization
* Automated Cost Governance
* AWS Operational Best Practices
* Cloud Resource Management

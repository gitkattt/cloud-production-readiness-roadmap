
# Week 15 - Security Services

## Overview

This week focused on implementing AWS security monitoring, compliance, and governance services. The goal was to gain hands-on experience with AWS GuardDuty, Security Hub, and AWS Config while learning how security findings are generated, investigated, and remediated.

## Objectives

* Enable AWS GuardDuty
* Enable AWS Security Hub
* Configure AWS Config Rules
* Generate and investigate security findings
* Implement automated remediation
* Understand compliance monitoring and security posture management

---

# Lab 1 - AWS GuardDuty

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/391afa0d6e0695e334c1b7a41f00d4906322da9c/Week%2015%20%E2%80%93%20Security%20Services/Screenshots/Pasted%20image%2020260616114236.png)

## What is AWS GuardDuty?

AWS GuardDuty is a threat detection service that continuously monitors AWS accounts and workloads for malicious activity and unauthorized behavior.

GuardDuty analyzes data from multiple AWS sources, including:

* AWS CloudTrail Management Events
* AWS CloudTrail Data Events
* Amazon Route 53 DNS Logs
* VPC Flow Logs

GuardDuty helps detect:

* Compromised AWS credentials
* Suspicious API activity
* Reconnaissance attempts
* Malware activity
* Anomalous behavior

---

## Implementation

For this lab, I enabled AWS GuardDuty within my AWS account.

Because my AWS account was relatively new and had no active threats, I generated sample findings using GuardDuty's built-in sample findings feature. This allowed me to simulate common security incidents and practice investigating findings.

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/391afa0d6e0695e334c1b7a41f00d4906322da9c/Week%2015%20%E2%80%93%20Security%20Services/Screenshots/more%20samples.png)

I explored:

* Finding severity levels
* Resource types
* Filtering findings
* Sorting findings
* Archiving findings
* Reviewing finding details

---

## Results

Successfully:

* Enabled AWS GuardDuty
* Generated sample security findings
* Investigated simulated threats
* Learned how to manage and archive findings

---

# Lab 2 - AWS Security Hub

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/391afa0d6e0695e334c1b7a41f00d4906322da9c/Week%2015%20%E2%80%93%20Security%20Services/Screenshots/Pasted%20image%2020260616114301.png)

## What is AWS Security Hub?

AWS Security Hub is a Cloud Security Posture Management (CSPM) service that centralizes security findings and compliance checks across AWS environments.

Security Hub integrates with services such as:

* AWS GuardDuty
* AWS Config
* AWS Systems Manager
* AWS Inspector
* AWS Firewall Manager
* IAM Access Analyzer
* AWS Health
* Amazon Macie

Security Hub provides:

* Centralized security findings
* Security scores
* Compliance monitoring
* Security standards assessments
* Automated remediation workflows

Supported standards include:

* AWS Foundational Security Best Practices (FSBP)
* CIS AWS Foundations Benchmark
* PCI DSS

---

## Implementation

To begin this lab, I enabled AWS Security Hub.

After enabling Security Hub, I observed that previously generated GuardDuty sample findings were automatically imported and displayed within the Security Hub console.

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/391afa0d6e0695e334c1b7a41f00d4906322da9c/Week%2015%20%E2%80%93%20Security%20Services/Screenshots/sample%20finding%20more%20detailed.png)

I explored:

* Security Score
* Findings
* Insights
* Security Standards
* Controls
* Automations
* Summary Dashboards

---

## Results

Successfully:

* Enabled AWS Security Hub
* Reviewed imported GuardDuty findings
* Explored security controls and standards
* Investigated security findings
* Became familiar with the Security Hub interface

---

# Lab 3 - AWS Config Rules

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/391afa0d6e0695e334c1b7a41f00d4906322da9c/Week%2015%20%E2%80%93%20Security%20Services/Screenshots/Pasted%20image%2020260616114340.png)

## What is AWS Config?

AWS Config continuously records and evaluates AWS resource configurations.

It provides visibility into:

* Current resource configurations
* Configuration history
* Resource relationships
* Compliance status
* Configuration drift

AWS Config can also automate remediation using:

* AWS Systems Manager (SSM)
* AWS Lambda

---

## EBS Encryption Compliance Rule

### Objective

Ensure all EBS volumes are encrypted.

### Implementation

I created an AWS Config managed rule that evaluates whether EBS volumes have encryption enabled.

If a volume is unencrypted, AWS Config marks the resource as:

`NON_COMPLIANT`

---

## Automated Remediation

I configured automatic remediation using AWS Systems Manager Automation.

The remediation workflow:

1. Identifies the non-compliant volume
2. Creates a snapshot of the volume
3. Creates an encrypted copy of the snapshot
4. Creates a new encrypted EBS volume
5. Stops the affected EC2 instance
6. Detaches the unencrypted volume
7. Attaches the encrypted volume
8. Removes the original unencrypted volume

---

## S3 Public Access Compliance Rule

### Objective

Prevent publicly accessible S3 buckets.

### Implementation

I created an AWS Config rule that evaluates whether S3 buckets allow public access.

If public access is detected, AWS Config marks the resource as:

`NON_COMPLIANT`

---

## Results

Successfully:

* Enabled AWS Config
* Created EBS encryption compliance rules
* Created S3 public access compliance rules
* Configured automated remediation using AWS Systems Manager
* Learned how AWS Config evaluates compliance across AWS resources

---

# Lab 4 - Triggering and Investigating Security Findings

## Objective

Generate compliance violations and investigate resulting findings.

---

## Implementation

To test the compliance controls created earlier, I intentionally created non-compliant resources.

### Violations Created

#### EBS Volume

Created an unencrypted EBS volume, violating the encryption compliance rule.

#### S3 Bucket

Configured an S3 bucket with public access enabled, violating the public access compliance rule.

---

## Findings Investigation

After several minutes, AWS Config evaluated both resources and marked them as:

`NON_COMPLIANT`

The findings appeared within AWS Config and were also surfaced within AWS Security Hub.

Additionally, I investigated previously generated GuardDuty sample findings to better understand how security alerts are presented and prioritized.

Example Security Hub finding:

> Amazon S3 Public Access - Anonymous access was granted for an S3 bucket.

---

## Key Takeaways

This lab demonstrated how AWS security services work together:

* GuardDuty provides threat detection
* AWS Config evaluates compliance
* Security Hub aggregates findings and security posture information
* AWS Systems Manager enables automated remediation

Together, these services help organizations improve visibility, maintain compliance, and respond to security issues at scale.

---

# Skills Demonstrated

* AWS GuardDuty
* AWS Security Hub
* AWS Config
* AWS Systems Manager Automation
* Compliance Monitoring
* Security Operations
* Threat Investigation
* Security Posture Management (CSPM)
* Automated Remediation
* AWS Governance
* Cloud Security Best Practices

---

# Technologies Used

* AWS GuardDuty
* AWS Security Hub
* AWS Config
* AWS Systems Manager (SSM)
* Amazon S3
* Amazon EBS
* AWS CloudTrail
* Amazon Route 53
* VPC Flow Logs

---

# Outcome

By completing this lab, I gained hands-on experience implementing AWS security monitoring, compliance validation, and automated remediation. I learned how AWS GuardDuty, Security Hub, and AWS Config work together to identify threats, enforce compliance standards, and improve overall cloud security posture.

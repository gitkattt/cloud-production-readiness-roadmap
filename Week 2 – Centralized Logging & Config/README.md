# Week 2 - Centralized Logging & Config

## Objective

Implemented organization-wide auditing and compliance controls by enabling AWS CloudTrail across all accounts, creating a centralized logging account, and using AWS Config to detect and remediate misconfigurations.

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/45ecdce2825317e27efa8ad6873ac474ec60f68b/Week%202%20%E2%80%93%20Centralized%20Logging%20%26%20Config/Screenshots/Week%202%20SS.png)

## Services Used

* AWS Organizations
* AWS CloudTrail
* Amazon S3
* Cross-Account Access
* AWS Config
* IAM Policies

## Environment Setup

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/45ecdce2825317e27efa8ad6873ac474ec60f68b/Week%202%20%E2%80%93%20Centralized%20Logging%20%26%20Config/Screenshots/Week%202%20SS2.png)

### Organization-Level CloudTrail

Enabled an organization trail to capture API activity across all member accounts and Organizational Units (OUs).

### Centralized Logging Account

Created a dedicated logging account to isolate audit records from workload accounts.

* Logging Account Name: **Bob**
* S3 Bucket: **bobs-logging-bucket-1**

Configured centralized storage for CloudTrail logs with cross-account access.

## Governance Benefits

* Centralized audit trail across the organization
* Separation of duties between workload and logging accounts
* Improved security visibility
* Long-term log retention for investigations and compliance

## AWS Config Implementation

Enabled AWS Config to monitor resource compliance and detect infrastructure drift.

### Misconfiguration Test Performed

Detected security groups allowing public SSH access on port **22**.

### Remediation

* Reviewed affected security groups
* Removed overly permissive inbound rules
* Revalidated compliance status

## Validation

* Confirmed CloudTrail delivery from organization accounts
* Verified log storage in centralized S3 bucket
* Tested AWS Config rule detection
* Confirmed remediation of public SSH exposure

## Incident Encountered

### Issue

Cross-account log delivery initially failed due to an incorrect S3 bucket policy.

### Root Cause

The bucket policy for **bobs-logging-bucket-1** did not properly allow required cross-account access and CloudTrail write permissions.

### Impact

* Log delivery issues from member accounts
* Delayed centralized auditing setup

### Resolution

* Recreated bucket policy
* Confirmed CloudTrail service permissions
* Retested cross-account log delivery

## Lessons Learned

* S3 bucket policies must align with IAM permissions
* Service principals are critical for AWS-managed integrations
* Logging architecture should be validated end-to-end
* Follow AWS documentation carefully for cross-account services

## Resume Bullet

Implemented organization-wide CloudTrail logging with a centralized S3 audit account and used AWS Config to detect and remediate public SSH security group misconfigurations.


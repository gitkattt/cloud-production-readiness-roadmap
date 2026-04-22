
# Week 6 - Disaster Recovery

## Objective

Implemented disaster recovery strategies for storage and databases using cross-region replication and high availability architecture. Simulated service disruption scenarios and validated failover procedures through a disaster recovery playbook.

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/d8391910574b8224e9b7baffb459d95c2883a0e3/Week%206%20%E2%80%93%20Disaster%20Recovery/Screenshots/4.png)

## Services Used

* Amazon S3
* S3 Cross-Region Replication (CRR)
* Amazon RDS
* Multi-AZ RDS
* IAM Roles

## Cross-Region S3 Replication

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/d8391910574b8224e9b7baffb459d95c2883a0e3/Week%206%20%E2%80%93%20Disaster%20Recovery/Screenshots/1.png)

Created two Amazon S3 buckets in separate geographic regions:

* **Primary Bucket:** us-east-1 (N. Virginia)
* **Secondary Bucket:** eu-central-1 (Frankfurt)

### Configuration Steps

* Enabled versioning on both buckets
* Created replication rules from primary to secondary bucket
* Assigned appropriate IAM role for replication permissions
* Uploaded test objects and verified successful replication

## Business Continuity Benefits

* Geographic redundancy
* Protection against regional outages
* Improved disaster recovery readiness
* Durable off-site copy of critical data

## Multi-AZ RDS Deployment

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/d8391910574b8224e9b7baffb459d95c2883a0e3/Week%206%20%E2%80%93%20Disaster%20Recovery/Screenshots/2.png)

Deployed Amazon RDS in a Multi-AZ configuration for database resilience.

### Architecture

* Primary instance in **us-east-1f**
* Standby instance in **us-east-1a**

### Validation

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/d8391910574b8224e9b7baffb459d95c2883a0e3/Week%206%20%E2%80%93%20Disaster%20Recovery/Screenshots/3.png)

* Modified data on primary database
* Confirmed synchronous replication to standby instance
* Verified high availability design

## Disaster Recovery Simulation

Performed a simulated outage scenario for storage services.

### Scenario

Primary S3 bucket became unavailable.

### Response

* Redirected operations to replicated secondary bucket
* Confirmed failover continuity using replicated objects

## Validation

* Confirmed successful S3 object replication across regions
* Verified RDS standby synchronization
* Tested failover access to secondary storage bucket
* Confirmed IAM permissions functioned as expected

## Operational Notes

No major incidents occurred during this week’s deployment. Prior lessons learned from previous database connectivity troubleshooting improved setup speed and efficiency.

## Lessons Learned

* Cross-region replication strengthens recovery posture
* Versioning is essential for S3 replication workflows
* Multi-AZ improves database availability with minimal management overhead
* Disaster recovery plans should be tested, not assumed
* Previous operational experience reduces future deployment risk

## Resume Bullet

Implemented disaster recovery solutions using Amazon S3 cross-region replication and Multi-AZ RDS, then validated failover readiness through simulated outage testing.

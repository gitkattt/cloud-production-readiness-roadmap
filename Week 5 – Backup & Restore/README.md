
# Week 5 - Backup & Restore

## Objective

Implemented backup and recovery strategies for Amazon RDS and Amazon EC2 using native AWS snapshot capabilities and AWS Backup. Tested restore procedures and documented Recovery Time Objective (RTO) and Recovery Point Objective (RPO).

## Services Used

* Amazon RDS
* AWS Backup
* Amazon EC2
* Amazon EBS Snapshots
* Amazon Machine Images (AMI)
* SQL Server Management Studio (SSMS)

## Backup Strategy

Configured multiple layers of data protection using both service-native backups and centralized backup management.

### Amazon RDS Backups

Created an RDS database instance and enabled backup capabilities.

Performed the following:

* Connected to the database using SQL Server Management Studio
* Created test data records/files
* Generated a database snapshot
* Restored from snapshot
* Validated that restored data remained intact

### AWS Backup Plan

Created a centralized AWS Backup policy with:

* Daily backup schedule
* 35-day retention period
* Successful backup job validation

## EC2 Snapshot Restore

Created an EC2 instance containing important demo data and system changes.

Performed the following recovery workflow:

* Created snapshot of attached storage
* Converted snapshot into an AMI
* Launched replacement EC2 instance from AMI
* Verified restored data and configuration integrity

## Recovery Metrics

### Amazon RDS

* **RTO:** ~15–20 minutes
* **RPO:** 0 minutes (no data changes since snapshot)

### Amazon EC2

* **RTO:** ~2–5 minutes
* **RPO:** 0 minutes (no data changes since snapshot)

## Validation

* Confirmed successful RDS snapshot restore
* Verified database data consistency after recovery
* Confirmed AWS Backup jobs completed successfully
* Validated EC2 recovery through AMI deployment
* Verified restored files and configuration settings

## Incident Encountered

### Issue

Unable to connect to the RDS database through SQL Server Management Studio.

### Root Cause

The RDS instance was configured as private and associated security groups did not allow required inbound connectivity.

### Impact

* External administrative access failed
* Delayed backup and restore testing
* Additional troubleshooting required

### Resolution

* Modified RDS accessibility settings
* Enabled public access for testing purposes
* Updated security group rules to allow required traffic
* Retested successfully

## Lessons Learned

* Backup success does not equal recovery readiness
* Restore testing is essential for disaster recovery confidence
* Network configuration directly affects database administration
* RTO/RPO metrics help define business continuity expectations

## Resume Bullet

Implemented AWS backup and recovery solutions for RDS and EC2, validated snapshot restores, and documented RTO/RPO metrics through hands-on disaster recovery testing.

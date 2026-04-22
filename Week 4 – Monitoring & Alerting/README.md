
# Week 4 - Monitoring & Alerting

## Objective

Implemented proactive monitoring and alerting for production workloads using Amazon CloudWatch, Amazon SNS, and operational dashboards. Simulated high CPU conditions to validate automated response workflows and incident notification processes.

## Services Used

* Amazon CloudWatch
* CloudWatch Alarms
* CloudWatch Dashboards
* Amazon SNS
* Amazon EC2

## Monitoring Architecture

Configured observability controls for EC2 instances running in the production environment.

### CloudWatch Alarm Configuration

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/c0fade25f2669d2b6fa56f21996e616b99a81cbd/Week%204%20%E2%80%93%20Monitoring%20%26%20Alerting/Screenshots/1.png)

Created an alarm that monitored EC2 CPU utilization and triggered when usage exceeded defined thresholds.

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/c0fade25f2669d2b6fa56f21996e616b99a81cbd/Week%204%20%E2%80%93%20Monitoring%20%26%20Alerting/Screenshots/1-1fixed.png)

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/c0fade25f2669d2b6fa56f21996e616b99a81cbd/Week%204%20%E2%80%93%20Monitoring%20%26%20Alerting/Screenshots/3-1.png)

### Automated Response Actions

When alarm conditions were met:

* Sent notifications to team members via email using Amazon SNS
* Automatically stopped the affected EC2 instance to prevent runaway cost or further degradation
* Enabled investigation of the impacted workload

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/c0fade25f2669d2b6fa56f21996e616b99a81cbd/Week%204%20%E2%80%93%20Monitoring%20%26%20Alerting/Screenshots/1-2fixed.png)

## Monitoring Dashboard

Built a CloudWatch dashboard to centralize operational visibility.

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/c0fade25f2669d2b6fa56f21996e616b99a81cbd/Week%204%20%E2%80%93%20Monitoring%20%26%20Alerting/Screenshots/2-1fixed.png)

### Dashboard Included

* EC2 metrics
* CPU utilization trends
* Alarm states
* Instance health indicators

### Operational Benefits

* Single-pane-of-glass monitoring
* Faster issue detection
* Easier production oversight
* Centralized access to metrics and alerts

## Incident Simulation

Performed a stress test that caused an EC2 instance to enter sustained high CPU utilization.

### Result

* CloudWatch alarm entered **ALARM** state
* SNS notifications sent to team members
* EC2 instance automatically stopped for review

## Validation

* Confirmed alarm thresholds triggered correctly
* Verified SNS email delivery
* Confirmed automated stop action executed
* Validated dashboard metric visibility during event

## Incident Report

### Issue

Production EC2 instance experienced high CPU usage during workload stress testing.

### Root Cause

Sustained CPU demand exhausted available compute resources.

### Impact

* CloudWatch alarm triggered
* EC2 instance was stopped automatically
* Team members received immediate notifications
* Temporary workload disruption for remediation

### Resolution

* Alerting workflow enabled rapid awareness
* Team reviewed instance metrics and logs
* Corrective action could be taken quickly due to automated response

## Lessons Learned

* Monitoring should be proactive, not reactive
* Automated alerts reduce response time significantly
* Dashboards improve operational awareness
* Alarm actions can help contain incidents quickly

## Resume Bullet

Implemented AWS CloudWatch alarms, dashboards, and SNS notifications for EC2 monitoring, including automated incident response actions during high CPU events.

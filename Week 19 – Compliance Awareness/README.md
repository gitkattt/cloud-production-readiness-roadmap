# Week 19 – Compliance Awareness (HIPAA, SOC 2 & NIST)

## Overview

As part of my **6-Month Cloud Production Readiness Roadmap**, this week focused on understanding the compliance frameworks and security standards commonly encountered in enterprise cloud environments.

Rather than deploying infrastructure, the objective was to understand **why organizations implement security controls**, how cloud providers support compliance, and how AWS services help organizations meet regulatory requirements.

## Objectives

* Study HIPAA fundamentals
* Study SOC 2 fundamentals
* Study the NIST Cybersecurity Framework
* Understand the AWS Shared Responsibility Model
* Learn how AWS services map to compliance controls
* Explore AWS governance and auditing services

---

# HIPAA

## What is HIPAA?

The **Health Insurance Portability and Accountability Act (HIPAA)** is a United States law designed to protect **Protected Health Information (PHI)** and ensure healthcare organizations properly safeguard patient data.

Examples of Protected Health Information (PHI) include:

* Patient names
* Social Security Numbers (SSNs)
* Medical record numbers
* Email addresses
* Phone numbers
* Insurance information
* Dates of birth

Healthcare organizations must implement administrative, physical, and technical safeguards to protect electronic PHI (ePHI).

---

## HIPAA and Cloud Computing

Cloud providers such as AWS support HIPAA-compliant workloads through the **Shared Responsibility Model**.

### AWS Responsibilities

* Physical security of data centers
* Hardware infrastructure
* Global networking
* Availability of AWS services

### Customer Responsibilities

* IAM configuration
* Encryption
* Network security
* Logging and monitoring
* Key management
* Protecting ePHI

Organizations handling healthcare data must also sign a **Business Associate Agreement (BAA)** with AWS before storing regulated healthcare information.

---

# SOC 2

## What is SOC 2?

SOC 2 is an auditing framework created by the **American Institute of Certified Public Accountants (AICPA)**.

Rather than being a law, SOC 2 is an independent audit that demonstrates an organization properly protects customer data.

SOC 2 evaluates organizations against five **Trust Services Criteria**:

* Security
* Availability
* Processing Integrity
* Confidentiality
* Privacy

---

## SOC 2 Report Types

### Type I

Evaluates whether security controls are properly designed at a specific point in time.

### Type II

Evaluates whether those controls operate effectively over an extended period (typically 3–12 months).

---

## Why SOC 2 Matters

SOC 2 helps organizations:

* Demonstrate security maturity
* Build customer trust
* Meet enterprise procurement requirements
* Improve operational security
* Simplify vendor security assessments

---

# NIST

## What is NIST?

The **National Institute of Standards and Technology (NIST)** develops cybersecurity standards and best-practice frameworks used throughout government agencies and private industry.

Its frameworks provide organizations with a common language for identifying, managing, and reducing cybersecurity risk.

---

## NIST Cybersecurity Framework

The NIST Cybersecurity Framework (CSF) helps organizations:

* Govern
* Identify
* Protect
* Detect
* Respond
* Recover

These functions guide organizations in building and maintaining effective cybersecurity programs.

---

## NIST and Cloud Computing

NIST plays an important role in cloud security by providing:

* Standardized cloud definitions
* Security guidance
* Risk management frameworks
* Best practices for cloud adoption

One of the most influential publications is **NIST SP 800-145**, which defines the five essential characteristics of cloud computing:

* On-demand self-service
* Broad network access
* Resource pooling
* Rapid elasticity
* Measured service

---

# AWS Compliance Services

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/62de6401cee2f6b16dd92f166a725cc3d4b46a93/Week%2019%20%E2%80%93%20Compliance%20Awareness/screenshots/Pasted%20image%2020260718142822.png)

AWS provides several services that help organizations monitor, assess, and demonstrate compliance with regulatory frameworks.

## AWS Audit Manager

Automatically collects evidence from AWS resources and maps it against compliance frameworks such as:

* HIPAA
* SOC 2
* PCI DSS
* GDPR
* NIST

---

## AWS Security Hub

Aggregates security findings from multiple AWS services into a centralized dashboard while continuously evaluating resources against security best practices.

---

## AWS Config

Tracks resource configuration changes over time and evaluates AWS resources against compliance rules.

Examples include:

* Encryption enabled
* Public S3 bucket detection
* Security Group validation
* IAM policy compliance

---

## AWS Artifact

Provides on-demand access to official AWS compliance documentation, including:

* SOC Reports
* ISO Certifications
* PCI Reports
* AWS Responsibility Summaries

---

## AWS Control Tower

Helps organizations establish secure multi-account AWS environments by implementing:

* Landing Zones
* Guardrails
* Organizational policies
* Governance automation

---

# Key Takeaways

Throughout this week's study I learned that cloud compliance extends beyond simply securing infrastructure. Organizations must demonstrate that appropriate security controls are implemented, monitored, and continuously maintained.

I also gained a better understanding of how AWS supports compliance through governance, auditing, monitoring, and automation services while customers remain responsible for securely configuring their own cloud environments under the Shared Responsibility Model.

---

# Skills Demonstrated

* AWS Cloud Governance
* HIPAA Fundamentals
* SOC 2 Fundamentals
* NIST Cybersecurity Framework
* Shared Responsibility Model
* AWS Audit Manager
* AWS Config
* AWS Security Hub
* AWS Artifact
* AWS Control Tower
* Cloud Compliance
* Risk Management
* Security Best Practices
* Cloud Governance
* Enterprise Cloud Architecture

---

# Technologies & Services

* Amazon Web Services (AWS)
* AWS Audit Manager
* AWS Config
* AWS Security Hub
* AWS Artifact
* AWS Control Tower
* AWS IAM
* AWS CloudTrail
* AWS KMS

---

# What I Learned

This week's focus helped me better understand how enterprise organizations approach security and regulatory compliance in cloud environments.

Rather than viewing compliance as a checklist, I learned how frameworks such as HIPAA, SOC 2, and NIST influence cloud architecture, governance, access management, auditing, and continuous monitoring. I also explored the AWS services that help organizations collect evidence, enforce security controls, and maintain compliance throughout the lifecycle of their cloud workloads.


# Week 14 – Advanced IAM Security and Cross-Account Access

## Overview

This project focused on advanced AWS Identity and Access Management (IAM) concepts, including:

* Implementing IAM Permission Boundaries
* Configuring Cross-Account Access with IAM Roles
* Preventing Privilege Escalation
* Troubleshooting IAM Authorization Issues
* Documenting Security Controls and Root Cause Analysis

The goal was to better understand how organizations enforce least-privilege access and securely grant permissions across multiple AWS accounts.

---

# Lab 1: IAM Permission Boundaries

## Objective

Implement an IAM Permission Boundary to prevent users from escalating privileges while still allowing them to perform administrative IAM tasks within defined limits.

---

## Permission Boundary Configuration

I created a custom IAM policy named:

```text
PermissionsBoundary
```

The policy allowed IAM actions while enforcing several security controls through explicit deny statements.

### Security Controls Implemented

| Statement                                         | Purpose                                                     |
| ------------------------------------------------- | ----------------------------------------------------------- |
| DenyPermBoundaryIAMPolicyAlteration               | Prevent users from modifying the permission boundary policy |
| DenyRemovalOfPermBoundaryFromAnyUserOrRole        | Prevent removal of permission boundaries                    |
| DenyAccessIfRequiredPermBoundaryIsNotBeingApplied | Require the boundary to be applied                          |
| DenyUserAndRoleCreationWithoutPermBoundary        | Prevent creation of users or roles without the boundary     |

---

## Testing the Permission Boundary

### Test User

```text
Ronnie
```

The user was granted broad IAM permissions and assigned the Permission Boundary.

I then attempted to create a new IAM user with elevated permissions using the AdministratorAccess policy.

### Result

AWS returned the following error:

```text
User arn:aws:iam::ACCOUNT_ID:user/Ronnie is not authorized to perform: iam:CreateUser on resource: arn:aws:iam::ACCOUNT_ID:user/X-user with an explicit deny in a permissions boundary
```

### Outcome

The Permission Boundary successfully prevented privilege escalation.

Without the boundary, a user with sufficient IAM permissions could potentially create additional users with elevated access levels.

---

# Lab 2: Cross-Account S3 Access

## Objective

Provide secure access to an S3 bucket located in a separate AWS account using IAM Roles and AWS STS.

---

## Environment

```text
AWS Management
└── Management OU
    └── Account: Bob

AWS Production
└── Production OU
    └── Account: Sally
```

The goal was to allow a user in the Management account to access specific resources within the Production account.

---

## Configuration

### Management Account

Created a user named:

```text
Bob
```

Attached a policy allowing the user to assume a role in the Production account.

### Production Account

Created two S3 buckets:

```text
bobs-bucket-6687
sallys-bucket-8867
```

Created an IAM role:

```text
bucket-reader-bob
```

### Trust Policy

Configured the trust relationship to allow the Bob user from the Management account to assume the role.

### Permissions Granted

The role was granted:

* s3:ListBucket
* s3:GetObject
* s3:PutObject

Access was limited exclusively to:

```text
bobs-bucket-6687
```

---

## Validation

Using AWS CloudShell and AWS STS:

```bash
aws sts assume-role
```

I successfully assumed the role and accessed objects within:

```text
bobs-bucket-6687
```

Attempting to access:

```text
sallys-bucket-8867
```

resulted in an Access Denied error.

### Outcome

The cross-account role functioned as expected and enforced least-privilege access.

---

# Lab 3: Intentional IAM Misconfiguration

## Objective

Intentionally break IAM security controls to better understand privilege escalation risks and troubleshooting procedures.

---

## Changes Made

I removed the following deny statements from the Permission Boundary:

```text
DenyPermBoundaryIAMPolicyAlteration
DenyRemovalOfPermBoundaryFromAnyUserOrRole
DenyAccessIfRequiredPermBoundaryIsNotBeingApplied
DenyUserAndRoleCreationWithoutPermBoundary
```

---

## Result

After removing the protections, users were able to create additional IAM users with elevated permissions.

Several test users were created successfully, demonstrating how a weakened Permission Boundary could lead to privilege escalation.

### Security Impact

In a production environment, this type of misconfiguration could allow users to bypass security controls and gain unauthorized administrative access.

---

## Remediation

The issue was resolved by restoring the previous version of the Permission Boundary policy.

After reverting the policy, privilege escalation attempts were once again blocked.

---

# IAM Troubleshooting Example

## Issue

While attempting to assume a cross-account role, AWS returned an authorization error indicating that the user was not permitted to assume the role.

### Root Cause

The role name referenced in the Management account policy did not match the actual role name in the Production account.

Management Account Policy:

```text
bob-bucket-reader
```

Production Account Role:

```text
Bob-Bucket-Reader
```

Because IAM role ARNs are case-sensitive, the role assumption failed.

### Resolution

Updated the Management account policy to reference the correct role name.

```text
Bob-Bucket-Reader
```

After updating the policy, role assumption succeeded.

---

# Key Concepts Learned

* IAM Permission Boundaries
* Privilege Escalation Prevention
* Explicit Deny Behavior
* Cross-Account Access
* AWS STS AssumeRole
* IAM Trust Policies
* Least Privilege Security
* IAM Troubleshooting
* Root Cause Analysis
* S3 Access Control

---

# Skills Demonstrated

* AWS IAM Administration
* Security Policy Design
* Cross-Account Resource Access
* Identity and Access Management
* AWS Organizations
* Access Troubleshooting
* Security Validation Testing
* Cloud Security Fundamentals

---

# Conclusion

This project provided hands-on experience with advanced IAM security controls and cross-account access management.

By implementing Permission Boundaries, configuring cross-account IAM roles, intentionally breaking security controls, and troubleshooting authorization failures, I gained a deeper understanding of how AWS organizations enforce least-privilege access and protect against privilege escalation.

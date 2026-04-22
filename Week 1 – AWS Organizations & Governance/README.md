# Week 1 - AWS Organizations & Governance

## Objective

Designed a multi-account AWS environment using AWS Organizations to separate Development, Staging, and Production workloads while enforcing centralized governance through Service Control Policies (SCPs).

## Services Used

* AWS Organizations
* Organizational Units (OUs)
* Service Control Policies (SCPs)
* IAM

## Organizational Structure

```text
Root Account
├── Dev OU
│   └── Dev Account
├── Staging OU
│   └── Staging Account
└── Production OU
    └── Production Account
```

## Policies Implemented

### Dev OU

* Denied Amazon EKS creation

### Production OU

* Denied public IP address creation

### Organization Wide

* Denied access outside approved US regions

## Validation

* Confirmed SCP inheritance
* Tested restrictions from member accounts
* Verified governance boundaries

## Incident Encountered

### Issue

Malformed SCP blocked member accounts from accessing AWS resources.

### Resolution

* Disabled SCP
* Reviewed policy conditions
* Retested before reapplying

## Lessons Learned

* SCPs override IAM permissions
* Test deny policies incrementally
* Use staged rollouts for governance changes

## Resume Bullet

Implemented a multi-account AWS Organizations environment with governance guardrails using SCPs across Dev, Staging, and Production accounts.


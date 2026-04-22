
Week 1 – AWS Organizations & Governance
Objective

Designed a multi-account AWS environment using AWS Organizations to separate Development, Staging, and Production workloads while enforcing centralized governance through Service Control Policies (SCPs).

Services Used
AWS Organizations
Organizational Units (OUs)
Service Control Policies (SCPs)
IAM / Account Governance
Environment Structure
Root Account
├── Dev OU
│   └── Dev Account
├── Staging OU
│   └── Staging Account
└── Production OU
    └── Production Account
Governance Design

Implemented account separation to improve:

Security boundaries
Operational isolation
Least privilege governance
Reduced blast radius between environments
Account Purposes
Root Management Account – Central governance and billing
Dev Account – Experimental workloads and testing
Staging Account – Pre-production validation
Production Account – Live production workloads
Service Control Policies Implemented
Dev OU Policy

Restricted Amazon EKS usage inside development environments to control cost and prevent unnecessary cluster creation.

Production OU Policy

Denied creation of public IP addresses to reduce accidental internet exposure of production resources.

Organization-Wide Policy

Restricted access outside approved U.S. regions for governance and compliance control.

Validation / Testing

Confirmed SCP inheritance behavior across OUs and tested restrictions from member accounts to verify policy enforcement.

Incident Encountered
Issue

A malformed organization-wide SCP unintentionally blocked multiple member accounts from accessing AWS resources.

Root Cause

Condition logic inside the region restriction SCP was misconfigured, resulting in broader deny behavior than intended.

Impact
Member accounts lost expected access
Administrative confusion during troubleshooting
Temporary governance disruption
Resolution
Disabled affected SCP
Reviewed policy syntax and condition logic
Retested using narrower scope before reapplying
Lessons Learned
SCPs override IAM permissions and must be tested carefully
Apply deny policies incrementally
Validate conditions in isolated OUs before organization-wide rollout
Governance changes require rollback planning

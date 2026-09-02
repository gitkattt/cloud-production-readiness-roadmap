# Week 20 – AWS Glue ETL & AWS Athena

## Overview

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/f25ccee0e60fc0995df177a6a1098455a205be20/Week%2020%20%E2%80%93%20AWS%20Glue%20ETL%20%26%20AWS%20Athena/Screenshots/Pasted%20image%2020260902134439.png)

This lab was created to gain hands-on experience with **AWS Glue**, focusing on the AWS Glue Data Catalog, Crawlers, Amazon Athena, and Glue ETL Jobs.

The goal was to understand how AWS Glue can be used to discover, catalog, transform, and query data stored in Amazon S3.

### Services Used

* **AWS Glue**

  * Glue Data Catalog
  * Glue Crawlers
  * Glue ETL Jobs
  * Glue Connections
* **Amazon S3**
* **Amazon Athena**
* **AWS IAM**
* **Amazon CloudWatch**

---

# Lab Architecture

The basic workflow for this lab was:

```text
                    ┌─────────────────┐
                    │   Sample CSV    │
                    │  Customer Data  │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │    Amazon S3    │
                    │    Raw Data     │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  AWS Glue       │
                    │    Crawler      │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ Glue Data       │
                    │ Catalog         │
                    │                 │
                    │ project_db      │
                    │ customers table │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ Amazon Athena   │
                    │   SQL Queries   │
                    └─────────────────┘

                             │
                             │
                             ▼
                    ┌─────────────────┐
                    │ AWS Glue ETL    │
                    │      Job        │
                    └────────┬────────┘
                             │
                   Drop Phone Field
                             │
                             ▼
                    ┌─────────────────┐
                    │    Amazon S3    │
                    │ transformed_zone│
                    │                 │
                    │ Parquet Output  │
                    └─────────────────┘
```

---

# 1. Initial Setup

I began by creating the resources required for the lab.

### Amazon S3

I created an S3 bucket to store the raw customer data and the transformed output.

The bucket contained the following logical structure:

```text
s3://<bucket-name>/
├── raw/
│   └── customers.csv
│
└── transformed_zone/
    └── <generated-parquet-file>
```

> Bucket names have been omitted from this README because the lab resources were deleted during cleanup.

### IAM

I created an IAM role for AWS Glue with the permissions necessary for the lab, including access to the S3 data and CloudWatch logging.

---

# 2. Sample Customer Data

I created a sample CSV file containing 100 customers.

The dataset used the following schema:

| Column     | Description                |
| ---------- | -------------------------- |
| CustomerID | Unique customer identifier |
| FirstName  | Customer first name        |
| LastName   | Customer last name         |
| Email      | Customer email address     |
| Phone      | Customer phone number      |
| Country    | Customer country           |
| SignUpDate | Customer signup date       |

The data was entirely fictional and created specifically for this lab.

---

# 3. AWS Glue Data Catalog

I created a database in the AWS Glue Data Catalog named:

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/f25ccee0e60fc0995df177a6a1098455a205be20/Week%2020%20%E2%80%93%20AWS%20Glue%20ETL%20%26%20AWS%20Athena/Screenshots/dbf.png)

```text
project_db
```

An AWS Glue Data Catalog database acts as a **logical grouping/container for tables**.

It is important to understand that creating a Glue database or table **does not move the underlying data into AWS Glue**.

The actual data remains in its original data source, which in this lab was Amazon S3.

---

# 4. AWS Glue Tables

AWS Glue tables contain **metadata describing data stored in an external data source**.

The metadata can include information such as:

* Data location
* File format
* Column names
* Data types
* Schema information
* Partition information

For this lab, the table pointed to the CSV file stored in Amazon S3.

### Creating Tables

AWS Glue provides two primary approaches for creating tables:

1. **Manually define the table schema**
2. **Use an AWS Glue Crawler to automatically discover the schema**

For this lab, I chose to use a **Glue Crawler**.

---

# 5. AWS Glue Crawler

An AWS Glue Crawler automatically connects to a supported data source, scans the data, determines its structure/schema, and creates or updates metadata in the Glue Data Catalog.

For this lab, the crawler was configured to scan the customer CSV data stored in Amazon S3.

### Initial Crawler Failure

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/f25ccee0e60fc0995df177a6a1098455a205be20/Week%2020%20%E2%80%93%20AWS%20Glue%20ETL%20%26%20AWS%20Athena/Screenshots/3.webp)

The first crawler run failed because the IAM role did not have the appropriate permissions required by AWS Glue.

Initially, I had focused on providing access to:

* Amazon S3
* CloudWatch Logs

After reviewing the failure, I identified the IAM permissions issue and updated the Glue service role with the appropriate AWS Glue permissions.

I then re-ran the crawler.

### Result

The second crawler run completed successfully.

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/f25ccee0e60fc0995df177a6a1098455a205be20/Week%2020%20%E2%80%93%20AWS%20Glue%20ETL%20%26%20AWS%20Athena/Screenshots/4.webp)

I verified that:

* The `project_db` database existed
* The `customers` table was created
* The table contained the discovered schema
* The table pointed to the appropriate S3 location

This was a useful troubleshooting exercise because it demonstrated how IAM permissions can directly affect Glue crawler execution.

---

# 6. Querying the Data with Amazon Athena

After the crawler successfully created the table, I opened **Amazon Athena** to query the data using SQL.

Because Athena can query tables registered in the Glue Data Catalog, I was able to query the customer dataset without manually importing the CSV into Athena.

For example:

```sql
SELECT *
FROM "project_db"."customers"
LIMIT 10;
```

This returned a preview of the customer data stored in Amazon S3.

![alt image](https://github.com/gitkattt/cloud-production-readiness-roadmap/blob/f25ccee0e60fc0995df177a6a1098455a205be20/Week%2020%20%E2%80%93%20AWS%20Glue%20ETL%20%26%20AWS%20Athena/Screenshots/data.webp)

### Key Concept

The overall relationship between the services was:

```text
Amazon S3
   │
   │ Stores actual data
   ▼
AWS Glue Crawler
   │
   │ Discovers schema
   ▼
Glue Data Catalog
   │
   │ Stores metadata
   ▼
Amazon Athena
   │
   │ Executes SQL
   ▼
Query Results
```

This helped reinforce the distinction between **data storage** and **data cataloging/metadata**.

---

# 7. AWS Glue Connections

I also reviewed **AWS Glue Connections** to understand how Glue can connect to external data sources and services.

A Glue Connection can be used to provide connection information for resources such as databases and other network-accessible data sources.

I did not create an active connection during this lab because I did not have another database available to connect to.

A future lab will expand on this by connecting Glue to **Amazon Redshift**.

---

# 8. AWS Glue ETL Job

The next portion of the lab focused on AWS Glue ETL Jobs.

AWS Glue ETL Jobs are used to **extract, transform, and load data**.

Glue ETL jobs are serverless and use **Apache Spark** to process data at scale.

Glue provides multiple ways to create ETL jobs, including:

* Visual ETL
* Custom ETL scripts

For this lab, I used the **Visual ETL** interface.

---

# 9. Visual ETL Configuration

The ETL workflow was configured as follows:

```text
Amazon S3
     │
     ▼
Glue Data Catalog
(project_db.customers)
     │
     ▼
Drop Fields Transformation
(Remove Phone)
     │
     ▼
Amazon S3
(transformed_zone/)
```

### Data Source

The source was the customer dataset stored in Amazon S3 and cataloged in:

```text
project_db.customers
```

### Transformation

I added a **Drop Fields** transformation.

The `Phone` column was selected for removal.

The transformation therefore changed the dataset from:

```text
CustomerID
FirstName
LastName
Email
Phone
Country
SignUpDate
```

to:

```text
CustomerID
FirstName
LastName
Email
Country
SignUpDate
```

### Data Target

The transformed data was written to:

```text
s3://<bucket-name>/transformed_zone/
```

The output format was configured as **Apache Parquet**.

---

# 10. ETL Job Execution

I ran the Glue ETL job and monitored its execution.

The job completed successfully after approximately two minutes.

I then verified the output in the S3 bucket and confirmed that the transformed data had been written to the expected:

```text
transformed_zone/
```

location as a Parquet file.

The completed workflow demonstrated a basic data engineering pipeline:

```text
CSV
 │
 ▼
Amazon S3
 │
 ▼
Glue Crawler
 │
 ▼
Glue Data Catalog
 │
 ▼
Athena
 │
 │
 └── SQL Querying
 │
 ▼
Glue ETL Job
 │
 ├── Read data
 ├── Transform data
 │     └── Remove Phone column
 │
 ▼
Apache Parquet
 │
 ▼
Amazon S3
```

---

# 11. Troubleshooting

## Glue Crawler Failed

### Problem

The initial Glue Crawler execution failed.

### Investigation

I reviewed the configuration and determined that the IAM role did not have the appropriate permissions required for the Glue crawler to access and process the data.

### Resolution

I updated the Glue IAM role with the necessary AWS Glue permissions and re-ran the crawler.

### Result

The crawler completed successfully and created the `customers` table in the Glue Data Catalog.

### What I Learned

This reinforced the importance of:

* IAM permissions
* Service roles
* Least-privilege access
* Reviewing service execution failures
* Understanding which AWS service is actually making the API calls

---

# 12. Key Concepts Learned

Through this lab, I gained hands-on experience with the following AWS Glue concepts:

### Glue Data Catalog

The Glue Data Catalog stores metadata about datasets rather than the actual underlying data.

### Glue Databases

A Glue database provides a logical grouping for related tables.

### Glue Tables

Glue tables describe datasets and contain metadata such as schema and data location.

### Glue Crawlers

Crawlers automatically inspect data sources and discover schemas that can be registered in the Glue Data Catalog.

### Glue ETL

Glue ETL jobs can extract data from a source, transform it, and write the resulting dataset to a target.

### Visual ETL

Glue provides a visual interface for building ETL workflows without manually writing the entire transformation script.

### Apache Spark

Glue ETL jobs use Apache Spark to process data at scale.

### Apache Parquet

Parquet is a columnar storage format that is commonly used for analytics workloads because it can provide efficient storage and query performance.

### Amazon Athena

Athena can use the Glue Data Catalog to query datasets stored in S3 using SQL.

### IAM

Glue components require appropriate IAM permissions to interact with other AWS services.

---

# 13. Cleanup

After completing the lab, I deleted the AWS resources that I created to avoid unnecessary ongoing costs.

Resources cleaned up included:

* S3 bucket/data
* AWS Glue database
* Glue tables
* Glue crawler
* Glue ETL job
* IAM resources created specifically for the lab

---

# 14. Skills Demonstrated

This lab provided hands-on experience with:

* AWS Glue
* Glue Data Catalog
* Glue Crawlers
* Glue ETL Jobs
* Visual ETL
* Apache Spark
* Apache Parquet
* Amazon S3
* Amazon Athena
* IAM
* CloudWatch
* SQL
* Data transformation
* Data cataloging
* Basic AWS troubleshooting

---

# Conclusion

This lab gave me practical experience building a basic serverless data processing pipeline using AWS Glue.

I started with raw CSV data stored in Amazon S3, used a Glue Crawler to automatically discover the dataset schema, registered the metadata in the Glue Data Catalog, queried the data using Amazon Athena, and then created a Glue ETL job to transform the dataset and convert it into Parquet format.

The lab also provided practical troubleshooting experience when the initial Glue Crawler execution failed due to IAM permissions.

### Future Improvements

For a future version of this lab, I plan to expand the pipeline by:

* Connecting AWS Glue to Amazon Redshift
* Working with relational database sources
* Creating custom Glue ETL scripts using PySpark
* Adding data partitioning
* Querying the resulting Parquet dataset with Athena
* Exploring Glue Job Bookmarks for incremental processing
* Implementing more complex transformations
* Exploring Glue Workflows for orchestrating multiple jobs

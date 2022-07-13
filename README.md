![RG](https://user-images.githubusercontent.com/42842390/158004336-60f07c05-7e5d-420e-87a6-22c5ac206fb6.jpg)
[Data Flows - CDP Diagram v1.pdf](https://github.com/RedPointGlobal/rp-realtime-playbook-gcp/files/9097095/Data.Flows.-.CDP.Diagram.v1.pdf)
## Redpoint Realtime Decisions (RTD) - MAYO Infrastructure Playbook (GCP)
Redpoint Realtime (RTD) helps businesses unlock contextually relevant experiences that meet customer expectations, at each step of the journey - with real-time engagement, decisions and interactions.

This repo contains Terraform scripts playbook to deploy and configure a High Traffic - Low Latency insfrastructure blueprint to support Redpoint Realtime Decisions (RTD) for MAYO

## Assumptions
This High Traffic blueprint should support:

 - Average <100 ms response times
 - Support the avg response times up to a rate of 10K requests/second
 - Assuming up to 50 million visitor profiles
 - Assuming Visitor Profile size of < 2KB
 - Assuming NoSQL Realtime Aux DB document of < 2KB
 - Assuming Request of Multiple decisions only makes 1 CAL db request

## Requirements
Before this playbook can be executed on a project, you must ensure that the following pre-requisites are fulfilled:

- Terraform is installed on the machine where Terraform is executed.
- The Service Account you execute the scripts with has the right permissions.
- The following Google APIs are active on the project.
```
- bigquery.googleapis.com
- bigtableadmin.googleapis.com
- bigtabletableadmin.googleapis.com
- iam.googleapis.com
- bigtable.googleapis.com
```
## Resources
This playbook creates the following resources in the permitted GCP project
```
- 1 Bigtable Instance
- 2 Bigtable Tables
- 2 BigQuery Datasets
- 1 Cloud Storage Bucket
- 1 Service Account to be used by Realtime Agent
- 1 Bigtable Table IAM permission assignment
- 1 BigQuery Dataset IAM permission assignment
- 1 Cloud Storage Bucket IAM permission assignment
```
## Permissions in Bigtable
Bigtable provides a relatively simple set of IAM permissions when compared to other products in the Google Cloud catalog. In addition to the three primitive IAM roles, Bigtable supports four product-specific roles:
```
roles/bigtable.admin: Full administrative access to all Bigtable operations
roles/bigtable.user: Read-write access to all Bigtable data, without the ability to create new clusters or tables, or scale existing clusters
roles/bigtable.reader: Read-only access to data in Bigtable tables
roles/bigtable.viewer: View-only access to cluster configuration without data access
```
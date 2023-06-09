![RG](https://user-images.githubusercontent.com/42842390/158004336-60f07c05-7e5d-420e-87a6-22c5ac206fb6.jpg)
## Redpoint Realtime Decisions (RTD) - Infrastructure Playbook (GCP)
Redpoint Realtime (RTD) helps businesses unlock contextually relevant experiences that meet customer expectations, at each step of the journey - with real-time engagement, decisions and interactions.

This repo contains Terraform scripts for deploying the supporting insfrastructure in the Google Cloud Platform (GCP)

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

- Terraform is installed on the machine executing the scripts.
- The Service Account used by Terraform has permissions to create resources in the target Google Project
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
- Bigtable Instance
- Bigtable Tables
- BigQuery Datasets
- Cloud Storage Bucket
- Bigtable Table IAM permission assignment
- BigQuery Dataset IAM permission assignment
- Cloud Storage Bucket IAM permission assignment
```
## Access Permissions
Google Cloud IAM supports policies for clients that are not project members. A service account in the Redpoint project that needs access to BigQuery and Bigtable data in the Customer project, can be assigned an IAM policy granting the service account the appropriate role

## Permissions in Bigtable
The Redpoint Application will need the capability to Read-write access to all Bigtable data, without the ability to create new clusters or tables, or scale existing clusters
```
roles/bigtable.user
```
## Permissions in BigQuery
The Redpoint Application will need the capability to Read and update data and metadata for the table or view.
```
roles/bigquery.dataEditor
roles/bigquery.jobUser
roles/bigquery.dataViewer
roles/bigquery.user
```
## Permissions in Cloud Storage
The Redpoint Application will need full control over objects, including listing, creating, viewing, and deleting objects.
```
roles/storage.objectAdmin
```

![RG](https://user-images.githubusercontent.com/42842390/158004336-60f07c05-7e5d-420e-87a6-22c5ac206fb6.jpg)
## Redpoint Realtime Decisions (RTD) - MAYO Infrastructure Playbook (GCP)
Redpoint Realtime (RTD) helps businesses unlock contextually relevant experiences that meet customer expectations, at each step of the journey - with real-time engagement, decisions and interactions.

This repo contains Terraform scripts to deploy and configure a High Traffic - Low Latency insfrastructure blueprint to support Redpoint Realtime Decisions (RTD) for MAYO

## Assumptions
This High Traffic blueprint should support:

 - Average <100 ms response times
 - Support the avg response times up to a rate of 10K requests/second
 - Assuming up to 50 million visitor profiles
 - Assuming Visitor Profile size of < 2KB
 - Assuming NoSQL Realtime Aux DB document of < 2KB
 - Assuming Request of Multiple decisions only makes 1 CAL db request

## Requirements
Before these scripts can be executed on a project, you must ensure that the following pre-requisites are fulfilled:

- Terraform is installed on the machine where Terraform is executed.
- The Service Account you execute the scripts with has the right permissions.
- The following Google APIs are active on the project.
      - bigquery.googleapis.com
      - bigtableadmin.googleapis.com
      - bigtabletableadmin.googleapis.com
      - iam.googleapis.com
      - bigtable.googleapis.com
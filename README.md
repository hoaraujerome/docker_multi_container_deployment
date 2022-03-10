# DEVOPS Project: Multi Docker Containers Deployment to AWS Elastic Beanstalk With GitHub Actions And Terraform
## Goal
Deploy an over the top complicated - 4 containers + 1 Relational Database + 1 in-memory Cache - Fibonacci calculator into a staging environment in a public cloud **automatically** whenever new commits are integrated into the main branch.

Stack:
* Cloud Platform: AWS
* Code Hosting Platform: GitHub
* CI/CD Tool: GitHub Actions
* Infrastructure Management Tool: Terraform
* Container Build Tool: Docker
* Staging Environment: AWS Elastic Beanstalk + RDS + ElastiCache Redis

Overview:

![Overview](/misc/docker_multi_container_deployment-Deployment.jpg)

Deployment Local VS Cloud:

![Deployment](/misc/docker_multi_container_deployment-LocalVSCloud.jpg)

Pipeline:

![Pipeline](/misc/pipeline.jpg)

### Prerequisites
* S3 bucket **with versioning** to store the Terraform states (see "bucket" in the [prebuild configuration](/ci/prebuild/main.tf) and in the deploy [staging configuration](/ci/deploy/backend-staging.tf)).
* IAM user named **devops_githubactions** (see "profile" in the [prebuild configuration](/ci/prebuild/main.tf) and in the deploy [staging configuration](/ci/deploy/staging/main.tf)). Programmatic access only with permissions: RDS, IAM, ElastiCache, EC2 Container Registry, S3, VPC, and Elastic Beanstalk.
* Create 4 repository secrets in your GitHub repository: AWS_ACCESS_KEY + AWS_SECRET_KEY of the IAM user newly created, AWS_ACCOUNT_ID, and POSTGRES_PASSWORD with the desired password for the database.

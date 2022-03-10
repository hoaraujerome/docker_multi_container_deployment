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

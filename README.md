# Github Actions CI/CD Pipline for AWS ECS

## Overview 
- CI: This project aims to publish a docker image to AWS ECR and Github projects with vulnerability scanning tools (eg snyk).
- CD: A simple webapp with application load balancer is created on AWS ECR, which is managed by AWS Fargate. These resources are created using terraform (an IaC tool).
  - Note: the resources will be torn down after 3min.

## Architecture
<img src="image/AWS ECS and ECR with Load Balancer-3.drawio-2.png">

## Technologies Used 
- Github Actions
- AWS
- Terraform 
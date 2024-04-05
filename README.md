# CICD with Docker and AWS 
This project aims to publish a docker image to AWS ECR. A simple webapp will be created with the help of AWS ECS, Fargate and Load Balancer. 

## Built with 
- Terraform 
- AWS 
- Github Actions 

# Getting Started
- Publish docker image to AWS ECR 
- Create a new AWS ECS cluster
- Create a task definition with the published docker image in ECR to be provisioned in AWS ECS cluster
- Use AWS Fargate to run containers without having to manage servers or clusters of Amazon EC2 instances
- Use AWS Load balancer to access our containers
- Github actions
  - CI: to build docker image to AWS ECR


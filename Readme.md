CI/CD Pipeline for Web Application Deployment on AWS ECS

This repository contains a simple web application and a CI/CD pipeline using GitHub Actions to automate the deployment of the application on AWS ECS (Elastic Container Service). The pipeline builds a Docker image, pushes it to Amazon ECR (Elastic Container Registry), and deploys the image to an ECS cluster. Integration tests are performed, and a rollback mechanism is triggered if any tests fail.

This project demonstrates an end-to-end automated deployment pipeline for a simple HTML web application. The pipeline performs the following tasks:

Checks out the code from the GitHub repository.
Builds a Docker image using a multistage Docker build (Nginx as a reverse proxy).
Pushes the image to AWS Elastic Container Registry (ECR).
Deploys the application to an Amazon ECS cluster.
Runs integration tests.
Triggers a rollback if the integration tests fail.

Workflow Overview
The CI/CD pipeline is triggered on each push to the main branch and performs the following steps:

Checkout Code: Retrieves the latest code from the repository.
Login to ECR: Logs into Amazon ECR to push the Docker image.
Build Docker Image: Builds a Docker image using a multistage Dockerfile.
Push Image to ECR: Tags and pushes the Docker image to the ECR repository.
Deploy to ECS: Updates the ECS service to use the new Docker image.
Integration Tests: Runs tests to validate the deployment.
Rollback: If tests fail, the pipeline will trigger a rollback to the previous stable version.
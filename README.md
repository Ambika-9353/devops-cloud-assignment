# DevOps / Cloud Engineer – Assignment: Web Application Deployment

## 1. Architecture

The deployment follows this architecture:

```text
   +-------------------+          +---------------------+
   | GitHub Repository |  Push    | CI/CD Pipeline      |
   |   (App + Docker)  |--------->| GitHub Actions      |
   +-------------------+          +---------------------+
                                         |
                                         v
                                  +----------------+
                                  | Docker Hub     |
                                  |  (Image Repo)  |
                                  +----------------+
                                         |
                                         v
                                  +----------------+
                                  | AWS EC2        |
                                  |  t2.micro      |
                                  |  Docker Runs   |
                                  +----------------+
Components:

GitHub Repository: Contains source code, Dockerfile, Terraform files, and CI/CD workflow.

Docker Hub: Stores container images.

EC2 Instance: Runs the Docker container and hosts the web application.

2. Setup Steps
Clone the Repository
git clone https://github.com/Ambika-9353/devops-cloud-assignment.git
cd devops-cloud-assignment
Terraform Infrastructure
Ensure AWS CLI is configured.

Initialize Terraform:

terraform init
Apply Terraform configuration:

terraform apply
Provisioned resources:

EC2 instance

Security Group (allowing ports 22 & 80)

Key pair (if configured)

Dockerization
Build Docker image:

docker build -t ambikadocker/devops-app:latest .
Test locally:

docker run -p 5000:5000 ambikadocker/devops-app:latest
Push Docker image to Docker Hub:

docker push ambikadocker/devops-app:latest

3. Deployment Process
Deploy on EC2
SSH into the EC2 instance:

ssh -i devops-key.pem ec2-user@52.66.240.65
Pull Docker image:

docker pull ambikadocker/devops-app:latest
Run container:

docker run -d -p 5000:5000 --restart unless-stopped ambikadocker/devops-app:latest
Access the application in browser:

http://52.66.240.65:5000
CI/CD Pipeline
Implemented using GitHub Actions:

Triggered on code push

Builds Docker image

Pushes image to Docker Hub

(Optional) Auto-deploy to EC2 if configured

4. Screenshots
Screenshots/app_running.png → Shows “Application Deployed Successfully” in browser

Screenshots/ec2_instance.png → Shows EC2 instance running in AWS console

5. Verification & Submission Checklist
Docker image exists on Docker Hub: ambikadocker/devops-app:latest

EC2 instance is running: 52.66.240.65

Application works in browser: http://52.66.240.65:5000

CI/CD pipeline runs successfully on GitHub Actions

Repo contains all required files:

app.py

Dockerfile

main.tf

variables.tf

provider.tf

.github/workflows/ci-cd-pipeline.yml

Screenshots/ folder with required screenshots

6. Repo Link
https://github.com/Ambika-9353/devops-cloud-assignment

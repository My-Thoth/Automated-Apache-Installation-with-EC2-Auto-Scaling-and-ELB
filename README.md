
Automated Apache Installation with EC2 Auto Scaling and ELB

This project automates the deployment of Apache web servers on EC2 instances within an Auto Scaling Group (ASG), utilizing Terraform for infrastructure provisioning and an Elastic Load Balancer (ELB) for distributing traffic among the instances.

Project Structure
-----------------
- terraform/: Contains Terraform scripts to set up EC2 Auto Scaling and ELB.
  - autoscaling.tf: Configures the Auto Scaling Group for EC2 instances.
  - loadbalancer.tf: Sets up an Elastic Load Balancer.
  - launch_template.tf: Creates a launch template for EC2 instances.
  - security_groups.tf: Defines security groups for both EC2 and ELB.
  - outputs.tf: Exports important details like the ELB DNS name and ASG information.

- policies/: IAM policies required for Auto Scaling and ELB access.
  - autoscaling-role.json: IAM role that grants necessary permissions to EC2 instances in the ASG.
  - elb-access-policy.json: IAM policy for managing the Elastic Load Balancer and its associated resources.

- modules/: Reusable Terraform modules for Auto Scaling and ELB.
  - ec2-autoscaling-module/: Module to define the configuration for EC2 Auto Scaling.
  - elb-module/: Module to define and manage the Elastic Load Balancer.

- scripts/: Shell scripts for EC2 instance setup and Apache installation.
  - install_apache.sh: Script for installing Apache on new EC2 instances.

Prerequisites
-------------
- Terraform v1.0+
- AWS CLI
- AWS Account with sufficient permissions (IAM policies and programmatic access)

Setup
-----
1. Clone the repository:
   git clone https://github.com/your-username/apache-auto-scaling-elb.git
   cd apache-auto-scaling-elb

2. Configure AWS access:
   - Ensure your AWS credentials are configured in your environment.
   - Modify any variable values in the terraform.tfvars file if necessary.

3. Initialize Terraform:
   terraform init

4. Deploy resources:
   terraform apply

5. Once deployed, you can access the Apache web servers via the Elastic Load Balancer DNS name.

Usage
-----
- Auto Scaling: Automatically adjusts the number of EC2 instances based on load and scaling policies.
- ELB: Distributes incoming traffic across multiple instances to ensure availability and load distribution.
- Apache Installation: Automatically installs Apache on each EC2 instance upon launch, ensuring all instances are web server-ready.

Security Considerations
-----------------------
- Ensure your security groups only allow necessary ports (e.g., HTTP/80) from trusted sources.
- Follow the principle of least privilege when assigning IAM roles and policies.
- Monitor your ELB and EC2 instances using AWS CloudWatch for metrics and alarms.

Contribution
------------
Feel free to submit issues or pull requests for improvements or additional features.

License
-------
This project is licensed under the MIT License.

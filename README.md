
# Quick EC2 Instance Deployment via Terraform (WIP)

This Terraform project sets up a minimal AWS infrastructure to deploy a **EC2 instance using a provided AMI ID**.

---

## Project Purpose

> **Main Goal:**  
> To launch a EC2 instance using a specific AMI ID (e.g., an imported Windows Server 2019 AMI/ your own ami image).  
>  
> The infrastructure is minimal and designed to help you quickly test or deploy an imported VM in AWS.

---


## Architecture Overview

This configuration creates:

- A **VPC** with DNS support
- A **Public Subnet** in Availability Zone `us-east-1a`
- An **Internet Gateway** and associated **Route Table**
- A **Security Group** allowing RDP access (TCP port 3389)
- A **EC2 Instance** based on your provided AMI
- **Terraform outputs** for:
  - EC2 instance ID
  - Public IP address
  - RDP security group ID

---

## Prerequisites

- Terraform installed (v1.0 or higher recommended)
- An AWS account
- An existing AMI ID (e.g., `ami-xxxxxxxxx`)
- A valid EC2 Key Pair created in your AWS account

---

## Step-by-Step Setup

### 1. Clone the repository

```bash
git clone https://github.com/RimDammak/ec2-quick-launch.git
cd ec2-quick-launch
````

### 2. Create a `terraform.tfvars` file

This file will provide your specific configuration values.

```hcl
aws_access_key = "xxxxxxxxxxx"
aws_secret_key = "xxxxxxxxxxxxxxxxxxx"
imported_ami_id = "ami-xxxxxxxxx"  # Example: Windows Server 2019 Base AMI in us-east-1
key_name        = "ec2-keypair-xxxx"
aws_region      = "us-east-1"
```

>  **ps:**
> this file contains sensitive credentials.

---

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Review the plan

```bash
terraform plan -var-file="terraform.tfvars"
```

### 5. Apply the configuration

```bash
terraform apply -var-file="terraform.tfvars"
```

Confirm with `yes` when prompted.

---

### 6. Get the outputs

After deployment, Terraform will display:

* EC2 instance ID
* Public IP address (use this for RDP)
* Security group ID


## Cleanup 

To delete all the created resources:

```bash
terraform destroy -var-file="terraform.tfvars"
```

---

## Notes

* This is a **work-in-progress (WIP)** module.
* Its **main purpose** is to let you **deploy a  VM from a custom or imported AMI** quickly.
* Additional improvements (e.g., Elastic IPs, bastion host, parameterized subnets) are coming soon.

## Security Note

This example **allows RDP (TCP port 3389) access from anywhere (0.0.0.0/0)**.
**Do not use this setting in production.** Restrict access to a known IP range.

---

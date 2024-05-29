# Lab 25: AWS VPC with EC2 and RDS Using Terraform

Welcome to Lab 25! In this lab, we demonstrate how to set up an AWS VPC with public and private subnets, deploy an EC2 instance in the public subnet, and create an RDS instance in the private subnets using Terraform. This configuration leverages Terraform’s capabilities to ensure scalability and reusability through the use of loops and variables.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Configuration Details](#configuration-details)
- [Running the Lab](#running-the-lab)
- [Outputs](#outputs)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before starting, ensure you have the following:

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS account with AWS CLI configured
- AWS Access Key ID and Secret Access Key with necessary permissions to create AWS resources

## Project Structure

Here’s an overview of the project structure:

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── rds/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── README.md  
```

## Getting Started

Clone this repository to your local machine:

```bash
git clone https://github.com/tabana1/iVolve-OJT.git
cd iVolve-OJT/DAY 5/lab 25
```

## Configuration Details

### main.tf

This file contains the main configuration for creating the VPC, subnets, EC2 instance, and RDS instance.

### variables.tf

This file defines the variables used in the `main.tf` file to make the configuration more flexible and reusable.

### outputs.tf

This file specifies the outputs of the Terraform configuration, such as VPC ID, Subnet IDs, and EC2 instance ID.

### modules/

This folder contains reusable modules for creating specific components of the infrastructure:

- **vpc:** Module for creating a VPC with subnets, internet gateway, and route table.
- **ec2:** Module for creating an EC2 instance.
- **rds:** Module for creating an RDS instance.

## Running the Lab

Follow these steps to run the Terraform configuration:

1. **Initialize Terraform:**

   ```bash
   terraform init
   ```

2. **Preview the Terraform plan:**

   ```bash
   terraform plan
   ```

3. **Apply the Terraform configuration:**

   ```bash
   terraform apply
   ```

   Type `yes` when prompted to confirm the changes.

## Outputs

After applying the configuration, you will get the following outputs:

1. **New VPC with Subnets:**
   - One public subnet
   - Two private subnets
   - An Internet Gateway
   - A Route Table

   ![VPC](https://github.com/tabana1/iVolve-OJT/blob/ff81f943c89050242d2de1700f2f016e1c89bc16/DAY%205/lab%2025/VPC.png)

2. **EC2 Instance:**
   - Deployed in the public subnet for easy access

   ![EC2](https://github.com/tabana1/iVolve-OJT/blob/ff81f943c89050242d2de1700f2f016e1c89bc16/DAY%205/lab%2025/ec2.png)

3. **RDS Database:**
   - Securely placed within the private subnets

   ![RDS](https://github.com/tabana1/iVolve-OJT/blob/ff81f943c89050242d2de1700f2f016e1c89bc16/DAY%205/lab%2025/RDS.png)

## Contributing

We welcome contributions! Please fork the repository, create a new branch, and submit a pull request with your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](../../LICENSE) file for details.

---

With this lab, you’ll gain hands-on experience in setting up a secure, scalable AWS environment using Terraform. Dive in, explore, and start automating your infrastructure with Terraform!

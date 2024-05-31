# AWS VPC with EC2 and RDS Using Terraform

Welcome to our Terraform-based project that creates a robust AWS VPC setup, complete with public and private subnets, an EC2 instance, and an RDS database. This configuration leverages Terraform’s power to ensure scalability and reusability through the use of loops and variables.

## Prerequisites

Before you dive in, make sure you have the following:

- [Terraform](https://www.terraform.io/downloads.html) installed on your system.
- An AWS account with the AWS CLI configured.
- AWS access and secret keys with permissions to create necessary resources.

## Project Structure

Here’s a quick overview of our project’s structure:

```
.
├── main.tf
├── variables.tf
├── README.md  
```

## Getting Started

To get up and running, follow these simple steps:

1. **Initialize the project:**
   ```bash
   terraform init
   ```
2. **Preview the plan:**
   ```bash
   terraform plan
   ```
3. **Apply the configuration:**
   ```bash
   terraform apply
   ```

## What You’ll Get

Once applied, the Terraform configuration will set up the following:

1. **A new VPC with Subnets:**
   - One public subnet
   - Two private subnets
   - An Internet Gateway
   - A Route Table

   ![VPC](https://github.com/tabana1/iVolve-OJT/blob/602bfdd49cdedb3a1a2b15bc31e6bad7a4602e75/DAY%205/lab%2024/VPC.jpg)  

2. **An EC2 Instance:**
   - Deployed in the public subnet for easy access

   ![EC2](https://github.com/tabana1/iVolve-OJT/blob/602bfdd49cdedb3a1a2b15bc31e6bad7a4602e75/DAY%205/lab%2024/EC2.jpg)

3. **An RDS Database:**
   - Securely placed within the private subnets

   ![RDS](https://github.com/tabana1/iVolve-OJT/blob/602bfdd49cdedb3a1a2b15bc31e6bad7a4602e75/DAY%205/lab%2024/Subnets.jpg)

## Conclusion

With this Terraform project, you can quickly spin up a secure, scalable AWS environment that includes both compute and database resources. Whether you're building for development, testing, or production, this setup serves as a solid foundation.

Dive into the code, tweak it to your needs, and enjoy the seamless infrastructure management that Terraform provides!

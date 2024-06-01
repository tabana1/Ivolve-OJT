# Lab 20: Launching an EC2 Instance

## Objective

- Create private subnet and launch an EC2 instance
- Configure security groups
- Connect to the instance using bastion host

## Steps

1. **Create Private Subnet**
   - Navigate to the VPC dashboard.
   - Create a new subnet within your VPC.

2. **Launch EC2 Instance**
   - Go to the EC2 dashboard and click "Launch Instance".
   - Configure instance details and select the newly created subnet.

3. **Configure Security Groups**
   - Create and configure security groups to allow necessary traffic.

4. **Connect to EC2 Instance using Bastion Host**
   - Set up a bastion host within a public subnet.
   - Connect to the EC2 instance via the bastion host.

## Cleanup

- Terminate the EC2 instance.
- Delete the created subnet and security groups.

## Resources

- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/index.html)
- [AWS VPC Documentation](https://docs.aws.amazon.com/vpc/index.html)

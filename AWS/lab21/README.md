# Lab 21: Create AWS Load Balancer

## Objective

- Create VPC with 2 subnets
- Launch 2 EC2 instances with NGINX and Apache installed
- Create and configure a Load Balancer to access the web server

## Steps

1. **Create VPC and Subnets**
   - Navigate to the VPC dashboard.
   - Create a new VPC and two subnets within it.

2. **Launch EC2 Instances**
   - Launch two EC2 instances in the created subnets.
   - Install NGINX on one instance and Apache on the other.

3. **Create and Configure Load Balancer**
   - Go to the EC2 dashboard and create a new Load Balancer.
   - Register the EC2 instances with the Load Balancer.

## Cleanup

- Terminate the EC2 instances.
- Delete the Load Balancer and VPC.

## Resources

- [AWS Load Balancer Documentation](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/introduction.html)
- [NGINX Installation](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/)
- [Apache HTTP Server Documentation](https://httpd.apache.org/docs/)

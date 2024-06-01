# Lab 19: AWS Security

## Objective

- Create AWS account
- Set billing alarm
- Create 2 IAM groups (admin-developer)
  - Admin group has admin permissions
  - Developer group only has access to S3
- Create admin-1 user with console access only, secured with MFA
- Create admin-2 user with CLI access only
- List all users and groups using AWS CLI
- Create dev-user with programmatic and console access
- Take screenshots of EC2 and S3 access

## Steps

1. **Create AWS Account and Set Billing Alarm**
   - Follow AWS documentation to create a new account.
   - Navigate to the billing dashboard to set a billing alarm.

2. **Create IAM Groups and Users**
   - Create IAM groups for admin and developer roles.
   - Assign necessary permissions to each group.
   - Create admin-1 user, enable MFA for console access.
   - Create admin-2 user, set up CLI access.
   - Create dev-user with both programmatic and console access.

3. **List Users and Groups using AWS CLI**
   - Use AWS CLI commands to list all users and groups:
     ```sh
     aws iam list-users
     aws iam list-groups
     ```

4. **Take Screenshots**
   - Access EC2 and S3 dashboards and take screenshots.

## Cleanup

- Delete created IAM users and groups.
- Remove the billing alarm if not needed.

## Resources

- [AWS IAM Documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)
- [AWS Billing and Cost Management](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-what-is.html)

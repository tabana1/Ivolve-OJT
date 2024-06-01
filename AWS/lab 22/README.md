# Lab 22: SDK and CLI Interactions

## Objective

- Use the AWS CLI to create an S3 bucket
- Configure permissions
- Upload/download files to/from the bucket
- Enable versioning and logging for the bucket

## Steps

1. **Create S3 Bucket**
   - Use AWS CLI to create a new S3 bucket:
     ```sh
     aws s3 mb s3://your-bucket-name
     ```

2. **Configure Bucket Permissions**
   - Set bucket policies and permissions using the AWS CLI.

3. **Upload and Download Files**
   - Upload a file to the bucket:
     ```sh
     aws s3 cp localfile.txt s3://your-bucket-name/
     ```
   - Download a file from the bucket:
     ```sh
     aws s3 cp s3://your-bucket-name/localfile.txt .
     ```

4. **Enable Versioning and Logging**
   - Enable versioning:
     ```sh
     aws s3api put-bucket-versioning --bucket your-bucket-name --versioning-configuration Status=Enabled
     ```
   - Enable logging:
     ```sh
     aws s3api put-bucket-logging --bucket your-bucket-name --bucket-logging-status file://logging.json
     ```

## Cleanup

- Remove objects and delete the S3 bucket.

## Resources

- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- [S3 Bucket Policy](https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-bucket-policies.html)

# AWS Serverless Web Application

This project demonstrates a simple serverless web application using AWS Lambda, DynamoDB, and API Gateway. The application allows users to submit content via a web page, which is then stored in DynamoDB. The web page also displays the list of submitted content.

## Prerequisites

- AWS Account
- AWS CLI configured with appropriate permissions
- Basic knowledge of AWS services (Lambda, DynamoDB, S3, API Gateway)
- Python 3.8

## Architecture Overview

1. **DynamoDB**: Stores the submitted content.
2. **Lambda Function**: Handles the business logic.
3. **API Gateway**: Exposes the Lambda function as a REST API.
4. **S3**: Hosts the static web page.

## Steps to Set Up

### Step 1: Create a DynamoDB Table

1. Navigate to the DynamoDB service in the AWS Management Console.
2. Create a new table named `SimpleWebAppTable`.
3. Set `id` as the primary key (String).

### Step 2: Create a Lambda Function

1. Navigate to the Lambda service in the AWS Management Console.
2. Create a new function named `SimpleWebAppFunction`.
3. Choose Python 3.8 as the runtime.
4. Attach a policy to the Lambda function’s execution role to allow access to DynamoDB:

    ```json
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                    "dynamodb:PutItem",
                    "dynamodb:GetItem",
                    "dynamodb:Scan"
                ],
                "Resource": "arn:aws:dynamodb:REGION:ACCOUNT_ID:table/SimpleWebAppTable"
            }
        ]
    }
    ```

5. Add the following code to the Lambda function:

    ```python
    import json
    import boto3
    from uuid import uuid4

    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('SimpleWebAppTable')

    def lambda_handler(event, context):
        if event['httpMethod'] == 'POST':
            data = json.loads(event['body'])
            item = {
                'id': str(uuid4()),
                'content': data['content']
            }
            table.put_item(Item=item)
            return {
                'statusCode': 200,
                'body': json.dumps(item)
            }
        elif event['httpMethod'] == 'GET':
            response = table.scan()
            return {
                'statusCode': 200,
                'body': json.dumps(response['Items'])
            }
        else:
            return {
                'statusCode': 400,
                'body': json.dumps({'message': 'Unsupported method'})
            }
    ```

### Step 3: Create an API Gateway

1. Navigate to the API Gateway service in the AWS Management Console.
2. Create a new REST API named `SimpleWebAppAPI`.
3. Create a new resource named `items`.
4. Create POST and GET methods for the `items` resource, linking them to the `SimpleWebAppFunction` Lambda function.
5. Deploy the API to a stage named `prod`.

### Step 4: Deploy a Simple Web Page to S3

1. Create an S3 bucket named `my-simple-webapp-bucket`.
2. Enable static website hosting for the bucket and set `index.html` as the index document.
3. Add a bucket policy to allow public read access:

    ```json
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": "*",
                "Action": "s3:GetObject",
                "Resource": "arn:aws:s3:::my-simple-webapp-bucket/*"
            }
        ]
    }
    ```

4. Upload the following HTML file to the bucket:

    ```html
    <!DOCTYPE html>
    <html>
    <head>
        <title>Simple Web App</title>
    </head>
    <body>
        <h1>Simple Web App</h1>
        <form id="postForm">
            <textarea id="content" placeholder="Enter some content"></textarea><br>
            <button type="submit">Submit</button>
        </form>
        <h2>Content List</h2>
        <ul id="contentList"></ul>
        <script>
            const apiUrl = 'YOUR_INVOKE_URL/items'; // Replace with your API Gateway Invoke URL

            document.getElementById('postForm').onsubmit = async function (e) {
                e.preventDefault();
                const content = document.getElementById('content').value;
                const response = await fetch(apiUrl, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ content: content })
                });
                const data = await response.json();
                loadContent();
            };

            async function loadContent() {
                const response = await fetch(apiUrl);
                const data = await response.json();
                const contentList = document.getElementById('contentList');
                contentList.innerHTML = '';
                data.forEach(item => {
                    const li = document.createElement('li');
                    li.textContent = item.content;
                    contentList.appendChild(li);
                });
            }

            loadContent();
        </script>
    </body>
    </html>
    ```

5. Access the web page using the S3 bucket's website endpoint.

## Summary

This project sets up a serverless web application using AWS services. It includes a web page that interacts with an API to store and retrieve data from a DynamoDB table via Lambda functions, triggered by API Gateway. The web page itself is hosted on an S3 bucket configured for static website hosting.

## License

This project is licensed under the MIT License.

# Day 25: Deploy a Static Website on AWS S3 with Terraform

This project demonstrates how to deploy a static website on AWS using S3 for storage and CloudFront for content delivery. Terraform is used to manage and automate the infrastructure, with state management via S3 and state locking using DynamoDB.

## Features

- **S3**: Hosts the static files for the website.
- **CloudFront**: Distributes the content globally with low latency.
- **Terraform**: Infrastructure as code to automate the entire setup.
- **Remote State Management**: Stores Terraform state in S3 and locks it with DynamoDB.

## Prerequisites

Before using this project, ensure you have:

- **AWS account** with permissions to create S3 buckets, CloudFront distributions, and DynamoDB tables.
- **Terraform** installed (version >= 1.0.0).
- **AWS CLI** configured with credentials on your machine.

## Usage

### 1. Clone the Repository

```bash
git clone https://github.com/malachieborohoul/Day25-Deploy-static-website
cd Day25-Deploy-static-website
```
### 2. Initialize Terraform
```bash
cd envs/dev
terraform init
```

### 3.  Review and Apply Changes
```bash
terraform plan
terraform apply
```
Terraform will:

* Create an S3 bucket to store your static website files.
* Set up a CloudFront distribution to serve the content globally.
* Configure S3 as the remote backend for state storage, with DynamoDB for state locking.

### 4. Testing the Website in a Browser

Once the Terraform deployment is complete, you should see three important output values:

- `cloudfront_distribution_domain`: The CloudFront distribution URL.
- `s3_bucket_name`: The name of your S3 bucket.
- `s3_bucket_url`: The direct URL to access your S3 bucket.

You can test your website using these URLs.

* Access via CloudFront

Open a web browser and navigate to the CloudFront distribution URL:
For example, it might look like:

http://d2ajbha7qpdos6.cloudfront.net



This URL will load your website, serving the `index.html` file from the S3 bucket through CloudFront's global distribution network for optimized performance.

* Access via S3 Bucket URL

You can also access your website directly using the S3 bucket URL:

An example URL might look like:

http://random-bsm-ezld0h.s3-website.eu-central-1.amazonaws.com


However, this method does not take advantage of CloudFront’s CDN benefits (e.g., caching and lower latency). It will serve the content directly from the S3 bucket.

Retrieving the CloudFront URL via AWS Console

If the `cloudfront_distribution_domain` output is not available for some reason, you can retrieve the CloudFront distribution domain manually:

1. Log in to the AWS Console.
2. Navigate to **CloudFront**.
3. Find your distribution and copy the **Domain Name** listed, which you can use to access your website.

Once you have this URL, you can use it to test your site via CloudFront.


<img src="/static/assets/capture.png" >


### 4.  Cleanup
Don't forget to cleanup. To remove the infrastructure, run:
```bash
terraform destroy
```

### Contribution
Feel free to contribute by opening issues or submitting pull requests to improve the project.

### License
This project is licensed under the MIT License.
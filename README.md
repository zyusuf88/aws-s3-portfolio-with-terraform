# AWS S3 Bucket Creation using Terraform

- [AWS S3 Bucket Creation using Terraform](#aws-s3-bucket-creation-using-terraform)
  - [Introduction](#introduction)
  - [Project Overview](#project-overview)
    - [Files Used](#files-used)
  - [Diagram](#diagram)
  - [Prerequisites](#prerequisites)
  - [Installation Instructions](#installation-instructions)
  - [Usage](#usage)
  - [Cleanup](#cleanup)
  - [Best Practices](#best-practices)
  - [Resources](#resources)


## Introduction

This repository contains Terraform code to provision an S3 bucket on AWS for hosting a portfolio page. The Terraform script included here automates the process of creating an S3 bucket, setting up ownership controls, making the bucket public, configuring access control lists (ACLs), uploading objects to the bucket, and configuring website hosting.

Amazon Simple Storage Service (S3) is a scalable object storage service offered by AWS, designed to store and retrieve any amount of data from anywhere on the web. It provides a highly durable and available storage infrastructure that is ideal for **hosting static websites, storing large media files, backups, and data archiving.**

Terraform is an open-source infrastructure as code (IaC) tool created by HashiCorp. It allows users to **define and provision infrastructure** using a declarative configuration language. With Terraform, infrastructure can be managed efficiently, version-controlled, and automated, providing consistency and repeatability in deployments.

## Project Overview

The main.tf file in this repository defines the infrastructure using Terraform configuration language. It creates an S3 bucket with the specified bucket name and sets up various configurations for bucket ownership, public access, ACLs, object uploads, and website hosting. Additionally, it uploads the portfolio page files (index.html, error.html, and image.png) to the S3 bucket, making them publicly accessible.

### Files Used
- **index.html**: The main entry point of your portfolio website.
- **error.html**: A custom error page that visitors see when they encounter a problem accessing your site, such as a 404 error (page not found).
- **image.png**: An example image file used in your portfolio.

## Diagram

![AWS S3 Bucket Creation Diagram](https://github.com/zyusuf88/aws-s3-terraform/assets/97973445/8443d9ae-0dee-489e-9415-9c3f7775ac44)


## Prerequisites

Before you begin, ensure you have the following prerequisites installed:

- **AWS Account**: You will need an AWS account. 
- **Obtain AWS Credentials:**: 
   - Log in to the AWS Management Console.
   - **Navigate to IAM > Users > Your Username > Security credentials.**
    - Under Access keys, click **Create access key and download the credentials.**
- **Configure AWS CLI:**
     - `aws configure`
     - Then enter your Access Key ID, Secret Access Key and region (e.g., us-west-2)

- **Terraform**: Terraform is required to provision and manage resources on AWS. You can install Terraform on Mac and Windows by following the instructions on the official website: [Terraform Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Installation Instructions

1. **Install Terraform**:

   - For Mac:
     ```
     brew tap hashicorp/tap
     brew install hashicorp/tap/terraform
     ```

   - For Windows:
     - Download the appropriate Terraform package for Windows from the official website.
     - Extract the downloaded zip file to a directory on your machine.
     - Add the directory containing the Terraform executable to your system's PATH environment variable.

2. **Check Terraform Installation**:

   After installation, verify that Terraform is correctly installed by running the following command in your terminal or command prompt:
   `terraform --version`
  
You should see the Terraform version displayed if it's installed correctly.

<img width="192" alt="image" src="https://github.com/zyusuf88/aws-s3-terraform/assets/97973445/21e99d2c-3f77-4cb2-8a84-e2b96ece5dda">  <br>


## Usage

1. **Clone this repository to your local machine:** `https://github.com/zyusuf88/aws-s3-terraform.git`

2.** Navigate to the directory containing the cloned repository:** `cd aws-s3-terraform `


3. **Initialise Terraform:** `terraform init`

This command initialises Terraform within the current directory. It downloads the necessary provider plugins specified in the configuration and sets up the working directory.

1. **Review the `main.tf` file:**  and make any necessary adjustments (e.g., update variable values).
2. **Plan the Terraform changes:**
   
   `terraform plan`
   
The `terraform plan` command generates an execution plan based on the configured infrastructure in `main.tf`. It shows **what actions Terraform will take** to create, modify, or delete resources. This step allows you to review the changes before applying them.

<img width="347" alt="image" src="https://github.com/zyusuf88/aws-s3-terraform/assets/97973445/605d3333-585e-451b-8f9a-fa0e8c35b54d">


<br>

6. **Apply the Terraform configuration to create the S3 bucket:**
`terraform apply --auto-approve` 


The `terraform apply` command applies the changes described in the Terraform configuration to reach the desired state. Adding the `--auto-approve` flag skips the interactive approval prompt, automatically applying the proposed changes. This step executes the plan generated by `terraform plan`.


 Once the provisioning is complete, you can access the S3 bucket and its configured features on the AWS Management Console or programmatically through the AWS CLI or SDKs.

7. **Access the Portfolio Page:**
 Once the provisioning is complete, you can access your portfolio page using the S3 bucket website endpoint. The endpoint URL follows the pattern:

 `http://<your-bucket-name>.s3-website-<AWS-region>.amazonaws.com`
 
![Screenshot 2024-06-03 232232](https://github.com/zyusuf88/aws-s3-terraform/assets/97973445/0b8a9f93-2cfa-4d48-86fa-859aa0817bc9)
 <br>

## Cleanup

To avoid incurring unnecessary costs, make sure to destroy the resources provisioned by Terraform when they are no longer needed: `terraform destroy --auto-approve`

The `terraform destroy` command is used to destroy the resources created by Terraform according to the configuration in `main.tf`. Adding the `--auto-approve` flag skips the interactive approval prompt, automatically destroying all resources without requiring manual confirmation. This ensures a smoother cleanup process, especially when running Terraform in automated or scripted environments.

<img width="371" alt="image" src="https://github.com/zyusuf88/aws-s3-terraform/assets/97973445/7bec0a46-bc1a-4ffa-8a3b-6fe2d8480015">
<br>

**Once the destruction process is complete, all provisioned resources will be removed from your AWS account, helping you avoid unnecessary charges.**



## Best Practices

Using Terraform for infrastructure provisioning offers several benefits, including:

- **Infrastructure as Code (IaC)**: Terraform allows you to define infrastructure configurations as code, making it easier to manage and version control infrastructure changes.

- **Consistency and Repeatability**: With Terraform, infrastructure deployments are consistent and repeatable across different environments, reducing the risk of configuration drift and errors.

- **Automation**: Terraform enables automation of infrastructure provisioning, making it possible to spin up and tear down environments quickly and efficiently.

- **Scalability**: Terraform scales with your infrastructure needs, whether you're managing a small project or a complex, multi-tier application.

By adhering to these best practices and leveraging Terraform's capabilities, you can efficiently manage and provision infrastructure on AWS while ensuring reliability, scalability, and security.

## Resources

- [Terraform Documentation](https://learn.hashicorp.com/collections/terraform/aws-get-started)
- [Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
- [AWS S3 Developer Guide](https://docs.aws.amazon.com/AmazonS3/latest/dev/Welcome.html)















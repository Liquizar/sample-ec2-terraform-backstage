# sample-ec2-terraform-backstage

This repository provides a Terraform configuration to deploy an EC2 instance on AWS dynamically by selecting the latest Amazon Machine Image (AMI) based on the user's choice of OS. The Terraform script ensures only trusted AMIs from official providers are selected.

## Features
- Fetches the latest AMI dynamically based on OS choice
- Uses official AMI owner IDs to prevent unauthorized AMIs
- Fully parameterized for easy customization
- Easily extensible for additional configurations

## Prerequisites
Ensure you have the following installed:
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- AWS CLI configured with appropriate credentials
- An AWS account with permissions to create EC2 instances

## Usage

### 1. Clone the Repository
```sh
git clone https://github.com/Liquizar/sample-ec2-terraform-backstage.git
cd sample-ec2-terraform-backstage
```

### 2. Initialize Terraform
```sh
terraform init
```

### 3. Set Up Variables
Modify `terraform.tfvars` or set environment variables for the following:
```hcl
os_choice = "ubuntu"  # Options: ubuntu, amazon, redhat, windows
instance_type = "t2.micro"
region = "us-east-1"
```

### 4. Apply the Configuration
```sh
terraform apply -auto-approve
```
This will provision an EC2 instance with the latest AMI for the selected OS.

### 5. Destroy the Infrastructure (Optional)
```sh
terraform destroy -auto-approve
```
This will remove all created resources.

## Terraform Code Structure
```
.
├── main.tf         # Defines the EC2 instance configuration
├── variables.tf    # Declares input variables
├── outputs.tf      # Defines output values
├── provider.tf     # Configures AWS provider
├── terraform.tfvars # User-defined variable values
└── README.md       # Documentation
```

## AMI Selection Logic
The latest AMI is fetched dynamically using the following Terraform data source:
```hcl
data "aws_ami" "latest_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = [var.ami_name_filter[var.os_choice]]
  }
  filter {
    name   = "owner-id"
    values = [var.ami_owner_filter[var.os_choice]]
  }
}
```
### AMI Owners:
| OS       | Owner ID        |
|----------|----------------|
| Ubuntu  | `099720109477`  |
| Amazon  | `137112412989`  |
| RedHat  | `309956199498`  |
| Windows | `801119661308`  |

## Future Enhancements
- Add support for user-defined security groups
- Implement auto-scaling
- Configure IAM roles for better security

## Contributing
Feel free to fork this repository, open issues, or submit pull requests for enhancements.

---

### Author
Maintained by [LIQUIZAR](https://github.com/Liquizar).


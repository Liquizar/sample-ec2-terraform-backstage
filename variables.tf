variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "os_choice" {
  description = "OS selection (amazon_linux, ubuntu, windows, redhat)"
  type        = string
  default     = "amazon_linux"
}

variable "ami_name_filter" {
  description = "Mapping of OS choices to AMI name filters"
  type        = map(string)
  default = {
    amazon_linux = "amzn2-ami-hvm-*-x86_64-gp2"
    ubuntu       = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
    windows      = "Windows_Server-2019-English-Full-Base-*"
    redhat       = "RHEL-9.0.0_HVM-*-x86_64-0-Hourly2-GP2"
  }
}

variable "ami_owner_filter" {
  type = map(string)
  default = {
    ubuntu  = "099720109477"
    amazon  = "137112412989"
    redhat  = "309956199498"
    windows = "801119661308"
  }
}

variable "allowed_ports" {
  description = "List of allowed ingress ports"
  type        = list(number)
  default     = [22, 80, 443]
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "demo-backstage-ec2-instance"
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default = {
    Project = "DemoBackstageTemplate"
    Owner   = "Liquizard"
  }
}

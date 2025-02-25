provider "aws" {
  region = var.aws_region
}

# Fetch latest AMI based on OS selection
data "aws_ami" "latest_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_name_filter[var.os_choice]]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon", "canonical", "microsoft", "redhat"]
  }

  filter {
    name   = "owner-id"
    values = [var.ami_owner_filter[var.os_choice]]
  }
}

resource "aws_security_group" "demo_backstage_sg" {
  name_prefix = "demo_backstage_sg"

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_instance" "demo_backstage_ec2" {
  ami             = data.aws_ami.latest_ami.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.demo_backstage_sg.name]

  tags = {
    Name = var.instance_name
  }
}

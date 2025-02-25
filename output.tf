output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.demo_backstage_ec2.id
}

output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.demo_backstage_ec2.public_ip
}

output "private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.demo_backstage_ec2.private_ip
}

output "ami_id" {
  description = "The AMI ID used for the EC2 instance"
  value       = data.aws_ami.latest_ami.id
}

output "instance_type" {
  description = "The instance type of the EC2 instance"
  value       = aws_instance.demo_backstage_ec2.instance_type
}

output "security_group_id" {
  description = "The ID of the Security Group"
  value       = aws_security_group.demo_backstage_sg.id
}

output "os_selected" {
  description = "The selected operating system for the instance"
  value       = var.os_choice
}

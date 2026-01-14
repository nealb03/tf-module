###########################################################
# Provider configuration
###########################################################

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

###########################################################
# Networking resources (DISABLED for demo)
###########################################################

# NOTE:
# The VPC, subnet, and security group below were already created in AWS.
# For this GitHub Actions demo, we comment them out so no new resources
# are created or modified. The code is left here to demonstrate how the
# module would normally provision networking.

# resource "aws_vpc" "this" {
#   cidr_block           = "10.0.0.0/16"
#   enable_dns_support   = true
#   enable_dns_hostnames = true
#
#   tags = merge(
#     {
#       Name = "tf-module-example-vpc"
#     },
#     var.common_tags,
#   )
# }
#
# resource "aws_subnet" "public" {
#   vpc_id                  = aws_vpc.this.id
#   cidr_block              = "10.0.1.0/24"
#   map_public_ip_on_launch = true
#
#   tags = merge(
#     {
#       Name = "tf-module-example-public-subnet"
#     },
#     var.common_tags,
#   )
# }
#
# resource "aws_security_group" "ec2" {
#   name        = "tf-module-example-ec2-sg"
#   description = "Security group for example EC2 instance"
#   vpc_id      = aws_vpc.this.id
#
#   # Example ingress rule (e.g., SSH)
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   tags = merge(
#     {
#       Name = "tf-module-example-ec2-sg"
#     },
#     var.common_tags,
#   )
# }

###########################################################
# EC2 instance (DISABLED for demo)
###########################################################

# NOTE:
# The EC2 instance (base-image-builder / i-0985f0f8ced553d73) has already
# been created in AWS. For this demo, we comment out the instance
# resource so terraform apply is effectively a no-op.

# resource "aws_instance" "this" {
#   ami           = var.ec2_ami_id
#   instance_type = var.ec2_instance_type
#
#   # If we were creating networking here:
#   # subnet_id              = aws_subnet.public.id
#   # vpc_security_group_ids = [aws_security_group.ec2.id]
#
#   # For existing networking via variables, we would use:
#   # subnet_id              = var.subnet_id
#   # vpc_security_group_ids = var.security_group_ids
#
#   tags = merge(
#     {
#       Name = var.ec2_instance_name
#     },
#     var.common_tags,
#   )
# }

###########################################################
# Outputs (optional, kept for documentation)
###########################################################

# output "vpc_id" {
#   description = "ID of the VPC created by this module"
#   value       = aws_vpc.this.id
# }
#
# output "public_subnet_id" {
#   description = "ID of the public subnet"
#   value       = aws_subnet.public.id
# }
#
# output "ec2_instance_id" {
#   description = "ID of the EC2 instance"
#   value       = aws_instance.this.id
# }
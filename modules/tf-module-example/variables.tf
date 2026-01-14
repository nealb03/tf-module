###########################################################
# Global / environment variables
###########################################################

variable "environment" {
  type        = string
  description = "Deployment environment (e.g., sandbox, dev, qa, prod)"
  default     = "dev"
}

variable "aws_region" {
  type        = string
  description = "AWS region in which to deploy resources"
  default     = "us-east-1"
}

###########################################################
# EC2-related variables
###########################################################

variable "ec2_ami_id" {
  type        = string
  description = "EC2 AMI ID for the instance"

  # Example Amazon Linux 2 AMI in us-east-1 (update if needed)
  default = "ami-0c02fb55956c7d316"
}

variable "ec2_instance_type" {
  type        = string
  description = "Instance type for the EC2 instance"
  default     = "t3.micro"
}

variable "ec2_instance_name" {
  type        = string
  description = "Name tag for the EC2 instance"
  default     = "example-ec2-instance"
}

variable "ec2_key_name" {
  type        = string
  description = "Name of the existing EC2 key pair to associate with the instance"
  default     = "tf-builder-key"
}

variable "ec2_additional_tags" {
  type        = map(string)
  description = "Additional tags to apply to the EC2 instance"
  default     = {}
}

###########################################################
# Networking variables (if needed later)
###########################################################

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where resources should be created (if using an existing VPC)"
  default     = ""
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet where the EC2 instance should be launched (if using an existing subnet)"
  default     = ""
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to associate with the EC2 instance (if using existing SGs)"
  default     = []
}

###########################################################
# Common tags
###########################################################

variable "common_tags" {
  type        = map(string)
  description = "Common tags applied to all resources created by this module"
  default = {
    Project     = "tf-module-example"
    ManagedBy   = "terraform"
    Environment = "dev"
  }
}
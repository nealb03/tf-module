variable "project_name" {
  type        = string
  description = "Prefix used for naming VPC-related resources."
  default     = "tf-module-example"
}

variable "ec2_ami_id" {
  type        = string
  description = "The AMI ID to use to launch the instance."
}

variable "ec2_instance_name" {
  type        = string
  description = "The name to give the EC2 instance."
}

variable "ec2_instance_type" {
  type        = string
  description = "The EC2 instance type to use."
  default     = "t2.micro"
}

variable "ssh_cidr" {
  type        = string
  description = "CIDR block allowed to SSH to the instance (e.g., your IP/32)."
  default     = "0.0.0.0/0" # for testing only; lock down later
}

# New: structured EC2 configuration object used in main.tf as var.ec2.*
variable "ec2" {
  description = "EC2 configuration for the sample instance (used by CI and defaults)."
  type = object({
    ami_id        = string
    instance_type = string
    key_name      = string
    name          = optional(string)
  })

  # Defaults so GitHub Actions (and local runs without tfvars) can validate/plan
  default = {
    ami_id        = "ami-091e2bfe31c49c467" # your existing AMI ID
    instance_type = "t2.micro"
    key_name      = "tf-builder-key"
    name          = "tf-module-example-ec2"
  }
}
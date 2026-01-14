variable "ec2_instance_type" {
  type        = string
  default     = "t3.micro"
  description = "This is the AWS EC2 instance type / size to use"
}

variable "ec2_instance_name" {
  type        = string
  description = "The name to give the instance."
  default     = "base-image-builder"
}

variable "ec2_ami_id" {
  type        = string
  description = "The AMI ID to use to launch the instance. NB: These differ between regions."
  default     = "ami-091e2bfe31c49c467" # same ID you used in main.tf locally
}

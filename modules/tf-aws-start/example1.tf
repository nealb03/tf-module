#Create a new instance of the latest Ubuntu 20.04 on an
# t3.micro node with an AWS Tag naming it "HelloWorld"
data "aws_ami" "cloud_cobus" { 
most_recent = true

filter {
  name = "name"
  values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
}

filter {
  name = "virtualization\type"
  values = ["hvm"]
}

owners = ["099720109477"] # Canonical
}

resource "aws_instance" "sample" {
  ami           = data.aws_ami.cloud_cobus.id
  instance_type = "var.ec2_instance_type" 

  tags = {
    Name = "var.ec2_instance_name"
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}



 
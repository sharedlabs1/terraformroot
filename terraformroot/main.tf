provider "aws" {
  region = var.aws_region
}

# Lookup the latest Amazon Linux 2 AMI ID
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Lookup the default VPC ID
data "aws_vpc" "default" {
  default = true
}

# Define Security Group module
module "security_group" {
  source = "./security_group_module"

  vpc_id  = data.aws_vpc.default.id
  sg_name = "my-security-group"
}

# Define EC2 Instance module
module "ec2_instance" {
  source = "./ec2_instance_module"

  instance_type = var.instance_type
  ami_id        = data.aws_ami.latest_amazon_linux.id
  key_name      = var.key_name
  subnet_id     = var.subnet_id
# Remove the vpc_id attribute
  security_group_id = module.security_group.security_group_id
}

# Define RDS Instance module
module "rds_instance" {
    source = "./rds_instance_module"

    db_instance_identifier = "my-rds-instance"
    db_instance_class      = var.db_instance_class
    db_engine              = var.db_engine
    allocated_storage      = var.allocated_storage
    db_name                = var.db_name
    username               = var.username
    password               = var.password
    subnet_ids             = [var.subnet_id]
    vpc_security_group_ids = [module.security_group.security_group_id]
}

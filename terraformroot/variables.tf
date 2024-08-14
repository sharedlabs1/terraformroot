variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in"
  type        = string
}

variable "key_name" {
  description = "The key pair name for SSH access"
  type        = string
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_engine" {
  description = "The database engine for the RDS instance"
  type        = string
  default     = "mysql"
}

variable "allocated_storage" {
  description = "The allocated storage for the RDS instance in GB"
  type        = number
  default     = 20
}

variable "db_name" {
  description = "The name of the RDS database"
  type        = string
  default     = "mydatabase"
}

variable "username" {
  description = "The username for the RDS database"
  type        = string
}

variable "password" {
  description = "The password for the RDS database"
  type        = string
}

variable "db_instance_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
}

variable "db_engine" {
  description = "The database engine for the RDS instance"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage for the RDS instance in GB"
  type        = number
}

variable "db_name" {
  description = "The name of the RDS database"
  type        = string
}

variable "username" {
  description = "The username for the RDS database"
  type        = string
}

variable "password" {
  description = "The password for the RDS database"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs to launch the RDS instance in"
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "The VPC security group IDs to associate with the RDS instance"
  type        = list(string)
}

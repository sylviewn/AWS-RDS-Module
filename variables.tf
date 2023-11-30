variable "region" {
  type        = string
  description = "The AWS region to create resources in"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "subnet_cidr" {
  description = "CIDR block for the first private subnet"
  type        = string
}

variable "subnet_cidr_2" {
  description = "CIDR block for the second private subnet"
  type        = string
}

variable "az_one" {
  description = "The first availability zone"
  type        = string
}

variable "az_two" {
  description = "The second availability zone"
  type        = string
}


variable "db_username" {
  description = "Username for the RDS MySQL instance"
}

variable "db_password" {
  description = "Password for the RDS MySQL instance"
}


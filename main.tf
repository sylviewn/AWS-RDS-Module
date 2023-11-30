# Create a new Custom VPC
resource "aws_vpc" "rds_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true


  tags = {
    Name = "rdsVPC"
  }
}


# Create private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.rds_vpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = false

  tags = {
    Name = "PrivateSubnet "
  }
}


# Create the second private subnet
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.rds_vpc.id
  cidr_block              = var.subnet_cidr_2
  availability_zone       = var.az_two
  map_public_ip_on_launch = false

  tags = {
    Name = "PrivateSubnet2"
  }
}


# Create a DB subnet group
resource "aws_db_subnet_group" "database" {
  name       = "my-db-subnet-group"
  subnet_ids = [aws_subnet.private_subnet.id, aws_subnet.private_subnet_2.id]

  tags = {
    Name = "MyDBSubnetGroup"
  }
}



# Create a security group for RDS
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Security group for RDS MySQL"
  vpc_id      = aws_vpc.rds_vpc.id
}

# Create an RDS instance
resource "aws_db_instance" "mysql_db" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.database.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  skip_final_snapshot = true
}

# Output DB endpoint
output "db_endpoint" {
  value = aws_db_instance.mysql_db.endpoint
}

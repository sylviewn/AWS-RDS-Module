 ~~~

module "module-repo" {
  source         = "sylviewn/terraform-AWS-RDS-Module.git"
  region         = "Enter your Providers region here"
  vpc_cidr       = "10.0.0.0/16"
  subnet_cidr    = "10.0.3.0/24"
  subnet_cidr_2  = "10.0.4.0/24"
  az_one         = "Enter your first az"
  az_two         = "Enter your second az"
  db_username    = "admin"
  db_password    = "yourpassword"

}

~~~

 ----- end of readme file -----

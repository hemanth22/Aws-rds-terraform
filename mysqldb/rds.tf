terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.18.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_db_instance" "bitroids" {
  allocated_storage      = 18
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0.20"
  identifier             = "dbmysql"
  instance_class         = "db.t2.micro"
  name                   = "kops"
  password               = "bitroidOps"
  publicly_accessible    = true
  skip_final_snapshot    = true
  storage_encrypted      = false
  username               = "mysql2db"
  vpc_security_group_ids = ["sg-09e56df8ed9a8d535"]
}

output "Hostname" {
   value = aws_db_instance.bitroids.endpoint
}

output "Port" {
   value = aws_db_instance.bitroids.port
}

output "DBName" {
   value = aws_db_instance.bitroids.name
}

output "DB_Instance" {
   value = aws_db_instance.bitroids.identifier
}
output "Username" {
   value = aws_db_instance.bitroids.username
}

output "Password" {
   value = aws_db_instance.bitroids.password
}

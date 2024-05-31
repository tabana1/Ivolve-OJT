variable "region" {
  default     = "us-east-1"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  type        = map(string)
  default = {
    public  = "10.0.1.0/24"
    private1 = "10.0.2.0/24"
    private2 = "10.0.3.0/24"
  }
}

variable "availability_zones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "rds_instance_type" {
  default     = "db.t3.micro"
}

variable "db_name" {
  default     = "rds-db"
}

variable "db_user" {
  default     = "Omar"
}

variable "db_password" {
  default     = "root-745"
}

variable "db_port" {
  default     = 3306
}

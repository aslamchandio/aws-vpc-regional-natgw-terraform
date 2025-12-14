variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "public_subnets_cidrs" {
  description = "Public Subnets CIDR ranges"
  type        = list(string)
}

variable "private_subnets_cidrs" {
  description = "Private Subnets CIDR ranges"
  type        = list(string)
}

variable "db_subnets_cidrs" {
  description = "DB Subnets CIDR Ranges"
  type        = list(string)
}

variable "source_ip_cidr" {
  description = "Public IPS CIDR Block"
  type        = list(string)
}

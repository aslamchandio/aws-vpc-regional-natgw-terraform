## VPC Ouput

output "vpc_id" {
  description = "The ID of VPC"
  value       = aws_vpc.vpc.id
}

output "vpc_arn" {
  description = "The ARN of VPC"
  value       = aws_vpc.vpc.arn
}

output "vpc_default_network_acl_id" {
  description = "The ID of VPC"
  value       = aws_vpc.vpc.default_network_acl_id
}

## Public Subnets Ouput

output "public_subnet1_id" {
  description = "The ID of VPC"
  value       = aws_subnet.pub_subnet1.id
}

output "public_subnet1_tags_all" {
  description = "The ID of VPC"
  value       = aws_subnet.pub_subnet1.tags_all
}

output "public_subnet1_cidr" {
  description = "The ID of VPC"
  value       = aws_subnet.pub_subnet1.cidr_block
}

output "public_subnet1_arn" {
  description = "The ID of VPC"
  value       = aws_subnet.pub_subnet1.arn
}

output "public_subnet2_id" {
  description = "The ID of VPC"
  value       = aws_subnet.pub_subnet2.id
}

output "public_subnet2_tags_all" {
  description = "The ID of VPC"
  value       = aws_subnet.pub_subnet2.tags_all
}

output "public_subnet2_cidr" {
  description = "The ID of VPC"
  value       = aws_subnet.pub_subnet2.cidr_block
}

output "public_subnet2_arn" {
  description = "The ID of VPC"
  value       = aws_subnet.pub_subnet2.arn
}

output "public_subnet3_id" {
  description = "The ID of VPC"
  value       = aws_subnet.pub_subnet3.id
}

output "public_subnet3_tags_all" {
  description = "The ID of VPC"
  value       = aws_subnet.pub_subnet3.tags_all
}

output "public_subnet3_cidr" {
  description = "The ID of VPC"
  value       = aws_subnet.pub_subnet3.cidr_block
}

output "public_subnet3_arn" {
  description = "The ID of VPC"
  value       = aws_subnet.pub_subnet3.arn
}

## Private Subnets Ouput

output "private_subnet1_id" {
  description = "The ID of VPC"
  value       = aws_subnet.pvt_subnet1.id
}

output "private_subnet1_tags_all" {
  description = "The ID of VPC"
  value       = aws_subnet.pvt_subnet1.tags_all
}

output "private_subnet1_cidr" {
  description = "The ID of VPC"
  value       = aws_subnet.pvt_subnet1.cidr_block
}

output "private_subnet1_arn" {
  description = "The ID of VPC"
  value       = aws_subnet.pvt_subnet1.arn
}

output "private_subnet2_id" {
  description = "The ID of VPC"
  value       = aws_subnet.pvt_subnet2.id
}

output "private_subnet2_tags_all" {
  description = "The ID of VPC"
  value       = aws_subnet.pvt_subnet2.tags_all
}

output "private_subnet2_cidr" {
  description = "The ID of VPC"
  value       = aws_subnet.pvt_subnet2.cidr_block
}

output "private_subnet2_arn" {
  description = "The ID of VPC"
  value       = aws_subnet.pvt_subnet2.arn
}

output "private_subnet3_id" {
  description = "The ID of VPC"
  value       = aws_subnet.pvt_subnet3.id
}

output "private_subnet3_tags_all" {
  description = "The ID of VPC"
  value       = aws_subnet.pvt_subnet3.tags_all
}

output "private_subnet3_cidr" {
  description = "The ID of VPC"
  value       = aws_subnet.pvt_subnet3.cidr_block
}

output "private_subnet3_arn" {
  description = "The ID of VPC"
  value       = aws_subnet.pvt_subnet3.arn
}

## DB Subnets Ouput

output "db_subnet1_id" {
  description = "The ID of VPC"
  value       = aws_subnet.db_subnet1.id
}

output "db_subnet1_tags_all" {
  description = "The ID of VPC"
  value       = aws_subnet.db_subnet1.tags_all
}

output "db_subnet1_cidr" {
  description = "The ID of VPC"
  value       = aws_subnet.db_subnet1.cidr_block
}

output "db_subnet1_arn" {
  description = "The ID of VPC"
  value       = aws_subnet.db_subnet1.arn
}

output "db_subnet2_id" {
  description = "The ID of VPC"
  value       = aws_subnet.db_subnet2.id
}

output "db_subnet2_tags_all" {
  description = "The ID of VPC"
  value       = aws_subnet.db_subnet2
}

output "db_subnet2_cidr" {
  description = "The ID of VPC"
  value       = aws_subnet.db_subnet2.cidr_block
}

output "db_subnet2_arn" {
  description = "The ID of VPC"
  value       = aws_subnet.db_subnet2.arn
}

output "db_subnet3_id" {
  description = "The ID of VPC"
  value       = aws_subnet.db_subnet3.id
}

output "db_subnet3_tags_all" {
  description = "The ID of VPC"
  value       = aws_subnet.db_subnet3.tags_all
}

output "db_subnet3_cidr" {
  description = "The ID of VPC"
  value       = aws_subnet.db_subnet3.cidr_block
}

output "db_subnet3_arn" {
  description = "The ID of VPC"
  value       = aws_subnet.db_subnet3.arn
}

## Public SG Ouput

output "public_sg_id" {
  description = "The ID of VPC"
  value       = aws_security_group.public_sg.id
}

output "public_sg_arn" {
  description = "The ID of VPC"
  value       = aws_security_group.public_sg.arn
}

output "public_sg_tags_all" {
  description = "The ID of VPC"
  value       = aws_security_group.public_sg.tags_all
}

## Private SG Ouput

output "private_sg_id" {
  description = "The ID of VPC"
  value       = aws_security_group.private_sg.id
}

output "private_sg_arn" {
  description = "The ID of VPC"
  value       = aws_security_group.private_sg.arn
}

output "private_sg_tags_all" {
  description = "The ID of VPC"
  value       = aws_security_group.private_sg.tags_all
}

## Private SG Ouput

output "db_sg_id" {
  description = "The ID of VPC"
  value       = aws_security_group.db_sg.id
}

output "db_sg_arn" {
  description = "The ID of VPC"
  value       = aws_security_group.db_sg.arn
}

output "db_sg_tags_all" {
  description = "The ID of VPC"
  value       = aws_security_group.db_sg.tags_all
}

output "natgw_ips" {
  description = "Nat GW PIP"
  value       = aws_eip.pip.*.public_ip
}









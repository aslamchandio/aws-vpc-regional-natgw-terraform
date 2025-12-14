resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${local.name}-vpc"
  }
}


# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

## Public Subnets

resource "aws_subnet" "pub_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnets_cidrs[0]
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name                                  = "${local.name}-public-subnet1"
    "kubernetes.io/role/elb"              = 1
    "kubernetes.io/cluster/${local.name}" = "shared"
  }
}

resource "aws_subnet" "pub_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnets_cidrs[1]
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name                                  = "${local.name}-public-subnet2"
    "kubernetes.io/role/elb"              = 1
    "kubernetes.io/cluster/${local.name}" = "shared"
  }
}

resource "aws_subnet" "pub_subnet3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnets_cidrs[2]
  availability_zone       = data.aws_availability_zones.available_zones.names[2]
  map_public_ip_on_launch = true

  tags = {
    Name                                  = "${local.name}-public-subnet3"
    "kubernetes.io/role/elb"              = 1
    "kubernetes.io/cluster/${local.name}" = "shared"
  }
}

# create internet gateway and attach it to vpc
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${local.name}-igw"
  }
}

# Resource-4: Create Public  Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "${local.name}-public-rt"

  }

}

# associate public subnet1 to public route table
resource "aws_route_table_association" "pub_subnet1_route_table_association" {
  subnet_id      = aws_subnet.pub_subnet1.id
  route_table_id = aws_route_table.public_rt.id
}

# associate public subnet2 to public route table
resource "aws_route_table_association" "pub_subnet2_route_table_association" {
  subnet_id      = aws_subnet.pub_subnet2.id
  route_table_id = aws_route_table.public_rt.id
}

# associate public subnet3 az3 to public route table
resource "aws_route_table_association" "pub_subnet3_route_table_association" {
  subnet_id      = aws_subnet.pub_subnet3.id
  route_table_id = aws_route_table.public_rt.id
}

## Private Subnets

# create public subnet pub_sub_1a
resource "aws_subnet" "pvt_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnets_cidrs[0]
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name                                  = "${local.name}-private-subnet1"
    "kubernetes.io/role/internal-elb"     = 1
    "kubernetes.io/cluster/${local.name}" = "shared"
  }
}

resource "aws_subnet" "pvt_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnets_cidrs[1]
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name                                  = "${local.name}-private-subnet2"
    "kubernetes.io/role/internal-elb"     = 1
    "kubernetes.io/cluster/${local.name}" = "shared"
  }
}

resource "aws_subnet" "pvt_subnet3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnets_cidrs[2]
  availability_zone       = data.aws_availability_zones.available_zones.names[2]
  map_public_ip_on_launch = false

  tags = {
    Name                                  = "${local.name}-private-subnet3"
    "kubernetes.io/role/internal-elb"     = 1
    "kubernetes.io/cluster/${local.name}" = "shared"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "${local.name}-private-rt"
  }
}

# associate private subnet1 to public route table
resource "aws_route_table_association" "pvt_subnet1_route_table_association" {
  subnet_id      = aws_subnet.pvt_subnet1.id
  route_table_id = aws_route_table.private_rt.id
}

# associate private subnet2 to public route table
resource "aws_route_table_association" "pvt_subnet2_route_table_association" {
  subnet_id      = aws_subnet.pvt_subnet2.id
  route_table_id = aws_route_table.private_rt.id
}

# associate private subnet3 az3 to public route table
resource "aws_route_table_association" "pvt_subnet3_route_table_association" {
  subnet_id      = aws_subnet.pvt_subnet3.id
  route_table_id = aws_route_table.private_rt.id
}

## DB Subnets

resource "aws_subnet" "db_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.db_subnets_cidrs[0]
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "${local.name}-db-subnet1"
  }
}

resource "aws_subnet" "db_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.db_subnets_cidrs[1]
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "${local.name}-db-subnet2"
  }
}

resource "aws_subnet" "db_subnet3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.db_subnets_cidrs[2]
  availability_zone       = data.aws_availability_zones.available_zones.names[2]
  map_public_ip_on_launch = false

  tags = {
    Name = "${local.name}-db-subnet3"
  }
}

resource "aws_route_table" "db_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${local.name}-db-rt"
  }
}

# associate db subnet1 to public route table
resource "aws_route_table_association" "db_subnet1_route_table_association" {
  subnet_id      = aws_subnet.db_subnet1.id
  route_table_id = aws_route_table.db_rt.id
}

# associate private subnet2 to public route table
resource "aws_route_table_association" "db_subnet2_route_table_association" {
  subnet_id      = aws_subnet.db_subnet2.id
  route_table_id = aws_route_table.db_rt.id
}

# associate private subnet3 az3 to public route table
resource "aws_route_table_association" "db_subnet3_route_table_association" {
  subnet_id      = aws_subnet.db_subnet3.id
  route_table_id = aws_route_table.db_rt.id
}


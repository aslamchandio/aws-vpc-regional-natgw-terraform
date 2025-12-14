# resource block for eip #
resource "aws_eip" "pip" {
  count  = 2
  domain = "vpc"

  tags = {
    Name = "${local.name}-pip-${count.index}"
  }
}

resource "aws_nat_gateway" "natgw" {
  vpc_id            = aws_vpc.vpc.id
  availability_mode = "regional"
  connectivity_type = "public"

  availability_zone_address {
    allocation_ids    = [aws_eip.pip[0].id]
    availability_zone = data.aws_availability_zones.available_zones.names[0]
  }

  availability_zone_address {
    allocation_ids    = [aws_eip.pip[1].id]
    availability_zone = data.aws_availability_zones.available_zones.names[1]
  }

  tags = {
    Name = "${local.name}-natgw-regional"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}

resource "aws_subnet" "amd-public-1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.publicsubnet_cidr_block_a
  map_public_ip_on_launch = "true"
  availability_zone       = var.publicsubnet_az_a

  tags = {
    Name = var.publicsubnet_tag_a
  }
}

resource "aws_subnet" "amd-private-1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.privatesubnet_cidr_block_a
  map_public_ip_on_launch = "false"
  availability_zone       = var.privatesubnet_az_a

  tags = {
    Name = var.privatesubnet_tag_a
  }
}

resource "aws_internet_gateway" "gujarat_igw" {
    vpc_id = var.vpc_id
    tags = {
    Name = var.igw_tag_a
    }
}

resource "aws_route_table" "gujarat_rt_public" {
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gujarat_igw.id 
        
    }
}

resource "aws_route_table_association" "RT_public_association" {
  subnet_id = aws_subnet.amd-public-1.id
  route_table_id = aws_route_table.gujarat_rt_public.id
}

resource "aws_eip" "nat_gateway" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id = aws_subnet.amd-private-1.id
  tags = {
    "Name" = var.ngw_tag_a
  }
}

resource "aws_route_table" "gujarat_rt_private" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
}

resource "aws_route_table_association" "RT_private_association" {
  subnet_id = aws_subnet.amd-private-1.id
  route_table_id = aws_route_table.gujarat_rt_private.id
}
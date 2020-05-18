provider "aws" {
  region  = var.region
  version = "~> 2.46"
}

resource "aws_vpc" "VPC_STAGE" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "VPC_STAGE"
  }
}

resource "aws_subnet" "STAGE_SUBNET30" {
  vpc_id            = aws_vpc.VPC_STAGE.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = "us-east-1c"

  tags = {
    Name = "STAGE_SUBNET30"
  }
}

resource "aws_internet_gateway" "IGW-US-STAGE" {
  vpc_id = aws_vpc.VPC_STAGE.id

  tags = {
    Name = "IGW-US-STAGE"
  }
}

resource "aws_route_table" "RT-US-STAGE" {
  vpc_id = aws_vpc.VPC_STAGE.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW-US-STAGE.id
  }
  tags = {
    Name = "RT-US-STAGE"
  }
}

resource "aws_route_table_association" "RA-US-STAGE" {
  subnet_id      = aws_subnet.STAGE_SUBNET30.id
  route_table_id = aws_route_table.RT-US-STAGE.id
}

resource "aws_security_group" "SG-US-STAGE" {
  name   = "SG-US-STAGE"
  vpc_id = aws_vpc.VPC_STAGE.id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-US-STAGE"
  }
}

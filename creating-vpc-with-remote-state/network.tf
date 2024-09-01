resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-terraform-in-practice"
  }

}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-terraform-in-practice"
  }
}

resource "aws_internet_gateway" "gateway" {

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "gateway-terraform-in-practice"
  }

}

resource "aws_route_table" "route-table" {

  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "route-table-terraform-in-practic"
  }

}

resource "aws_route_table_association" "route-table-association" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route-table.id

}

resource "aws_security_group" "security_group" {

  name        = "security-group-terraform-in-practic"
  description = "Permitir acesso na porta 22"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH"
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

}
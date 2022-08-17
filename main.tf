provider "aws"{

}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy  =  "default"
  enable_dns_hostnames  = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "pubsubnet-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pubsubnet-1
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "pubsubnet-1"
  }

}  
  
  resource "aws_subnet" "pubsubnet-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pubsubnet-2
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "pubsubnet-2"
  }
}
  resource "aws_subnet" "pubsubnet-3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pubsubnet-3
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "pubsubnet-3"
  }
}
  resource "aws_subnet" "prisubnet-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.prisubnet-1
  availability_zone       = "us-east-1a"



  tags = {
    Name = "prisubnet-1"
  }
}

  resource "aws_subnet" "prisubnet-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.prisubnet-2
  availability_zone       = "us-east-1b"

  tags = {
    Name = "prisubnet-2"
  }
}
  resource "aws_subnet" "prisubnet-3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.prisubnet-3
  availability_zone       = "us-east-1c"

  tags = {
    Name = "prisubnet-3"
  }
}
  resource "aws_subnet" "datasubnet-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.datasubnet-1
  availability_zone       = "us-east-1a"

  tags = {
    Name = "datasubnet-1"
  }
}  

  resource "aws_subnet" "datasubnet-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.datasubnet-2
  availability_zone       = "us-east-1b"

  tags = {
    Name = "datasubnet-2"
  }
}

  resource "aws_subnet" "datasubnet-3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.datasubnet-3
  availability_zone       = "us-east-1c"

  tags = {
    Name = "datasubnet-3"
  }
}






# igw 
resource "aws_internet_gateway" "test-igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw
  }
}

#nat-gw

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.pubsubnet-1.id

  tags = {
    Name = var.NAT-GW
  }

}

resource "aws_eip" "eip" {
  vpc      = true
}

# Route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-igw.id
  }


  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "private"
  
}
}

# associate 
resource "aws_route_table_association" "pub" {
  subnet_id      = aws_subnet.pubsubnet-1.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "pub-2" {
  subnet_id      = aws_subnet.pubsubnet-2.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "pub-3" {
  subnet_id      = aws_subnet.pubsubnet-3.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private-rt" {
  subnet_id      = aws_subnet.prisubnet-1.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-rt1" {
  subnet_id      = aws_subnet.prisubnet-2.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-rt2" {
  subnet_id      = aws_subnet.prisubnet-3.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-rt3" {
  subnet_id      = aws_subnet.datasubnet-1.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-rt4" {
  subnet_id      = aws_subnet.datasubnet-2.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-rt5" {
  subnet_id      = aws_subnet.datasubnet-3.id
  route_table_id = aws_route_table.private.id
}


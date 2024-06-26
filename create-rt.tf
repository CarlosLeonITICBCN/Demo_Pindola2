#create-rt.tf
 
resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.vpc.id
 
  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-rt-public"
  }
 
}
resource "aws_route_table" "rt-private" {
  vpc_id = aws_vpc.vpc.id
 
  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-rt-private"
  }
 
}
### from - https://cloudcasts.io/course/terraform/vpc-gateways

resource "aws_route_table_association" "rt_sbn_public_asso" {
  subnet_id      = aws_subnet.subnet-public.id
  route_table_id = aws_route_table.rt-public.id
}

resource "aws_route_table_association" "rt_sbn_private_asso" {
  subnet_id      = aws_subnet.subnet-private.id
  route_table_id = aws_route_table.rt-private.id
}

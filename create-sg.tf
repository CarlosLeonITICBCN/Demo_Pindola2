# create-sg.tf

resource "aws_security_group" "public" {

#  name = "cloudcasts-${var.infra_env}-public-sg"
  name = "public-sg"
  description = "Public internet access"
  vpc_id = aws_vpc.vpc.id

 

  tags = {
    Name        = "public-sg"
    ManagedBy   = "terraform"
  }

}

resource "aws_security_group" "private" {

#  name = "cloudcasts-${var.infra_env}-public-sg"
  name = "private-sg"
  description = "Public internet access"
  vpc_id = aws_vpc.vpc.id

 

  tags = {
    Name        = "private-sg"
    ManagedBy   = "terraform"
  }

}

 

resource "aws_security_group_rule" "private_out" {

  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 
  security_group_id = aws_security_group.private.id
}


resource "aws_security_group_rule" "public_out" {

  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 
  security_group_id = aws_security_group.public.id
}

 


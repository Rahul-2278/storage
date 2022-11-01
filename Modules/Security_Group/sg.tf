resource "aws_security_group" "gujarat_sg" {
  name = var.sg_name_a
  vpc_id = var.vpc_id

  #Incoming traffic
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.vpc_cidr_block_a]
  }

  #Outgoing traffic
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = [var.vpc_cidr_block_a]
  }
}
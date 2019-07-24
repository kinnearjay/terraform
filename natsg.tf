resource "aws_security_group" "nat" {
  name = "vpc_nat"
  description= "NAT security group for QA"

  ingress{
      from_port = 22
      to_port= 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
      from_port = -1
      to_port = -1
      protocol = "icmp"
      cidr_blocks=["0.0.0.0/0"]
  }

  egress{
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks= ["${var.vpc_cidr}"]
  }

  egress{
      from_port = -1
      to_port = -1
      protocol = "icmp"
      cidr_blocks = ["0.0.0.0/0"] 
    }
    vpc_id = "${aws_vpc.defaultvpc.id}"

    tags={
        Name = "NATSGQA"
    }

}

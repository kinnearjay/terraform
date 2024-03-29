resource "aws_security_group" "web" {
name = "vpc_web"
description = "Accept incoming connections."

ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
    }
ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
    }


ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
    }
ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
    }

ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"] 
    }
ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
    }

egress{
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks= ["0.0.0.0/0"]
  }
egress{
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks= ["0.0.0.0/0"]
  }
egress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
    }
egress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
    }
egress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

vpc_id = "${aws_vpc.defaultvpc.id}"

tags = {
    Name = "QAWebServerSG"
}
}
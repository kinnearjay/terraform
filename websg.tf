resource "aws_security_group" "web" {
name = "vpc_web"
description = "Accept incoming connections."

// web server will accept incomming traffic on  port 80  (http port) 
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
    // ssh port open to incomming traffic
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
    // jenkins port
ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
    }

// web server is allowed to send data via ssh port
egress{
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks= ["0.0.0.0/0"]
  }
// web server is allowed to send data via http port (wouldnt be a very good web server without it now would it)
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
// jenkins port can send out data
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
resource "aws_internet_gateway" "defaultgw" {
    vpc_id= "${aws_vpc.defaultvpc.id}"
    tags = {
        Name = "qa Gateway"
    }
  
}

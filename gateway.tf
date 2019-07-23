resource "aws_internet_gateway" "defaultgw" {
    vpc_id= "${aws_vpc.default.id}"
    tags = {
        Name = "qa Gateway"
    }
  
}

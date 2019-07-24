resource "aws_route_table" "public-subnet-in-us-west-2" {
    vpc_id= "${aws_vpc.defaultvpc.id}"

    route{
        cidr_block="0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.defaultgw.id}"
        
    }
    tags = {
            Name = "QA public subnet"
        }

}

/*
sets up the route table that has access to the internet via pointing at the default gateway (this gets assigned in the public.tf file)
*/
resource "aws_route_table" "public-subnet-in-us-west-2" {  // creates a route table called public-subnet-in-us-west-2 (should really refactor this name)
    vpc_id= "${aws_vpc.defaultvpc.id}"

    route{
        cidr_block="0.0.0.0/0"   // 0.0.0.0/0  sets the ip address to be anything in the CIDR block
        gateway_id = "${aws_internet_gateway.defaultgw.id}"   //sets the default gateway of the route
        
    }
    tags = {
            Name = "QA public subnet"
        }

}

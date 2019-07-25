output "ipaddress of server" {
  value = "${aws_instance.web-1.public_ip}"
}
output "dns of server" {
  value = "${aws_instance.web-1.public_dns}"
}

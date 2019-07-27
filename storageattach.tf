resource "aws_volume_attachment" "ebs_attach" {
    device_name = "/dev/sdp"
    volume_id = "${aws_ebs_volume.extravolume-1.id}"
    instance_id = "${aws_instance.web-1.id}"
}

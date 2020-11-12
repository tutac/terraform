resource "aws_instance" "Ubuntu" {
	ami = "ami-0739f8cdb239fe9ae"
	instance_type = "t2.micro"
    associate_public_ip_address = "true"
    key_name = "${aws_key_pair.bastion.key_name}"
    vpc_security_group_ids = ["${aws_security_group.task2.id}"]
    availability_zone = "us-east-1a"
    user_data = "${file("userdata_file.sh")}"
    tags = {
    Name = "dev" 
  }
}
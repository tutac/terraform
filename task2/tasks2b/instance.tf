resource "aws_instance" "Centos" {
	ami = "ami-e3fdd999"
	instance_type = "t2.micro"
  key_name = "${aws_key_pair.bastion.key_name}"
  availability_zone = "us-east-1a"
    tags = {
    Name = "Centos6" 
  }
}
resource "aws_eip" "EIP" {
  instance = "${aws_instance.Centos.id}"
  vpc      = true
}
resource "aws_iam_instance_profile" "adminrole" {
  name = "adminrole"
  role = "${aws_iam_role.admin_role.name}"
}

resource "aws_volume_attachment" "ebs_att" {
device_name = "/dev/sdi"
volume_id = "${aws_ebs_volume.ebs.id}"
instance_id = "${aws_instance.Centos.id}"
}


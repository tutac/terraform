resource "aws_instance" "centos" {
  ami                    = "${data.aws_ami.centos.id}"
  instance_type          = "t3.large"
  vpc_security_group_ids = ["${aws_security_group.jenkins.id}"]
  key_name               = "${aws_key_pair.class.key_name}"

  tags = {
    Name = "jenkins"
  }
}

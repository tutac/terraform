resource "aws_key_pair" "class" {
	key_name = "bastion"
	public_key = "${file("~/.ssh/id_rsa.pub")}"
}
resource "aws_instance" "r1soft" {
  ami           = "${data.aws_ami.centos.id}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.class.key_name}"
  vpc_security_group_ids = ["${aws_security_group.r1soft.id}"]


provisioner "file" {
  connection {
    type     = "ssh"
    user     = "centos"
    private_key = "${file("~/.ssh/id_rsa")}"
    host     = "${aws_instance.r1soft.public_ip}"
    }

    source = "r1soft.repo"
    destination = "/tmp/r1soft.repo"

  }

provisioner "remote-exec" {
    connection {
    type     = "ssh"
    user     = "centos"
    private_key = "${file("~/.ssh/id_rsa")}"
    host     = "${aws_instance.r1soft.public_ip}"
  }
    inline = [
      "sudo mv /tmp/r1soft.repo /etc/yum.repos.d/r1soft.repo",
      "sudo yum install serverbackup-enterprise -y",
      "sudo serverbackup-setup --user hasan --pass fenerbahce",
      "sudo /etc/init.d/cdp-server restart",
      "sudo serverbackup-setup --http-port 80 --https-port 443",
      "sudo /etc/init.d/cdp-server restart",
    ]
  }
}
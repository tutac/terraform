resource "null_resource" "remote" {
   triggers = {
    always_run = "${timestamp()}"
    }   
    provisioner "remote-exec" {
        connection {
        type     = "ssh"
        user     = "centos"
        private_key = "${file("~/.  ssh/id_rsa")}"
        host     = "${aws_instance.centos.public_ip}"
    }
        inline = [
         "sudo curl https://assets.nagios.com/downloads/nagiosxi/install.sh | sudo sh",
        ]
    }
}
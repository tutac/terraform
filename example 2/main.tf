provider "aws" {
  region = "us-east-1"
}
resource "aws_key_pair" "us-east-1-bastion-key" {
  key_name   = "bastion"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDiInFxNe+oCy9TuFs37NAgpXcsO7by/y47kPHQqdEJkp10MMETVTM9RYV6ctNzbXuo/Lr4WebJg/cvxl88ZAcRfx6FhM5IvEhFysZUMPsoRytXHUVvy1Kpq6wg52zSFPhjItZQkJWoOIUDqAGUjxQgsGU+keM6lUqCOvuyIIjUMpHnAXoHRfOwjTo3Ep7HuHkgOGNwl73qHK00zjQSeNDgpQTbteCGwMwvXfb0sag45bgJYDrWThVItgSZf7ZzNNzHY1oVfmTiQO0waAv5RjyOHH3c1viwg5NWumXzqdqshHQdws+RAEJ3ea99sJBxgciwJ87VNz8jI3OhWBuXmwun ec2-user@Bastion"
}
resource "aws_instance" "exmaple" {
  key_name      = "bastion"
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"
}
resource "aws_key_pair" "key_pair" {
  key_name   = "id_ed25519"
  public_key = file("C:/Users/saraf/.ssh/id_ed25519.pub")
}

resource "aws_instance" "master" {
  ami            = "ami-084568db4383264d4"
  instance_type  = "t3.medium"
  key_name       = aws_key_pair.key_pair.key_name

  tags = {
    Name = "master"
  }
}

resource "aws_instance" "node" {
  ami             = "ami-084568db4383264d4"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.key_pair.key_name

  tags = {
    Name = "node"
  }
}

output "master_ip" {
  value = aws_instance.master.public_ip
}

output "node_ip" {
  value = aws_instance.node.public_ip
}

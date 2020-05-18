resource "aws_key_pair" "default" {
  key_name   = "stage"
  public_key = file(var.key_path)
}

resource "aws_instance" "StageInstance" {
  ami                         = data.aws_ami.aws_linux_2_latest.id
  instance_type               = "t2.medium"
  key_name                    = aws_key_pair.default.id
  subnet_id                   = aws_subnet.STAGE_SUBNET30.id
  vpc_security_group_ids      = [aws_security_group.SG-US-STAGE.id]
  associate_public_ip_address = true
  source_dest_check           = false

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_key_pair)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install telnet -y",
    ]
  }
}

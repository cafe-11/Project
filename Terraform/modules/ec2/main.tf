resource "aws_instance" "web" {
  count                       = 1
  ami                         = data.aws_ami.amazon-2.id
  instance_type               = "t2.micro"
  key_name                    = "docker"
  vpc_security_group_ids      = [var.sg_id]
  subnet_id                   = var.subnets[count.index]
  root_block_device {
    volume_size = var.vol_size
  }
  
  tags = {
    Name = var.ec2_names
  }
}

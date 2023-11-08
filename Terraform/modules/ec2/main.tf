resource "aws_instance" "web" {
  ami                         = data.aws_ami.amazon-2.id
  instance_type               = "t2.micro"
  key_name                    = "docker"
  vpc_security_group_ids      = [var.sg_id]
  subnet_id                   = var.subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names

  root_block_device {
    volume_size = var.vol_size
  }
  
  tags = {
    Name = var.ec2_names
  }
}

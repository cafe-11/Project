resource "aws_instance" "web" {
  count                       = 2
  ami                         = data.aws_ami.amazon-2.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.sg_id]
  subnet_id                   = var.subnets[count.index]
  user_data                   = file("./Terraform/modules/ec2/jenkins-install.sh", {})
  availability_zone = data.aws_availability_zones.available.names[count.index]
  
  tags = {
    Name = var.ec2_names
  }
}

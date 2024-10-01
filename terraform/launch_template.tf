resource "aws_launch_template" "apache_template" {
  name_prefix = "apache-launch-template"

  image_id      = var.ami_id
  instance_type = "t2.micro"
  
  user_data = filebase64("${path.module}/../scripts/install_apache.sh")

  key_name = var.key_pair

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.ec2_sg.id]
  }
}

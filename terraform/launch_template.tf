# launch_template.tf

data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]  # Only consider AMIs owned by Amazon
  most_recent = true         # Get the most recent AMI

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]  # Filter for Amazon Linux 2 AMIs
  }
}

resource "aws_launch_template" "my_launch_template" {
  name = "my-launch-template"

  image_id      = data.aws_ami.latest_amazon_linux.id  # Use the automatically selected AMI ID
  instance_type = "t2.micro"

  # Base64 encode the user data
  user_data = base64encode(<<EOF
#!/bin/bash
# User Data script to install Apache web server on EC2 instances

yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd

echo "<h1>Welcome to Apache on EC2 Instance ID: \$(curl -s http://169.254.169.254/latest/meta-data/instance-id)</h1>" > /var/www/html/index.html
EOF
  )

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = aws_subnet.my_subnet_a.id
    security_groups             = [aws_security_group.ec2_sg.id]
  }
}

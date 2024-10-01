module "apache_autoscaling" {
  source = "../modules/ec2-autoscaling-module"
  # Module to define auto-scaling group and policies
}

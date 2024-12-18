# Creating Launch Template
resource "aws_launch_template" "web" {
  name_prefix   = "web-launch-template"
  image_id      = data.aws_ssm_parameter.instance_ami.value
  instance_type = var.instance_type

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "web-instance"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}


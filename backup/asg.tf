## Creating Launch Configuration
resource "aws_launch_configuration" "web" {
#  image_id        = data.aws_ami_ids.ubuntu-focal.id
  image_id        = lookup(var.aws_amis, var.aws_region)
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.wrodpress-sg.id}"]
  key_name        = var.key_name
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  lifecycle {
    create_before_destroy = true
  }
} ## Creating AutoScaling Group
resource "aws_autoscaling_group" "web" {
  launch_configuration = aws_launch_configuration.web.id
  availability_zones   = var.availability_zones
  min_size             = 1
  max_size             = 2
  desired_capacity     = 1
  target_group_arns = ["aws_lb_target_group.tg.arn"]
#  target_group_arns = ["${var.target_group_arn}"]
  health_check_type    = "ELB"
  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}
## Creating Launch Configuration
resource "aws_launch_configuration" "web" {
  #  image_id        = data.aws_ami_ids.ubuntu-focal.id
  image_id = lookup(var.aws_amis, var.aws_region)
  name     = "web_config"
  #  vpc_id      = aws_vpc.vpc.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.wrodpress-sg.id}"]
  key_name        = var.key_name
  user_data       = <<EOF
#!/bin/bash -xe
sudo apt update
sudo hostnamectl set-hostname ubuntusrv.citizix.com
sudo apt install -y nginx vim
sudo cat > /var/www/html/hello.html <<EOD
Hello world!
EOD
EOF
  lifecycle {
    create_before_destroy = true
  }
} ## Creating AutoScaling Group





resource "aws_autoscaling_group" "web" {
  depends_on = [
    aws_launch_configuration.web,
  ]
  name                 = "terraform-asg-example"
  launch_configuration = aws_launch_configuration.web.id
  force_delete         = true
  vpc_zone_identifier  = aws_subnet.public_subnet.*.id
  #  availability_zones   = var.availability_zones
  min_size         = 1
  max_size         = 2
  desired_capacity = 1
  #  target_group_arns = ["aws_lb_target_group.tg.arn"]
  #  target_group_arns = ["${var.target_group_arn}"]
  health_check_type = "ELB"
  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }
  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}


resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.web.id
  #elb                    = aws_lb.lb.id
  #lb_target_group_arn    = aws_lb_target_group.tg.arn
  lb_target_group_arn = aws_lb_target_group.tg.arn
}
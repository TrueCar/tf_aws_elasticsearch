resource "aws_autoscaling_group" "elasticsearch" {
  name                      = "${var.name}"
  vpc_zone_identifier       = ["${split(",", var.subnet_ids)}"]
  min_size                  = "${var.asg_min_size}"
  max_size                  = "${var.asg_max_size}"
  health_check_type         = "ELB"
  launch_configuration      = "${aws_launch_configuration.elasticsearch.name}"
  load_balancers            = ["${aws_elb.elasticsearch.name}"]
  health_check_grace_period = "${var.health_check_grace_period}"

  tag {
    key                 = "Name"
    value               = "${replace(var.name,"-",":")}"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

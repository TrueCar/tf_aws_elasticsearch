resource "aws_elb" "elasticsearch" {
  name                      = "${var.name}"
  security_groups           = ["${aws_security_group.elasticsearch_cluster.id}"]
  subnets                   = ["${split(",", var.subnet_ids)}"]
  cross_zone_load_balancing = true
  internal                  = true
  
  listener {
    instance_port     = 9200
    instance_protocol = "HTTP"
    lb_port           = 9200
    lb_protocol       = "HTTP"
  } 
    
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 10
    target              = "HTTP:9200/"
    interval            = 30
  } 
    
  tags {
    Name = "${replace(var.name,"-",":")}"
  }
} 

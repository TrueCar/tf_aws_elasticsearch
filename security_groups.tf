resource "aws_security_group" "default" {
    
  name        = "${var.name}-default"
  description = "General access"
  vpc_id      = "${var.vpc_id}"
    
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {    
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${replace(var.name,"-",":")}:default"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "elasticsearch_cluster" {
  name        = "${var.name}-cluster"
  description = "Members of the Elasticsearch cluster"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name = "${replace(var.name,"-",":")}:cluster"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "elasticsearch_client" {
  name        = "${var.name}-client"
  description = "Clients of Elasticsearch"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name = "${replace(var.name,"-",":")}:client"
  }
}

resource "aws_security_group_rule" "elasticsearch_client_ingress" {
  type      = "ingress"
  from_port = 9200
  to_port   = 9200
  protocol  = "tcp"

  security_group_id        = "${aws_security_group.elasticsearch_cluster.id}"
  source_security_group_id = "${aws_security_group.elasticsearch_client.id}"
}

resource "aws_security_group_rule" "elasticsearch_client_ingress_bycidr" {
  type      = "ingress"
  from_port = 9200
  to_port   = 9200
  protocol  = "tcp"
  cidr_blocks = ["${split(",", var.esclient_cidr_blocks)}"]

  security_group_id        = "${aws_security_group.elasticsearch_cluster.id}"
}

resource "aws_security_group_rule" "elasticsearch_client_egress" {
  type      = "egress"
  from_port = 9200
  to_port   = 9200
  protocol  = "tcp"

  security_group_id        = "${aws_security_group.elasticsearch_client.id}"
  source_security_group_id = "${aws_security_group.elasticsearch_cluster.id}"
}

resource "aws_security_group_rule" "elasticsearch_cluster_egress" {
  type      = "egress"
  from_port = 9200
  to_port   = 9400
  protocol  = "tcp"
  self      = true

  security_group_id = "${aws_security_group.elasticsearch_cluster.id}"
}

resource "aws_security_group_rule" "elasticsearch_cluster_ingress" {
  type      = "ingress"
  from_port = 9200
  to_port   = 9400
  protocol  = "tcp"
  self      = true

  security_group_id = "${aws_security_group.elasticsearch_cluster.id}"
}

resource "aws_iam_instance_profile" "elasticsearch" {
  name  = "${var.name}"
  roles = ["${aws_iam_role.elasticsearch.name}"]
}

resource "aws_iam_role" "elasticsearch" {
    name               = "${var.name}"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "elasticsearch" {
    name   = "${var.name}"
    role   = "${aws_iam_role.elasticsearch.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:DescribeInstances"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

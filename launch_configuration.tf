resource "aws_launch_configuration" "elasticsearch" {
  name_prefix          = "${var.name}-"
  image_id             = "${var.image_id}"
  instance_type        = "${var.instance_type}"
  security_groups      = ["${aws_security_group.elasticsearch_cluster.id}","${element(compact(split(",","${var.default_security_group_id},${aws_security_group.default.id}")),0)}"]
  iam_instance_profile = "${aws_iam_instance_profile.elasticsearch.name}"
  key_name             = "${var.key_pair_name}"
  user_data            = "${var.user_data}"

  root_block_device    = {
    volume_size = "${var.volume_size}"
    volume_type = "${var.volume_type}"
  }
    
  lifecycle {
    create_before_destroy = true
  }
}

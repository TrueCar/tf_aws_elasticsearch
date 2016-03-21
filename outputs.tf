output "endpoint"               { value = "${aws_route53_record.elasticsearch.fqdn}" }
output "cluster_group_name"     { value = "${aws_security_group.elasticsearch_cluster.name}" }
output "client_group_id"        { value = "${aws_security_group.elasticsearch_client.id}" }
output "autoscaling_group_name" { value = "${aws_autoscaling_group.elasticsearch.name}" }

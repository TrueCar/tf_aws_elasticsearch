|Name|Description|Required|Default|Component|
|---|---|:---:|:---:|---|
|image_id|The EC2 image ID to launch.|Yes||aws_launch_configuration.elasticsearch|
|instance_type|The EC2 instance type.|Yes||aws_launch_configuration.elasticsearch|
|key_pair_name|The key name that should be used for the instance.|Yes||aws_launch_configuration.elasticsearch|
|record_name|The record name that points to the ELB.|Yes||aws_route53_record.elasticsearch|
|route53_zone_id|The zone where the DNS record is to be created.|Yes||aws_route53_record.elasticsearch|
|subnet_ids|A comma separated list of subnet IDs|Yes||aws_autoscaling_group.elasticsearch, aws_elb.elasticsearch|
|vpc_id|The VPC ID.|Yes||aws_security_group.default, aws_security_group.elasticsearch_client, aws_security_group.elasticsearch_cluster|
|asg_max_size|The maximum instance count for the Autoscaling Group. It is recommended that this value and asg_min_size are the same.|No|3|aws_autoscaling_group.elasticsearch|
|asg_min_size|The minimum instance count for the Autoscaling Group. It is recommended that this value and asg_max_size are the same.|No|3|aws_autoscaling_group.elasticsearch|
|default_security_group_id|The optional ID of a security group that will override the default security group.|No|""|aws_launch_configuration.elasticsearch|
|health_check_grace_period|Time after instance comes into service before checking health.|No|300|aws_autoscaling_group.elasticsearch|
|name|The base name applied to resources.|No|elasticsearch|aws_autoscaling_group.elasticsearch, aws_elb.elasticsearch, aws_iam_instance_profile.elasticsearch, aws_iam_role.elasticsearch, aws_iam_role_policy.elasticsearch, aws_launch_configuration.elasticsearch, aws_route53_record.elasticsearch, aws_security_group.default, aws_security_group.elasticsearch_client, aws_security_group.elasticsearch_cluster|
|user_data|The user data to provide when launching the instance.|No|""|aws_launch_configuration.elasticsearch|
|volume_size|The size of the volume in gigabytes.|No|500|aws_launch_configuration.elasticsearch|
|volume_type|The type of the volume.|No|standard|aws_launch_configuration.elasticsearch|

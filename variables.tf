variable "name" {
  description = "The base name applied to resources."
  type        = "string"
  default     = "elasticsearch"
}

variable "vpc_id" {
  description = "The VPC ID."
  type        = "string"
}

variable "subnet_ids" {
  description = "A comma separated list of subnet IDs"
  type        = "string"
}

variable "asg_min_size" {
  description = "The minimum instance count for the Autoscaling Group. It is recommended that this value and asg_max_size are the same."
  type        = "string"
  default     = 3
}

variable "asg_max_size" {
  description = "The maximum instance count for the Autoscaling Group. It is recommended that this value and asg_min_size are the same."
  type        = "string"
  default     = 3
}

variable "instance_type" {
  description = "The EC2 instance type."
  type        = "string"
}

variable "volume_size" {
  description = "The size of the volume in gigabytes."
  type        = "string"
  default     = 500
}

variable "volume_type" {
  description = "The type of the volume."
  type        = "string"
  default     = "standard"
}

variable "image_id" {
  description = "The EC2 image ID to launch."
  type        = "string"
}

variable "key_pair_name" {
  description = "The key name that should be used for the instance."
  type        = "string"
}

variable "user_data" {
  description = "The user data to provide when launching the instance."
  type        = "string"
  default     = ""
}

variable "default_security_group_id" {
  description = "The optional ID of a security group that will override the default security group."
  type        = "string"
  default     = ""
}

variable "esclient_cidr_blocks" {
  description = "Comma separated list of cidr blocks that allow client access to the ES cluster."
  type        = "string"
  default     = "127.0.0.1/32"
}

variable "health_check_grace_period" {
  description = "Time after instance comes into service before checking health."
  type        = "string"
  default     = 300
}

variable "route53_zone_id" {
  description = "The zone where the DNS record is to be created."
  type        = "string"
}

variable "record_name" {
  description = "The record name that points to the ELB."
  type        = "string"
}

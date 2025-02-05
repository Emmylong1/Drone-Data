variable "cluster_name" {
  description = "IAM role ARN for the EKS cluster"
  type        = string
}

###########################################
variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "policy_name" {
  description = "The name of the IAM policy"
  type        = string
}

variable "kinesis_arn" {
  description = "The ARN of the Kinesis stream"
  type        = string
}

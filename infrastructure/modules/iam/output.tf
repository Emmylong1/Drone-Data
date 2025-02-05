output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}

output "eks_node_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}

########################
output "iam_role_arn" {
  value = aws_iam_role.lambda_role.arn
}

output "iam_role_name" {
  value = aws_iam_role.lambda_role.name
}

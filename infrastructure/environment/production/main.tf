module "network" {
  source               = "../../modules/vpc"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "iam" {
  source       = "../../modules/iam"
  cluster_name = "drone-cluster"
  role_name    = "lambda_kinesis_role"
  policy_name  = "lambda_kinesis_policy"
  kinesis_arn  = "arn:aws:kinesis:us-east-1:123456789012:stream/my-stream"
}


module "eks" {
  source           = "../../modules/eks"
  cluster_name     = "drone-cluster"
  cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn    = module.iam.eks_node_role_arn
  subnet_ids       = module.network.private_subnets
  instance_type    = "t3.medium"
  desired_capacity = 2
  max_capacity     = 3
  min_capacity     = 1

  tags = {
    Environment = "staging"
  }
}

module "kinesis" {
  source           = "../../modules/kinesis"
  stream_name      = "drone-data-stream"
  shard_count      = 2
  retention_period = 48
}


module "lambda_processor" {
  source           = "../../modules/lambda"
  function_name    = "kinesis-processor"
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.10"
  memory_size      = 512
  timeout          = 30
  kinesis_arn      = module.kinesis.stream_arn
  lambda_s3_bucket = "your-lambda-bucket"
  lambda_s3_key    = "lambda.zip"
}

module "s3" {
  source = "../../modules/s3"
}

module "ingress-controller" {
  source     = "../../modules/argocd/helm-chart-values"
  depends_on = [module.ingress-controller]
}

module "argocd" {
  source     = "../../modules/argocd/helm-chart-values"
  depends_on = [module.ingress-controller]
}

module "prometheus" {
  source     = "../../modules/prometheus/helm-chart-values"
  depends_on = [module.ingress-controller]
}

module "grafana" {
  source     = "../../modules/grafana/helm-chart-values"
  depends_on = [module.ingress-controller]
}
locals {
  cluster_id = join("", aws_eks_cluster.default.*.id)
}

provider "kubernetes" {
  token                  = join("", data.aws_eks_cluster_auth.eks.*.token)
  host                   = join("", data.aws_eks_cluster.eks.*.endpoint)
  cluster_ca_certificate = base64decode(join("", data.aws_eks_cluster.eks.*.certificate_authority.0.data))
}

data "aws_eks_cluster" "eks" {
  count = local.enabled && var.apply_config_map_aws_auth ? 1 : 0
  name  = local.cluster_id
}

# Get an authentication token to communicate with the EKS cluster.
# By default (before other roles are added to the Auth ConfigMap), you can authenticate to EKS cluster only by assuming the role that created the cluster.
# `aws_eks_cluster_auth` uses IAM credentials from the AWS provider to generate a temporary token.
# If the AWS provider assumes an IAM role, `aws_eks_cluster_auth` will use the same IAM role to get the auth token.
# https://www.terraform.io/docs/providers/aws/d/eks_cluster_auth.html
data "aws_eks_cluster_auth" "eks" {
  count = local.enabled && var.apply_config_map_aws_auth ? 1 : 0
  name  = local.cluster_id
}

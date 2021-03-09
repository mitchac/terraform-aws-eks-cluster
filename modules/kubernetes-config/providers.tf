provider "kubernetes" {
  token                  = join("", data.aws_eks_cluster_auth.eks.*.token)
  host                   = join("", data.aws_eks_cluster.eks.*.endpoint)
  cluster_ca_certificate = base64decode(join("", data.aws_eks_cluster.eks.*.certificate_authority.0.data))
}

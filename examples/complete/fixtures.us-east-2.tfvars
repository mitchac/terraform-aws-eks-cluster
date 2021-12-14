region = "us-east-1"

availability_zones = ["us-east-1c", "us-east-1d"]

namespace = "eg"

stage = "test"

name = "eks"

kubernetes_version = "1.19"

oidc_provider_enabled = true

enabled_cluster_log_types = ["audit"]

cluster_log_retention_period = 7

instance_types = ["c5.4xlarge"]

desired_size = 1

max_size = 3

min_size = 1

kubernetes_labels = {}

cluster_encryption_config_enabled = true

addons = [
  {
    addon_name               = "vpc-cni"
    addon_version            = null
    resolve_conflicts        = "NONE"
    service_account_role_arn = null
  }
]

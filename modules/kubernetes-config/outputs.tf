output "kubernetes_config_map_id" {
  description = "ID of `aws-auth` Kubernetes ConfigMap"
  value       = var.kubernetes_config_map_ignore_role_changes ? join("", kubernetes_config_map.aws_auth_ignore_changes.*.id) : join("", kubernetes_config_map.aws_auth.*.id)
}

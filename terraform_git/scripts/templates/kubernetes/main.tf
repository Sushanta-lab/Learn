/*module "ip_masq" {
  source                    = "../../modules/ip_masq"
  enable_configure_ip_masq  = var.enable_configure_ip_masq
  non_masquerade_cidrs      = var.non_masquerade_cidrs
  ip_masq_resync_interval   = var.ip_masq_resync_interval
  enable_ip_masq_link_local = var.enable_ip_masq_link_local
}*/

module "namespaces" {
  source     = "../../modules/namespaces"
  namespaces = var.namespaces
}

/*module "network_policies" {
  source                         = "../../modules/network_policies"
  annotations                    = var.annotations
  labels                         = var.labels
  name                           = var.network_policy_name
  namespace                      = var.namespace
  egress                         = var.egress
  ingress                        = var.ingress
  pod_selector_match_expressions = var.pod_selector_match_expressions
  pod_selector_match_labels      = var.pod_selector_match_labels
  policy_types                   = var.policy_types
  cluster_name                   = var.cluster_name_network
  cluster_location               = var.cluster_location
}*/

module "rbac" {
  source    = "../../modules/rbac"
  namespace = var.rbac_namespace
  subject   = var.subject
  depends_on = [module.namespaces]
}

/*module "service_account" {
  source                          = "../../modules/service_account"
  name                            = var.name
  project_id                      = var.project_id
  gcp_sa_name                     = var.gcp_sa_name
  use_existing_gcp_sa             = var.use_existing_gcp_sa
  cluster_name                    = var.cluster_name
  location                        = var.location
  k8s_sa_name                     = var.k8s_sa_name
  namespace                       = var.ksa_namespace
  use_existing_k8s_sa             = var.use_existing_k8s_sa
  annotate_k8s_sa                 = var.annotate_k8s_sa
  automount_service_account_token = var.automount_service_account_token
  roles                           = var.roles
  impersonate_service_account     = var.impersonate_service_account
}*/



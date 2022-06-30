module "gke_cluster" {
  source                                       = "/home/k8smaster/terraform_git/scripts/modules/gke_cluster"
  name                                         = var.name
  description                                  = var.description
  location                                     = var.location
  node_locations                               = var.node_locations
  disable_horizontal_pod_autoscaling           = var.disable_horizontal_pod_autoscaling
  disable_http_load_balancing                  = var.disable_http_load_balancing
  disable_network_policy_config                = var.disable_network_policy_config
  enable_gcp_filestore_csi_driver_config       = var.enable_gcp_filestore_csi_driver_config
  cloudrun_config                              = var.cloudrun_config
  #istio_config                                 = var.istio_config
  enable_dns_cache_config                      = var.enable_dns_cache_config
  #enable_gce_persistent_disk_csi_driver_config = var.enable_gce_persistent_disk_csi_driver_config
  #enable_kalm_config                           = var.enable_kalm_config
  #enable_config_connector_config               = var.enable_config_connector_config
  #enable_indentity_service_config              = var.enable_indentity_service_config
  cluster_autoscaling_enabled                  = var.cluster_autoscaling_enabled
  resource_limits                              = var.resource_limits
  #auto_provisioning_service_account            = var.auto_provisioning_service_account
  #auto_provisioning_image_type                 = var.auto_provisioning_image_type
  autoscaling_profile                          = var.autoscaling_profile
  database_encryption                          = var.database_encryption
  default_max_pods_per_node                    = var.default_max_pods_per_node
  #enable_binary_authorization                  = var.enable_binary_authorization
  #enable_kubernetes_alpha                      = var.enable_kubernetes_alpha
  #enable_tpu                                   = var.enable_tpu
  #enable_legacy_abac                           = var.enable_legacy_abac
  #enable_shielded_nodes                        = var.enable_shielded_nodes
  #cluster_secondary_range_name                 = var.pod_secondary_range_name
  pod_secondary_range_name                     = var.pod_secondary_range_name
  services_secondary_range_name                = var.services_secondary_range_name
  networking_mode                              = var.networking_mode
  enable_components                            = var.enable_components
  #recurring_window                             = var.recurring_window
  #maintenance_exclusion                        = var.maintenance_exclusion
  #issue_client_certificate                     = var.enable_issue_client_certificate
  master_authorized_networks_config            = var.master_authorized_networks_config
  min_master_version                           = var.min_master_version
  monitoring_config                            = var.monitoring_config
  #network                                      = var.network
  network_policy_enabled                       = var.network_policy_enabled
  #dataplanev2_enabled                          = var.dataplanev2_enabled
  enable_pod_security_policy_config            = var.enable_pod_security_policy_config

  # We have to enable it!!!!!
  #   authenticator_groups_config = var.authenticator_groups_config

  enable_private_nodes               = var.enable_private_nodes
  enable_private_endpoint            = var.enable_private_endpoint
  master_ipv4_cidr_block             = var.master_ipv4_cidr_block
  enable_master_global_access_config = var.enable_master_global_access_config
  project_id                         = var.project_id
  region                             = var.region
  release_channel                    = var.release_channel
  resource_labels                    = var.resource_labels
  #subnetwork                         = var.subnetwork
  enable_vertical_pod_autoscaling    = var.enable_vertical_pod_autoscaling
  #workload_identity_config           = var.workload_identity_config
  enable_intranode_visibility        = var.enable_intranode_visibility
  enable_l4_ilb_subsetting           = var.enable_l4_ilb_subsetting
  disable_default_snat_status        = var.disable_default_snat_status
  cluster_dns                        = var.cluster_dns
  cluster_dns_scope                  = var.cluster_dns_scope
  cluster_dns_domain                 = var.cluster_dns_domain
  #remove_default_node_pool           = true
  #initial_node_count                 = 1

  ########## Node pools ##########

  ######### System nodes #########

  node_pool_location_sys                  = var.node_pool_location_sys
  min_node_count_sys                      = var.min_node_count_sys
  max_node_count_sys                      = var.max_node_count_sys
  initial_node_count_sys                  = var.initial_node_count_sys
  enable_management_auto_repair_sys       = var.enable_management_auto_repair_sys
  enable_management_auto_upgrade_sys      = var.enable_management_auto_upgrade_sys
  max_pods_per_node_sys                   = var.max_pods_per_node_sys
  node_pool_name_sys                      = var.node_pool_name_sys
  #disk_size_gb_sys                        = var.disk_size_gb_sys
  #disk_type_sys                           = var.disk_type_sys
  #enable_gcfs_config_sys                  = var.enable_gcfs_config_sys
  #guest_accelerator_sys                   = var.guest_accelerator_sys
  image_type_sys                          = var.image_type_sys
  labels_sys                              = var.labels_sys
  local_ssd_count_sys                     = var.local_ssd_count_sys
  machine_type_sys                        = var.machine_type_sys
  metadata_sys                            = var.metadata_sys
  node_config_oauth_scopes_sys            = var.node_config_oauth_scopes_sys
  enable_preemptible_sys                  = var.enable_preemptible_sys
  enable_spot_sys                         = var.enable_spot_sys
  #boot_disk_kms_key_sys                   = var.boot_disk_kms_key_sys
  #node_config_service_account_sys         = var.node_config_service_account_sys
  enable_secure_boot_sys                  = var.enable_secure_boot_sys
  enable_integrity_monitoring_sys         = var.enable_integrity_monitoring_sys
  tags_sys                                = var.tags_sys
  workload_metadata_config_sys            = var.workload_metadata_config_sys
  kubelet_config_cpu_manager_policy_sys   = var.kubelet_config_cpu_manager_policy_sys
  #enable_kubelet_config_cpu_cfs_quota_sys = var.enable_kubelet_config_cpu_cfs_quota_sys
  kubelet_config_cpu_cfs_quota_period_sys = var.kubelet_config_cpu_cfs_quota_period_sys
  node_group_sys                          = var.node_group_sys
  pod_range_sys                           = var.pod_range_sys
  max_surge_sys                           = var.max_surge_sys
  max_unavailable_sys                     = var.max_unavailable_sys

  ######### Application nodes #########

  node_pool_location_app                  = var.node_pool_location_app
  min_node_count_app                      = var.min_node_count_app
  max_node_count_app                      = var.max_node_count_app
  initial_node_count_app                  = var.initial_node_count_app
  enable_management_auto_repair_app       = var.enable_management_auto_repair_app
  enable_management_auto_upgrade_app      = var.enable_management_auto_upgrade_app
  max_pods_per_node_app                   = var.max_pods_per_node_app
  node_pool_name_app                      = var.node_pool_name_app
  #disk_size_gb_app                        = var.disk_size_gb_app
  #disk_type_app                           = var.disk_type_app
  #enable_gcfs_config_app                  = var.enable_gcfs_config_app
  #guest_accelerator_app                   = var.guest_accelerator_app
  image_type_app                          = var.image_type_app
  labels_app                              = var.labels_app
  local_ssd_count_app                     = var.local_ssd_count_app
  machine_type_app                        = var.machine_type_app
  metadata_app                            = var.metadata_app
  #node_config_oauth_scopes_app            = var.node_config_oauth_scopes_app
  enable_preemptible_app                  = var.enable_preemptible_app
  enable_spot_app                         = var.enable_spot_app
  sandbox_config                          = var.sandbox_config
  #boot_disk_kms_key_app                   = var.boot_disk_kms_key_app
  #node_config_service_account_app         = var.node_config_service_account_app
  enable_secure_boot_app                  = var.enable_secure_boot_app
  enable_integrity_monitoring_app         = var.enable_integrity_monitoring_app
  tags_app                                = var.tags_app
  taint_app                               = var.taint_app
  workload_metadata_config_app            = var.workload_metadata_config_app
  kubelet_config_cpu_manager_policy_app   = var.kubelet_config_cpu_manager_policy_app
  #enable_kubelet_config_cpu_cfs_quota_app = var.enable_kubelet_config_cpu_cfs_quota_app
  kubelet_config_cpu_cfs_quota_period_app = var.kubelet_config_cpu_cfs_quota_period_app
  node_group_app                          = var.node_group_app
  pod_range_app                           = var.pod_range_app
  max_surge_app                           = var.max_surge_app
  max_unavailable_app                     = var.max_unavailable_app
}

/*module "gke_backup" {
  source           = "../../modules/gke_backup"
  cluster_name     = var.cluster_name
  project_id       = var.project_id
  region           = var.region
  cluster_path     = var.cluster_path
  encryption_key   = var.encryption_key
  cron_schedule    = var.cron_schedule
  retain_days      = var.retain_days
  delete_lock_days = var.delete_lock_days
}

module "artifact_registry" {
  source      = "../../modules/artifact_registry"
  project     = var.project_id
  setting     = var.setting
  apply_roles = var.apply_roles
}

module "binary_authorization" {
  source      = "../../modules/binary_authorization"
  project     = var.project_id
  description = var.binary_auth_description
  region      = var.binary_auth_region
}*/




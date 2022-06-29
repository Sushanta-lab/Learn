variable "name" {
  type        = string
  description = "The name of the cluster (required)"
}

variable "description" {
  type        = string
  description = "Description of the cluster"
}

variable "location" {
  type        = string
  description = "The location (region or zone) in which the cluster master will be created, as well as the default node location."
}

variable "node_locations" {
  type        = list(string)
  description = "The list of zones in which the cluster's nodes are located."
}

variable "disable_horizontal_pod_autoscaling" {
  type        = bool
  description = "Enable horizontal pod autoscaling addon"
  default     = false
}

variable "disable_http_load_balancing" {
  type        = bool
  description = "Enable http load balancer addon"
  default     = false
}

variable "disable_network_policy_config" {
  type        = bool
  description = "Enable network policy addon"
  default     = true
}

variable "enable_gcp_filestore_csi_driver_config" {
  type        = bool
  description = "The status of the Filestore CSI driver addon, which allows the usage of filestore instance as volumes."
  default     = false
}

variable "cloudrun_config" {
  type        = list(object({ disabled = bool, load_balancer_type = string }))
  description = "Enable CloudRun addon"
  default = [{
    disabled           = true
    load_balancer_type = "LOAD_BALANCER_TYPE_INTERNAL"
  }]
}

/*variable "istio_config" {
  type        = list(object({ disabled = bool, auth = string }))
  description = "Enable Istio addon"
  default = [{
    disabled = true
    auth     = "AUTH_MUTUAL_TLS"
  }]
}

variable "enable_identity_service_config" {
  type        = bool
  description = "Enable Identity Service addon"
  default     = false
}*/

variable "enable_dns_cache_config" {
  type        = bool
  description = "Enable NodeLocal DNSCache addon"
  default     = false
}

/*variable "enable_gce_persistent_disk_csi_driver_config" {
  type        = bool
  description = "Enable the Google Compute Engine Persistent Disk Container Storage Interface (CSI) Driver addon"
  default     = true
}

variable "enable_kalm_config" {
  type        = bool
  description = "Enable KALM addon"
  default     = false
}

variable "enable_config_connector_config" {
  type        = bool
  description = "Enable ConfigConnector addon"
  default     = false
}*/

variable "cluster_autoscaling_enabled" {
  type        = bool
  description = "Whether node auto-provisioning is enabled. Resource limits for cpu and memory must be defined to enable node auto-provisioning."
  default     = true
}

variable "resource_limits" {
  type        = list(object({ resource_type = string, minimum = number, maximum = number }))
  description = "Global constraints for machine resources in the cluster. Configuring the cpu and memory types is required if node auto-provisioning is enabled. These limits will apply to node pool autoscaling in addition to node auto-provisioning."
  default = [{
    resource_type = "cpu"
    minimum       = 2
    maximum       = 64
    },
    {
      resource_type = "memory"
      minimum       = 4
      maximum       = 128
  }]
}

/*variable "auto_provisioning_service_account" {
  type        = string
  description = "The Google Cloud Platform Service Account to be used by the node VMs."
}

variable "auto_provisioning_image_type" {
  type        = string
  description = "The default image type used by NAP once a new node pool is being created. Please note that according to the official documentation the value must be one of the [COS_CONTAINERD, COS, UBUNTU_CONTAINERD, UBUNTU]."
  default     = "COS_CONTAINERD"
}*/

variable "autoscaling_profile" {
  type        = string
  description = "Configuration options for the Autoscaling profile feature, which lets you choose whether the cluster autoscaler should optimize for resource utilization or resource availability when deciding to remove nodes from a cluster."
  default     = "BALANCED"
}

variable "database_encryption" {
  type        = list(object({ state = string, key_name = string }))
  description = "Define the state (encrypted or decrypted) and the key_name to encrypt/decrypt secrets"
}

variable "default_max_pods_per_node" {
  type        = number
  description = "The default maximum number of pods per node in this cluster"
  default     = 8
}

/*variable "enable_binary_authorization" {
  type        = bool
  description = "Enable Binary Authorization for this cluster."
  default     = true
}

variable "enable_kubernetes_alpha" {
  type        = bool
  description = "Whether to enable Kubernetes Alpha features for this cluster."
  default     = false
}

variable "enable_tpu" {
  type        = bool
  description = "Whether to enable Cloud TPU resources in this cluster."
  default     = false
}

variable "enable_legacy_abac" {
  type        = bool
  description = "Whether the ABAC authorizer is enabled for this cluster."
  default     = false
}

variable "enable_shielded_nodes" {
  type        = bool
  description = "Enable Shielded Nodes features on all nodes in this cluster."
  default     = true
}*/

variable "pod_secondary_range_name" {
  type        = string
  description = "The name of the existing secondary range in the cluster's subnetwork to use for pod IP addresses."
}

variable "services_secondary_range_name" {
  type        = string
  description = "The name of the existing secondary range in the cluster's subnetwork to use for service ClusterIPs"
}

variable "networking_mode" {
  type        = string
  description = "Determines whether alias IPs or routes will be used for pod IPs in the cluster."
  default     = "VPC_NATIVE"
}

variable "enable_components" {
  type        = list(string)
  description = "The GKE components exposing logs."
  default     = ["SYSTEM_COMPONENTS", "WORKLOADS"]
}

/*variable "recurring_window" {
  type        = list(object({ start_time = string, end_time = string, recurrence = string }))
  description = "Time window for recurring maintenance operations."
  default = [{
    start_time = "2022-01-01T00:00:00Z"
    end_time   = "2023-01-02T00:00:00Z"
    recurrence = "FREQ=WEEKLY"
  }]
}

variable "maintenance_exclusion" {
  type        = list(object({ exclusion_name = string, start_time = string, end_time = string }))
  description = " Exceptions to maintenance window."
  default     = []
}*/

variable "enable_issue_client_certificate" {
  type        = bool
  description = "Whether client certificate authorization is enabled for this cluster."
  default     = false
}

variable "master_authorized_networks_config" {
  type        = list(object({ cidr_blocks = list(object({ cidr_block = string, display_name = string })) }))
  description = "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
  default = [{ cidr_blocks = [{
    cidr_block = "10.0.0.0/24"
    display_name = "all" }]
  }]
}

variable "min_master_version" {
  type        = string
  description = "The minimum version of the master."
}

variable "monitoring_config" {
  type        = list(string)
  description = "Monitoring configuration for the cluster."
  default     = ["SYSTEM_COMPONENTS", "WORKLOADS"]
}

/*variable "network" {
  type        = string
  description = "The name or self_link of the Google Compute Engine network to which the cluster is connected."
}*/

variable "network_policy_enabled" {
  type        = bool
  description = "Whether network policy is enabled on the cluster."
  default     = false
}

/*variable "dataplanev2_enabled" {
  type        = bool
  description = "Enabling Dataplane v2 (cilium) instead of network policy (calico)"
  default     = true
}*/

variable "pod_ipv4_cidr_block" {
  type        = string
  description = "The IP address range for pod IPs in this node pool."
  default     = null
}

variable "enable_pod_security_policy_config" {
  type        = bool
  description = "Configuration for the PodSecurityPolicy feature."
  default     = true
}

/*variable "authenticator_groups_config" {
  type        = string
  description = "Configuration for the Google Groups for GKE feature. The name of the RBAC security group for use with Google security groups in Kubernetes RBAC."
}*/

variable "enable_private_nodes" {
  type        = bool
  description = "Enables the private cluster feature, creating a private endpoint on the cluster."
  default     = true
}

variable "enable_private_endpoint" {
  type        = bool
  description = "When true, the cluster's private endpoint is used as the cluster endpoint and access through the public endpoint is disabled."
  default     = true
}

variable "master_ipv4_cidr_block" {
  type        = string
  description = " The IP range in CIDR notation to use for the hosted master network. This range will be used for assigning private IP addresses to the cluster master(s) and the ILB VIP."
}

variable "enable_master_global_access_config" {
  type        = bool
  description = "Controls cluster master global access settings. Whether the cluster master is accessible globally or not."
  default     = true
}

variable "project_id" {
  type        = string
  description = "The ID of the project in which the resource belongs."
}

variable "region" {
  type        = string
  description = "The region to deploy cluster."
}

variable "release_channel" {
  type        = string
  description = "The selected release channel. Accepted values are UNSPECIFIED, RAPID, REGULAR orSTABLE."
}

variable "resource_labels" {
  type        = map(string)
  description = "The GCE resource labels (a map of key/value pairs) to be applied to the cluster."
}
/*variable "subnetwork" {
  type        = string
  description = "The name or self_link of the Google Compute Engine subnetwork in which the cluster's instances are launched."
}*/

variable "enable_vertical_pod_autoscaling" {
  type        = bool
  description = "Enables vertical pod autoscaling. Vertical Pod Autoscaling automatically adjusts the resources of pods controlled by it."
  default     = true
}

/*variable "workload_identity_config" {
  type        = string
  description = "The workload pool to attach all Kubernetes service accounts to. -> {data.google_project.project.project_id}.svc.id.goog "
}*/

variable "enable_intranode_visibility" {
  type        = bool
  description = "Whether Intra-node visibility is enabled for this cluster."
  default     = false
}

variable "enable_l4_ilb_subsetting" {
  type        = bool
  description = "Whether L4ILB Subsetting is enabled for this cluster."
  default     = true
}

variable "disable_default_snat_status" {
  type        = bool
  description = "Whether the cluster disables default in-node sNAT rules. GKE SNAT DefaultSnatStatus contains the desired state of whether default sNAT should be disabled on the cluster."
  default     = true
}

variable "cluster_dns" {
  type        = string
  description = "Configuration for Using Cloud DNS for GKE."
  default     = "PROVIDER_UNSPECIFIED"
}

variable "cluster_dns_scope" {
  type        = string
  description = "Configuration for Using Cloud DNS for GKE."
  default     = "DNS_SCOPE_UNSPECIFIED"
}

variable "cluster_dns_domain" {
  type        = string
  description = "The suffix used for all cluster service records."
}


########## Node pools ##########

######### System nodes #########

variable "node_pool_location_sys" {
  type        = string
  description = "The location (region or zone) of the cluster."
}

variable "min_node_count_sys" {
  type        = number
  description = "Minimum number of nodes in the NodePool."
}

variable "max_node_count_sys" {
  type        = number
  description = "Maximum number of nodes in the NodePool."
}

variable "initial_node_count_sys" {
  type        = number
  description = "The initial number of nodes for the pool. In regional or multi-zonal clusters, this is the number of nodes per zone. Changing this will force recreation of the resource."
  default     = 1
}

variable "enable_management_auto_repair_sys" {
  type        = bool
  description = "Whether the nodes will be automatically repaired."
  default     = true
}

variable "enable_management_auto_upgrade_sys" {
  type        = bool
  description = "Whether the nodes will be automatically upgraded."
  default     = true
}

variable "max_pods_per_node_sys" {
  type        = number
  description = "The maximum number of pods per node in this node pool. Note that this does not work on node pools which are 'route-based' - that is, node pools belonging to clusters that do not have IP Aliasing enabled."
}

variable "node_pool_name_sys" {
  type        = string
  description = "The name of the node pool."
}

/*variable "disk_size_gb_sys" {
  type        = number
  description = "Size of the disk attached to each node, specified in GB. The smallest allowed disk size is 10GB."
  default     = 10
}

variable "disk_type_sys" {
  type        = string
  description = "Type of the disk attached to each node (e.g. 'pd-standard', 'pd-balanced' or 'pd-ssd')."
  default     = "pd-standard"
}

variable "enable_gcfs_config_sys" {
  type        = bool
  description = "Whether or not the Google Container Filesystem (GCFS) is enabled"
  default     = true
}*/

/*variable "guest_accelerator_sys" {
  type        = list(object({ type = string, count = number, gpu_partition_size = string }))
  description = "List of the type and count of accelerator cards attached to the instance."
}*/

variable "image_type_sys" {
  type        = string
  description = "The image type to use for this node. Note that changing the image type will delete and recreate all nodes in the node pool."
  default     = "COS_CONTAINERD"
}

variable "labels_sys" {
  type        = map(string)
  description = "The Kubernetes labels (key/value pairs) to be applied to each node. The kubernetes.io/ and k8s.io/ prefixes are reserved by Kubernetes Core components and cannot be specified."
}

variable "local_ssd_count_sys" {
  type        = number
  description = "The amount of local SSD disks that will be attached to each cluster node."
}

variable "machine_type_sys" {
  type        = string
  description = "The name of a Google Compute Engine machine type."
  default     = "e2-small"
}

variable "metadata_sys" {
  type        = map(string)
  description = "The metadata key/value pairs assigned to instances in the cluster."
  default     = { "disable-legacy-endpoints" : true }
}

variable "node_config_oauth_scopes_sys" {
  type        = set(string)
  description = " The set of Google API scopes to be made available on all of the node VMs under the 'default' service account. Use the 'https://www.googleapis.com/auth/cloud-platform' scope to grant access to all APIs. It is recommended that you set service_account to a non-default service account and grant IAM roles to that service account for only the resources that it needs."
}

variable "enable_preemptible_sys" {
  type        = bool
  description = "A boolean that represents whether or not the underlying node VMs are preemptible."
  default     = false
}

variable "enable_spot_sys" {
  type        = bool
  description = "A boolean that represents whether the underlying node VMs are spot."
  default     = false
}

/*variable "boot_disk_kms_key_sys" {
  type        = string
  description = "The Customer Managed Encryption Key used to encrypt the boot disk attached to each node in the node pool. This should be of the form projects/[KEY_PROJECT_ID]/locations/[LOCATION]/keyRings/[RING_NAME]/cryptoKeys/[KEY_NAME]."
}

variable "node_config_service_account_sys" {
  type        = string
  description = "The service account to be used by the Node VMs. If not specified, the 'default' service account is used."
}*/

variable "enable_secure_boot_sys" {
  type        = bool
  description = "Defines if the instance has Secure Boot enabled."
  default     = false
}

variable "enable_integrity_monitoring_sys" {
  type        = bool
  description = "Defines if the instance has integrity monitoring enabled."
  default     = true
}

variable "tags_sys" {
  type        = list(string)
  description = "The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls."
}

variable "workload_metadata_config_sys" {
  type        = string
  description = "How to expose the node metadata to the workload running on the node. Accepted values are: UNSPECIFIED, GCE_METADATA, GKE_METADATA"
  default     = "GKE_METADATA"
}

variable "kubelet_config_cpu_manager_policy_sys" {
  type        = string
  description = "The CPU management policy on the node. One of 'none' or 'static'."
}

/*variable "enable_kubelet_config_cpu_cfs_quota_sys" {
  type        = bool
  description = "If true, enables CPU CFS quota enforcement for containers that specify CPU limits."
}*/

variable "kubelet_config_cpu_cfs_quota_period_sys" {
  type        = string
  description = "The CPU CFS quota period value. Specified as a sequence of decimal numbers, each with optional fraction and a unit suffix, such as '300ms'. Valid time units are 'ns', 'us' (or 'µs'), 'ms', 's', 'm', 'h'."
}

variable "node_group_sys" {
  type        = string
  description = "Setting this field will assign instances of this pool to run on the specified node group."
}

variable "pod_range_sys" {
  type        = string
  description = "The ID of the secondary range for pod IPs."
}

variable "max_surge_sys" {
  type        = string
  description = "The number of additional nodes that can be added to the node pool during an upgrade. Increasing max_surge raises the number of nodes that can be upgraded simultaneously."
}

variable "max_unavailable_sys" {
  type        = string
  description = "The number of nodes that can be simultaneously unavailable during an upgrade. Increasing max_unavailable raises the number of nodes that can be upgraded in parallel."
}

######### Application nodes #########

variable "node_pool_location_app" {
  type        = string
  description = "The location (region or zone) of the cluster."
}

variable "min_node_count_app" {
  type        = number
  description = "Minimum number of nodes in the NodePool."
}

variable "max_node_count_app" {
  type        = number
  description = "Maximum number of nodes in the NodePool."
}

variable "initial_node_count_app" {
  type        = number
  description = "The initial number of nodes for the pool. In regional or multi-zonal clusters, this is the number of nodes per zone. Changing this will force recreation of the resource."
  default     = 1
}

variable "enable_management_auto_repair_app" {
  type        = bool
  description = "Whether the nodes will be automatically repaired."
  default     = true
}

variable "enable_management_auto_upgrade_app" {
  type        = bool
  description = "Whether the nodes will be automatically upgraded."
  default     = true
}

variable "max_pods_per_node_app" {
  type        = number
  description = "The maximum number of pods per node in this node pool. Note that this does not work on node pools which are 'route-based' - that is, node pools belonging to clusters that do not have IP Aliasing enabled."
}

variable "node_pool_name_app" {
  type        = string
  description = "The name of the node pool."
}

/*variable "disk_size_gb_app" {
  type        = number
  description = "Size of the disk attached to each node, specified in GB. The smallest allowed disk size is 10GB."
  default     = 10
}

variable "disk_type_app" {
  type        = string
  description = "Type of the disk attached to each node (e.g. 'pd-standard', 'pd-balanced' or 'pd-ssd')."
  default     = "pd-standard"
}

variable "enable_gcfs_config_app" {
  type        = bool
  description = "Whether or not the Google Container Filesystem (GCFS) is enabled"
  default     = true
}

variable "guest_accelerator_app" {
  type        = list(object({ type = string, count = number, gpu_partition_size = string }))
  description = "List of the type and count of accelerator cards attached to the instance."
}*/

variable "image_type_app" {
  type        = string
  description = "The image type to use for this node. Note that changing the image type will delete and recreate all nodes in the node pool."
  default     = "COS_CONTAINERD"
}

variable "labels_app" {
  type        = map(string)
  description = "The Kubernetes labels (key/value pairs) to be applied to each node. The kubernetes.io/ and k8s.io/ prefixes are reserved by Kubernetes Core components and cannot be specified."
}

variable "local_ssd_count_app" {
  type        = number
  description = "The amount of local SSD disks that will be attached to each cluster node."
}

variable "machine_type_app" {
  type        = string
  description = "The name of a Google Compute Engine machine type."
  default     = "e2-small"
}

variable "metadata_app" {
  type        = map(string)
  description = "The metadata key/value pairs assigned to instances in the cluster."
  default     = { "disable-legacy-endpoints" : true }
}

/*variable "node_config_oauth_scopes_app" {
  type        = set(string)
  description = " The set of Google API scopes to be made available on all of the node VMs under the 'default' service account. Use the 'https://www.googleapis.com/auth/cloud-platform' scope to grant access to all APIs. It is recommended that you set service_account to a non-default service account and grant IAM roles to that service account for only the resources that it needs."
}*/

variable "enable_preemptible_app" {
  type        = bool
  description = "A boolean that represents whether or not the underlying node VMs are preemptible."
  default     = false
}

variable "enable_spot_app" {
  type        = bool
  description = "A boolean that represents whether the underlying node VMs are spot."
  default     = false
}

variable "sandbox_config" {
  type        = list(map(string))
  description = "Which sandbox to use for pods in the node pool."
  default     = [{ "sandbox_type" : "gvisor" }]
}

/*variable "boot_disk_kms_key_app" {
  type        = string
  description = "The Customer Managed Encryption Key used to encrypt the boot disk attached to each node in the node pool. This should be of the form projects/[KEY_PROJECT_ID]/locations/[LOCATION]/keyRings/[RING_NAME]/cryptoKeys/[KEY_NAME]."
}

variable "node_config_service_account_app" {
  type        = string
  description = "The service account to be used by the Node VMs. If not specified, the 'default' service account is used."
}*/

variable "enable_secure_boot_app" {
  type        = bool
  description = "Defines if the instance has Secure Boot enabled."
  default     = false
}

variable "enable_integrity_monitoring_app" {
  type        = bool
  description = "Defines if the instance has integrity monitoring enabled."
  default     = true
}

variable "tags_app" {
  type        = list(string)
  description = "The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls."
}

variable "taint_app" {
  type        = list(object({ key = string, value = string, effect = string }))
  description = "A list of Kubernetes taints to apply to nodes. Key for taint. Value for taint. Effect for taint. Accepted values are NO_SCHEDULE, PREFER_NO_SCHEDULE, and NO_EXECUTE."
  default = [{
    key    = "node_type"
    value  = "application"
    effect = "NO_SCHEDULE"
  }]
}

variable "workload_metadata_config_app" {
  type        = string
  description = "How to expose the node metadata to the workload running on the node. Accepted values are: UNSPECIFIED, GCE_METADATA, GKE_METADATA"
  default     = "GKE_METADATA"
}

variable "kubelet_config_cpu_manager_policy_app" {
  type        = string
  description = "The CPU management policy on the node. One of 'none' or 'static'."
}

/*variable "enable_kubelet_config_cpu_cfs_quota_app" {
  type        = bool
  description = "If true, enables CPU CFS quota enforcement for containers that specify CPU limits."
}*/

variable "kubelet_config_cpu_cfs_quota_period_app" {
  type        = string
  description = "The CPU CFS quota period value. Specified as a sequence of decimal numbers, each with optional fraction and a unit suffix, such as '300ms'. Valid time units are 'ns', 'us' (or 'µs'), 'ms', 's', 'm', 'h'."
}

variable "node_group_app" {
  type        = string
  description = "Setting this field will assign instances of this pool to run on the specified node group."
}

variable "pod_range_app" {
  type        = string
  description = "The ID of the secondary range for pod IPs."
}

variable "max_surge_app" {
  type        = string
  description = "The number of additional nodes that can be added to the node pool during an upgrade. Increasing max_surge raises the number of nodes that can be upgraded simultaneously."
}

variable "max_unavailable_app" {
  type        = string
  description = "The number of nodes that can be simultaneously unavailable during an upgrade. Increasing max_unavailable raises the number of nodes that can be upgraded in parallel."
}

#variable "access_token" {
#  type        = string
#  description = " Credentials (required)"
#}


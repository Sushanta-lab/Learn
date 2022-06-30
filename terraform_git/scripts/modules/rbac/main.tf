# Defining the 'developer' role
resource "kubernetes_role" "developer-role" {
  metadata {
    name      = "developer-role"
    namespace = var.namespace
  }

  rule {
    api_groups = ["", "apps"]
    resources  = ["pods", "deployments", "replicasets", "persistentvolumes", "persistentvolumeclaims", "services"]
    verbs      = ["get", "list", "create", "delete", "watch"]
  }
}

# Defining the 'developer-cluster' role
resource "kubernetes_cluster_role" "developer-cluster-role" {
  metadata {
    name = "developer-cluster-role"
  }

  rule {
    api_groups = ["apps"]
    resources  = ["namespaces"]
    verbs      = ["list"]
  }
}

# Defining the 'tenant-admin' role
resource "kubernetes_role" "tenant-admin-role" {
  metadata {
    name      = "tenant-admin-role"
    namespace = var.namespace
  }

  rule {
    api_groups = ["", "apps", "autoscaling", "batch", "extensions", "policy"]
    resources = ["pods", "deployments", "replicasets", "persistentvolumes", "persistentvolumeclaims", "services", "componentstatuses",
      "configmaps", "daemonsets", "deployments", "events", "endpoints", "horizontalpodautoscalers", "ingress", "jobs", "limitranges",
    "resourcequotas", "nodes", "serviceaccounts", "services"]

    verbs = ["get", "list", "create", "delete", "watch", "update", "patch"]
  }
}

# Role binding

# Creating lists for 'developer', 'tenantadmin' and 'clusteradmin',
# with the relevant information for each type attached 
locals {
  developer    = [for i, z in var.subject : var.subject[i] if z.role == "developer"]
  tenantadmin  = [for i, z in var.subject : var.subject[i] if z.role == "tenantadmin"]
  clusteradmin = [for i, z in var.subject : var.subject[i] if z.role == "clusteradmin"]
}

# Creating developer-role-binding
resource "kubernetes_role_binding" "developer-role-binding" {
  count = length(local.developer) > 0 ? 1 : 0
  metadata {
    name      = "developer-role-binding"
    namespace = var.namespace
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "developer"
  }

  dynamic "subject" {
    for_each = local.developer
    content {
      kind      = subject.value["type"]
      name      = subject.value["email_id"]
      api_group = subject.value["api_group"]
      namespace = subject.value["namespace"]
    }
  }
}

# Creating developer-cluster-role-binding
resource "kubernetes_cluster_role_binding" "developer-cluster-role-binding" {
  count = length(local.developer) > 0 ? 1 : 0
  metadata {
    name = "developer-cluster-role-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "developer-cluster-role"
  }

  dynamic "subject" {
    for_each = local.developer
    content {
      kind      = subject.value["type"]
      name      = subject.value["email_id"]
      api_group = subject.value["api_group"]
      namespace = subject.value["namespace"]
    }
  }
}

# Creating tenant-admin-role-binding
resource "kubernetes_role_binding" "tenant-admin-role-binding" {
  count = length(local.tenantadmin) > 0 ? 1 : 0
  metadata {
    name      = "tenant-admin-binding"
    namespace = var.namespace
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "tenant-admin-role"
  }

  dynamic "subject" {
    for_each = local.tenantadmin
    content {
      kind      = subject.value["type"]
      name      = subject.value["email_id"]
      api_group = subject.value["api_group"]
      namespace = subject.value["namespace"]
    }
  }
}

# Creating cluster-admin-role-binding
resource "kubernetes_cluster_role_binding" "cluster-admin-role" {
  count = length(local.clusteradmin) > 0 ? 1 : 0
  metadata {
    name = "cluster-admin-role-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  dynamic "subject" {
    for_each = local.clusteradmin
    content {
      kind      = subject.value["type"]
      name      = subject.value["email_id"]
      api_group = subject.value["api_group"]
      namespace = subject.value["namespace"]
    }
  }
}



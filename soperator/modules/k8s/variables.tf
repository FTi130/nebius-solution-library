variable "iam_project_id" {
  description = "ID of the IAM project."
  type        = string
}

variable "vpc_subnet_id" {
  description = "ID of VPC subnet."
  type        = string
}

#---

variable "k8s_version" {
  description = "Version of the k8s to be used."
  type        = string
  default     = "1.30"
}

variable "name" {
  description = "Name of the k8s cluster."
  type        = string
}

variable "slurm_cluster_name" {
  description = "Name of the Slurm cluster in k8s cluster."
  type        = string
}

variable "etcd_cluster_size" {
  description = "Size of the etcd cluster."
  type        = number
  default     = 3
}

#---

variable "node_group_system" {
  description = "System node group specification."
  type = object({
    size = number
    resource = object({
      platform = string
      preset   = string
    })
    boot_disk = object({
      type                 = string
      size_gibibytes       = number
      block_size_kibibytes = number
    })
  })
}

variable "node_group_controller" {
  description = "Controller node group specification."
  type = object({
    size = number
    resource = object({
      platform = string
      preset   = string
    })
    boot_disk = object({
      type                 = string
      size_gibibytes       = number
      block_size_kibibytes = number
    })
  })
}

variable "node_group_workers" {
  description = "Worker node groups specification."
  type = list(object({
    size = number
    resource = object({
      platform = string
      preset   = string
    })
    boot_disk = object({
      type                 = string
      size_gibibytes       = number
      block_size_kibibytes = number
    })
    gpu_cluster = optional(object({
      infiniband_fabric = string
    }))
    nodeset_index = number
    subset_index  = number
  }))
}

variable "node_group_login" {
  description = "Controller node group specification."
  type = object({
    size = number
    resource = object({
      platform = string
      preset   = string
    })
    boot_disk = object({
      type                 = string
      size_gibibytes       = number
      block_size_kibibytes = number
    })
    use_node_port = bool
  })
}

#---

variable "filestores" {
  type = object({
    controller_spool = object({
      id        = string
      mount_tag = string
    })
    jail = object({
      id        = string
      mount_tag = string
    })
    jail_submounts = list(object({
      id        = string
      mount_tag = string
    }))
    accounting = optional(object({
      id        = string
      mount_tag = string
    }))
  })
}

#---

variable "node_ssh_access_users" {
  description = "SSH user credentials for accessing k8s nodes."
  type = list(object({
    name        = string
    public_keys = list(string)
  }))
  default = []
}

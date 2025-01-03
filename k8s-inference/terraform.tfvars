# Cloud environment and network
# parent_id      = "" # The project-id in this context
# subnet_id      = "" # Use the command "nebius vpc v1alpha1 network list" to see the subnet id
# region         = "" # Project region
# ssh_user_name  = "" # Username you want to use to connect to the nodes
# ssh_public_key = {
# key  = "put your public ssh key here" OR
# path = "put path to ssh key here"
# }

# K8s nodes
cpu_nodes_count = 3 # Number of CPU nodes
gpu_nodes_count = 1 # Number of GPU nodes
# cpu_nodes_platform =                 # CPU nodes platofm
# cpu_nodes_preset   =                 # CPU nodes preset
# gpu_nodes_platform =                 # GPU nodes platform
# gpu_nodes_preset   =                 # GPU nodes preset
enable-k8s-node-group-sa = true

# Observability
enable_grafana    = true  # Enable or disable Grafana deployment with true or false
enable_prometheus = true  # Enable or disable Prometheus deployment with true or false
enable_loki       = false # Enable or disable Loki deployment with true or false
enable_dcgm       = true  # Enable or disable NVIDIA DCGM Exporter Dashboard and Alerting deployment with true or false

## Loki
# loki_access_key_id = "" # See the instruction in README.md on how to create this. Leave empty if you are not deploying Loki.
# loki_secret_key    = "" # See the instruction in README.md on how to create this. Leave empty if you are not deploying Loki.

# Storage
## Filestore - recommended
enable_filestore     = true                       # Enable or disable Filestore integration with true or false
filestore_disk_size  = 100 * (1024 * 1024 * 1024) # Set Filestore disk size in bytes. The multiplication makes it easier to set the size in GB. This would set the size as 100GB
filestore_block_size = 4096                       # Set Filestore block size in bytes

## GlusterFS - legacy
enable_glusterfs            = false                      # Enable or disable GlusterFS integration with true or false
glusterfs_storage_nodes     = 3                          # Set amount of storage nodes in GlusterFS cluster
glusterfs_disk_count_per_vm = 2                          # Set amount of disks per storage node in GlusterFS cluster
glusterfs_disk_size         = 100 * (1024 * 1024 * 1024) # Set disk size in bytes. The multiplication makes it easier to set the size in GB. This would set the size as 100GB

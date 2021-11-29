variable "client_id" {
    default = "8ff-2a0a-40a2-a8d6-c2e8c"
}
variable "client_secret" {
    default = "p4my1Dh-nqCkQTmtEe"
}
variable "agent_count" {
    default = 1
}

variable "ssh_public_key" {
    default = "aksprodsshkey.pub"
}

variable "dns_prefix" {
    default = "k8stest"
}

variable cluster_name {
    default = "cluster1"
}

variable resource_group_name {
    default = "recursosabc"
}

variable location {
    default = "eastus"
}

variable log_analytics_workspace_name {
    default = "terraformcluster"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_location {
    default = "eastus"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
    default = "PerGB2018"
}

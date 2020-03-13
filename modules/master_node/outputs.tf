output "master_nodes" {
    value = [for host in ibm_compute_vm_instance.masters: host.ipv4_address]
}

locals {
    local_ips = [
        for host in ibm_compute_vm_instance.masters: {
            name = host.hostname,
            ip = host.ipv4_address_private
        }
    ]
}

output "local_ips" {
    value = local.local_ips
}
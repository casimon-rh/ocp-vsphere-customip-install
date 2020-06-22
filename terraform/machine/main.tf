data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = var.datacenter_id
}

data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = var.datacenter_id
}
resource "vsphere_virtual_machine" "vm" {
  count = var.instance_count
  // generic naming TODO: naming function?
  name             = "${var.common_prefix}${var.prefix}${count.index + 1}_${var.ip + count.index}"
  resource_pool_id = var.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = var.cpu
  memory           = var.memory
  guest_id         = var.guest_id
  folder           = var.folder
  enable_disk_uuid = "true"

  wait_for_guest_net_timeout  = "0"
  wait_for_guest_net_routable = "false"

  network_interface {
      network_id = data.vsphere_network.network.id
  }
  dynamic "disk" {
    for_each = var.disks
    content { 
      label            = "disk${disk.key}"
      thin_provisioned = true
      size             = disk.value
      unit_number      = disk.key
    }
  }
  // rhcos install iso attachment
  cdrom {
    // TODO: different datastore for iso?
    datastore_id = data.vsphere_datastore.datastore.id
    path         = var.iso_path
  }
}


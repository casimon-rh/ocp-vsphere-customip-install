provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

/////////
// TODO: Loop module loading by type
////////
module "bootstrap" {
  source = "./machine"

  network          = var.vm_network
  instance_count   = var.info.bootstrap.count
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore        = var.vsphere_datastore
  folder           = var.vsphere_folder
  datacenter_id    = data.vsphere_datacenter.dc.id
  memory           = var.info.bootstrap.memory
  cpu              = var.info.bootstrap.cpu
  ip               = var.info.bootstrap.ip
  guest_id         = var.vsphere_guest_id
  iso_path         = var.vsphere_iso_path
  prefix           = var.info.bootstrap.prefix
  common_prefix    = var.vm_prefix
  disks            = var.info.bootstrap.disks
}

module "master" {
  source = "./machine"

  network          = var.vm_network
  instance_count   = var.info.master.count
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore        = var.vsphere_datastore
  folder           = var.vsphere_folder
  datacenter_id    = data.vsphere_datacenter.dc.id
  memory           = var.info.master.memory
  cpu              = var.info.master.cpu
  ip               = var.info.master.ip
  guest_id         = var.vsphere_guest_id
  iso_path         = var.vsphere_iso_path
  prefix           = var.info.master.prefix
  common_prefix    = var.vm_prefix
  disks            = var.info.master.disks
}


module "infra" {
  source = "./machine"

  network          = var.vm_network
  instance_count   = var.info.infra.count
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore        = var.vsphere_datastore
  folder           = var.vsphere_folder
  datacenter_id    = data.vsphere_datacenter.dc.id
  memory           = var.info.infra.memory
  cpu              = var.info.infra.cpu
  ip               = var.info.infra.ip
  guest_id         = var.vsphere_guest_id
  iso_path         = var.vsphere_iso_path
  prefix           = var.info.infra.prefix
  common_prefix    = var.vm_prefix
  disks            = var.info.infra.disks
}


module "storage" {
  source = "./machine"

  network          = var.vm_network
  instance_count   = var.info.storage.count
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore        = var.vsphere_datastore
  folder           = var.vsphere_folder
  datacenter_id    = data.vsphere_datacenter.dc.id
  memory           = var.info.storage.memory
  cpu              = var.info.storage.cpu
  ip               = var.info.storage.ip
  guest_id         = var.vsphere_guest_id
  iso_path         = var.vsphere_iso_path
  prefix           = var.info.storage.prefix
  common_prefix    = var.vm_prefix
  disks            = var.info.storage.disks
}


module "log" {
  source = "./machine"

  network          = var.vm_network
  instance_count   = var.info.log.count
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore        = var.vsphere_datastore
  folder           = var.vsphere_folder
  datacenter_id    = data.vsphere_datacenter.dc.id
  memory           = var.info.log.memory
  cpu              = var.info.log.cpu
  ip               = var.info.log.ip
  guest_id         = var.vsphere_guest_id
  iso_path         = var.vsphere_iso_path
  prefix           = var.info.log.prefix
  common_prefix    = var.vm_prefix
  disks            = var.info.log.disks
}


module "metric" {
  source = "./machine"

  network          = var.vm_network
  instance_count   = var.info.metric.count
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore        = var.vsphere_datastore
  folder           = var.vsphere_folder
  datacenter_id    = data.vsphere_datacenter.dc.id
  memory           = var.info.metric.memory
  cpu              = var.info.metric.cpu
  ip               = var.info.metric.ip
  guest_id         = var.vsphere_guest_id
  iso_path         = var.vsphere_iso_path
  prefix           = var.info.metric.prefix
  common_prefix    = var.vm_prefix
  disks            = var.info.metric.disks
}


module "app" {
  source = "./machine"

  network          = var.vm_network
  instance_count   = var.info.app.count
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore        = var.vsphere_datastore
  folder           = var.vsphere_folder
  datacenter_id    = data.vsphere_datacenter.dc.id
  memory           = var.info.app.memory
  cpu              = var.info.app.cpu
  ip               = var.info.app.ip
  guest_id         = var.vsphere_guest_id
  iso_path         = var.vsphere_iso_path
  prefix           = var.info.app.prefix
  common_prefix    = var.vm_prefix
  disks            = var.info.app.disks
}
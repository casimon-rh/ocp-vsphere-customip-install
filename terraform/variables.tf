//////
// vSphere variables
//////

variable "vsphere_server" {
  type        = string
  description = "This is the vSphere server for the environment."
}

variable "vsphere_user" {
  type        = string
  description = "vSphere server user for the environment."
}

variable "vsphere_password" {
  type        = string
  description = "vSphere server password"
}

variable "vsphere_cluster" {
  type        = string
  description = "This is the name of the vSphere cluster."
}

variable "vsphere_folder" {
  type        = string
  description = "This is the folder of the cluster."
}

variable "vsphere_datacenter" {
  type        = string
  description = "This is the name of the vSphere data center."
}

variable "vsphere_datastore" {
  type        = string
  description = "This is the name of the vSphere data store."
}

variable "vsphere_guest_id" {
  type        = string
  description = "This is the guest id for the virtual machines"
  default     = "rhel7_64Guest"
}

variable "vsphere_iso_path" {
  type        = string
  description = "This is the installer iso path"
  default     = "rhcos-4.3.8.iso"
}

variable "vm_network" {
  type        = string
  description = "This is the name of the publicly accessible network for cluster ingress and access."
  default     = "VM Network"
}

/////////
// OpenShift cluster variables
/////////

variable "cluster_id" {
  type        = string
  description = "This cluster id must be of max length 27 and must have only alphanumeric or hyphen characters."
}

variable "vm_prefix" {
  type        = string
  description = "Virtual machine global naming prefix."
  default     = "ocp_"
}

/////////
// nodes info
/////////

variable info {
  type = object({
    bootstrap=object({ count=number, prefix=string, ip=number, memory=number, cpu=number, disks=list(number) }),
    master=object({ count=number, prefix=string, ip=number, memory=number, cpu=number, disks=list(number) }),
    infra=object({ count=number, prefix=string, ip=number, memory=number, cpu=number, disks=list(number) }),
    storage=object({ count=number, prefix=string, ip=number, memory=number, cpu=number, disks=list(number) }),
    log=object({ count=number, prefix=string, ip=number, memory=number, cpu=number, disks=list(number) }),
    metric=object({ count=number, prefix=string, ip=number, memory=number, cpu=number, disks=list(number) }),
    app=object({ count=number, prefix=string, ip=number, memory=number, cpu=number, disks=list(number) })
  })
  description   = "Cluster nodes info, classified by traditional (OCP3) node roles, mainly for naming and resource distribution."
  default       = {
    bootstrap   = {
      count     = 1,
      prefix    = "boots",
      memory    = 8192,
      cpu       = 4,
      ip        = 2,
      disks     = [ 60 ]
    },
    master      = {
      count     = 3,
      prefix    = "ctrl",
      memory    = 8192,
      cpu       = 4,
      ip        = 3,
      disks     = [ 60 ]
    },
    app         = {
      count     = 2,
      prefix    = "app",
      memory    = 8192,
      cpu       = 4,
      ip        = 6,
      disks     = [ 60 ]
    },
    infra       = {
      count     = 0,
      prefix    = "",
      memory    = 8192,
      cpu       = 4,
      ip        = 8,
      disks     = [ 60 ]
    },
    storage     = {
      count     = 0,
      prefix    = "",
      memory    = 8192,
      cpu       = 4,
      ip        = 10,
      disks     = [ 60 ]
    },
    log         = {
      count     = 0,
      prefix    = "",
      memory    = 8192,
      cpu       = 4,
      ip        = 12,
      disks     = [ 60 ]
    },
    metric      = {
      count     = 0,
      prefix    = "",
      memory    = 8192,
      cpu       = 4,
      ip        = 14,
      disks     = [ 60 ]
    }
  }
}
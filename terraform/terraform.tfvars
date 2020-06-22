// ID identifying the cluster to create. 
cluster_id = "openshift"
// Name of the vSphere server. 
vsphere_server = "vsphere.client.com"

// User on the vSphere server.
vsphere_user = "redhatm@client.com"

// Password of the user on the vSphere server.
vsphere_password = "Str0ngP4ssw0rd"

// Name of the vSphere cluster. 
vsphere_cluster = "cluster"

// Name of the vSphere cluster folder. 
vsphere_folder = "openshift"

// Name of the vSphere data center. 
vsphere_datacenter = "datacenter"

// Name of the vSphere data store to use for the VMs.
vsphere_datastore = "datastore"

// Name of the guest to use
// vsphere_guest_id = "rhel7_64Guest"

// Path of the iso (on the same datastore)
// vsphere_iso_path = "rhcos-4.3.8.iso"

// info = {
//     bootstrap = {
//       count  = 1,
//       prefix = "bootstrap",
//       memory = 8192,
//       cpu    = 4,
//       ip     = 143,
//       disks  = [ 60 ],
//       storage_network = "true",
//       admin_network   = "false"
//     },
//     master = {
//       count  = 3,
//       prefix = "mst0",
//       memory = 16384,
//       cpu    = 8
//       ip     = 117
//       disks  = [ 60, 100 ],
//       storage_network = "true",
//       admin_network   = "false"
//     },
//     infra = {
//       count  = 0,
//       prefix = "inf0",
//       memory = 16384,
//       cpu    = 8
//       ip     = 120
//       disks  = [ 60, 100 ],
//       storage_network = "true",
//       admin_network   = "false"
//     },
//     storage = {
//       count  = 0,
//       prefix = "cns0",
//       memory = 65536,
//       cpu    = 16
//       ip     = 132
//       disks  = [ 60, 100 ],
//       storage_network = "true",
//       admin_network   = "false"
//     },
//     log = {
//       count  = 0,
//       prefix = "log0",
//       memory = 32768,
//       cpu    = 16
//       ip     = 126
//       disks  = [ 60, 100 ],
//       storage_network = "true",
//       admin_network   = "false"
//     },
//     metric = {
//       count  = 0,
//       prefix = "met0",
//       memory = 32768,
//       cpu    = 16
//       ip     = 123
//       disks  = [ 60, 100 ],
//       storage_network = "true",
//       admin_network   = "false"
//     },
//     app = {
//       count  = 2,
//       prefix = "cicd-",
//       memory = 24000,
//       cpu    = 12
//       ip     = 129
//       disks  = [ 60, 100 ],
//       storage_network = "true",
//       admin_network   = "false"
//     }
//   }
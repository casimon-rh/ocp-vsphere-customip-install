# Openshift Container Platform -> VMWare VSphere Custom IP Install Playbooks

## Intro

Based on the [Installer] User Provided Infraestructure (UPI) repo for VMWare, and following the [Blog Post] it install a minimal, parametrizable cluster with role based resource and naming and automatic kernel parametrization.

## Environment 🌲

The following playbooks and scripts were tested on the following versions for this technologies:

* [VMWare® VSphere® 6.7]
* [Red Hat CoreOS iso installer 4.3.8]
* [Red Hat CoreOS BIOS metal 4.3.8]
* [Terraform 0.12]
* [Python 3.6]

## Content 🍱

### Terraform 🌎

Role based resource distribution of metal-like installation over VSphere. Runs on terraform 0.12 with the following variables (terraform.tfvars)

* vsphere_server
* vsphere_user
* vsphere_password
* vsphere_cluster
* vsphere_folder
* vsphere_datacenter
* vsphere_datastore
* vsphere_guest_id
* vsphere_iso_path
* vm_network
* cluster_id
* vm_prefix
* info

It creates the number of machines specified in the variables as well as naming them (customizable**) with specific resources per node-role.

Default specifications:

Count | Role | CPU | RAM | Disk(s) | Prefix | Ip
---|---|---|---|---|---|---
1 | Bootstrap | 4 | 8Gi | 1x60Gb | boots | 2
3 | Master | 4 | 8Gi | 1x60Gb | ctrl | 3
2 | Application | 4 | 8Gi | 1x60Gb | app | 4

#### Steps:🚶‍♂️

```bash
vi terraform.tfvars # custom vars
terraform init
terraform plan # optional
terraform apply -auto-approve
```

### Selenium 🤖

Automatic bot for setting of network-specific kernel params of RHCOS, for openshift installation. The params that need to be sent are:

* ip
* nameserver
* coreos.inst.install_dev
* coreos.inst.image_url
* coreos.inst.ignition_url

The bot builds the string and sends it char by char. The following parameters are required:

Short Flag | Long Flag | Description
--- | --- | ---
-w | --webdriver-dir | Webdriver Folder
-vu | --vsphere-url | VMWare VSphere URL
-u | --username | VMWare VSphere user
-p | --password | VMWare Vsphere password
-gw | --gateway | IP Gateway
-d | --dns | DNS Server
-m | --mask | Network Mask
-n | --network-interface | Default Network Interface
-b | --base-url | FQDN base url
-i | --image-url | Install Image URL
-ig | --ignition-url | Install Ignition URL
-s | --servers-file | Servers csv file

It also needs a csv file describing the created vms with the following headers:

* Virtual Machine Name
* FQDN name
* IP

```csv
ocp_boots1_2,boots1,192.168.0.2
ocp_ctr1_3,ctr1,192.168.0.3
ocp_ctr2_4,ctr2,192.168.0.4
ocp_ctr3_5,ctr3,192.168.0.5
ocp_app1_6,app1,192.168.0.6
ocp_app2_7,app2,192.168.0.7
ocp_app3_9,app3,192.168.0.9
```
#### Steps: 🚶‍♂️

```bash
wget https://github.com/mozilla/geckodriver/releases/download/v0.**.0/geckodriver-v0.**.0-platform.tar.gz # check latest version and platform
virtualenv -p /usr/bin/python3 local-venv
pip install -r requirements.txt
vi servers.csv # customize servers
python main.py -h # check params
python main.py #...
```

## Pre-requisites ✅

As described in the [UPI Installation Guide], the default settings cover the minimal resource requirements of compute. You need to provision externally the load balancers and the dns requirements. As well as prepare the ignition scripts with the _openshift-install_ binary and expose them on a http server cluster-wide available.

## Improvements "To be done" 📝

1. **Terraform**: loop/dynamic module loading per node role
2. **Terraform**: custom naming function? 
3. **Terraform**: different datastore for iso?
4. **Selenium**: search for folder name instead of choosing first
5. **Selenium**: lambda/one loop for string build and operations
6. **Selenium**: check if webconsole is the default choice in vsphere

## Best with 💫

🎀 [VSCode]

[Installer]:(https://github.com/openshift/installer)
[Blog Post]:(https://www.openshift.com/blog/openshift-4-2-vsphere-install-with-static-ips)
[VMWare® VSphere® 6.7]:(https://my.vmware.com/en/web/vmware/downloads/info/slug/datacenter_cloud_infrastructure/vmware_vsphere/6_7)
[Red Hat CoreOS iso installer 4.3.8]:(https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.3/latest/rhcos-4.3.8-x86_64-installer.x86_64.iso)
[Red Hat CoreOS BIOS metal 4.3.8]:(https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.3/latest/rhcos-4.3.8-x86_64-metal.x86_64.raw.gz)
[Terraform 0.12]:(https://www.terraform.io/downloads.html)
[Python 3.6]:(https://www.python.org/downloads/release/python-360/)
[UPI Installation Guide]:(https://github.com/openshift/installer/blob/master/docs/user/vsphere/install_upi.md)
[VSCode]:(https://code.visualstudio.com/)
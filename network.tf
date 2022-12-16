#cert_main_internal
###################
#workstations

resource "openstack_networking_network_v2" "cert_main_internal_workstations" {
  name  = "cert_main_internal_workstations"
  admin_state_up = "true"
  #tenant_id = var.project_ids.certification_range
}

#services
resource "openstack_networking_network_v2" "cert_main_internal_services" {
  name  = "cert_main_internal_services"
  admin_state_up = "true"
  #tenant_id = var.project_ids.certification_range
}

#dmz
resource "openstack_networking_network_v2" "cert_main_internal_dmz" {
  name  = "cert_main_internal_dmz"
  admin_state_up = "true"
  #tenant_id = var.project_ids.certification_range
}

#high_value_target
resource "openstack_networking_network_v2" "cert_main_internal_high_value" {
  name  = "cert_main_internal_high_value"
  admin_state_up = "true"
  #tenant_id = var.project_ids.certification_range
}

#cert_main_internal-subnet:workstations
resource "openstack_networking_subnet_v2" "cert_main_internal_workstations_subnet" {
  depends_on = [openstack_networking_network_v2.cert_main_internal_workstations]
  name = "workstations"
  network_id = openstack_networking_network_v2.cert_main_internal_workstations.id
  cidr = "10.100.0.0/24"
  gateway_ip = "10.100.0.1"
  ip_version = 4
  #tenant_id = var.project_ids.certification_range
}

#cert_main_internal-subnet:services
resource "openstack_networking_subnet_v2" "cert_main_internal_services_subnet" {
  depends_on = [openstack_networking_network_v2.cert_main_internal_services]
  name = "services"
  network_id = openstack_networking_network_v2.cert_main_internal_services.id
  cidr = "10.100.1.0/24"
  gateway_ip = "10.100.1.1"
  ip_version = 4
  ##tenant_id = var.project_ids.certification_range
}

#cert_main_internal-subnet:dmz
resource "openstack_networking_subnet_v2" "cert_main_internal_dmz_subnet" {
  depends_on = [openstack_networking_network_v2.cert_main_internal_dmz]
  name = "dmz"
  network_id = openstack_networking_network_v2.cert_main_internal_dmz.id
  cidr = "10.100.2.0/24"
  gateway_ip = "10.100.2.1"
  ip_version = 4
  ##tenant_id = var.project_ids.certification_range
}

#cert_main_internal-subnet:high_value_target
resource "openstack_networking_subnet_v2" "cert_main_internal_high_value_target_subnet" {
  depends_on = [openstack_networking_network_v2.cert_main_internal_high_value]
  name = "high_value_target"
  network_id = openstack_networking_network_v2.cert_main_internal_high_value.id
  cidr = "10.100.3.0/24"
  gateway_ip = "10.100.3.1"
  ip_version = 4
  ##tenant_id = var.project_ids.certification_range
}


#security group for cert_main_internal
resource "openstack_compute_secgroup_v2" "create_security_group_cert_main_internal" {
  name = "security_group-cert_main_internal"
  description = "Security group for cert_main_internal network"
}

#cert_attack_network
####################
#create cert_attack_network network
resource "openstack_networking_network_v2" "cert_attack_network_workstations" {
  name = "cert_attack_network_workstations"
  admin_state_up = "true"
  #tenant_id = var.project_ids.certification_range
}


#security group for cert_attack_network
resource "openstack_compute_secgroup_v2" "security_group_cert_attack_network" {
  depends_on = [
    openstack_networking_network_v2.cert_attack_network_workstations
  ]
  name = "security_group-cert_attack_network"
  description = "Security group for cert_attack_network network"
}


#cert_attack_network-subnet:workstations
resource "openstack_networking_subnet_v2" "cert_attack_network_workstations_subnet" {
  depends_on = [openstack_networking_network_v2.cert_attack_network_workstations]
  name = "workstations"
  network_id = openstack_networking_network_v2.cert_attack_network_workstations.id
  cidr = "10.200.0.0/24"
  gateway_ip = "10.200.0.1"
  ip_version = 4
  #tenant_id = var.project_ids.certification_range
}

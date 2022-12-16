#create routers
###############
#cert_main_internal_gateway_router
/*
resource "openstack_networking_router_v2" "cert_main_internal_gateway_router" {
  name = "cert_main_internal_gateway_router"
  admin_state_up = "true"
  external_network_id = var.external_public_network
  #tenant_id = var.project_ids.certification_range
}

#cert_attack_network_gateway_router
resource "openstack_networking_router_v2" "cert_attack_network_gateway_router" {
  name = "cert_attack_network_gateway_router"
  admin_state_up = "true"
  external_network_id = var.external_public_network
  #tenant_id = var.project_ids.certification_range
}

#interfaces for cert_main_internal-gateway_router
############################################

#interface for cert_main_internal-subnet:workstations
resource "openstack_networking_router_interface_v2" "interface_cert_main_internal_gateway_router_to_workstations_subnet" {
  depends_on = [
    openstack_networking_router_v2.cert_main_internal_gateway_router,
    openstack_networking_subnet_v2.cert_main_internal_workstations_subnet
  ]
  router_id = openstack_networking_router_v2.cert_main_internal_gateway_router.id
  subnet_id = openstack_networking_subnet_v2.cert_main_internal_workstations_subnet.id
}

#interface for cert_main_internal_subnet:services
resource "openstack_networking_router_interface_v2" "interface_cert_main_internal_gateway_router_to_services_subnet" {
    depends_on = [
    openstack_networking_router_v2.cert_main_internal_gateway_router,
    openstack_networking_subnet_v2.cert_main_internal_services_subnet
  ]
  router_id = openstack_networking_router_v2.cert_main_internal_gateway_router.id
  subnet_id = openstack_networking_subnet_v2.cert_main_internal_services_subnet.id
}

#interface for cert_main_internal_subnet:dmz
resource "openstack_networking_router_interface_v2" "interface_cert_main_internal_gateway_router_to_dmz_subnet" {
    depends_on = [
    openstack_networking_router_v2.cert_main_internal_gateway_router,
    openstack_networking_subnet_v2.cert_main_internal_dmz_subnet
  ]
  router_id = openstack_networking_router_v2.cert_main_internal_gateway_router.id
  subnet_id = openstack_networking_subnet_v2.cert_main_internal_dmz_subnet.id
}

#interface for cert_main_internal_subnet:high_value_target
resource "openstack_networking_router_interface_v2" "interface_cert_main_internal_gateway_router_to_high_value_target_subnet" {
    depends_on = [
    openstack_networking_router_v2.cert_main_internal_gateway_router,
    openstack_networking_subnet_v2.cert_main_internal_high_value_target_subnet
  ]
  router_id = openstack_networking_router_v2.cert_main_internal_gateway_router.id
  subnet_id = openstack_networking_subnet_v2.cert_main_internal_high_value_target_subnet.id
}
#interfaces for cert_attack_network_gateway_router
#############################################

#interface for cert_attack_network-subnet:workstations
resource "openstack_networking_router_interface_v2" "interface_cert_attack_network-gateway_router_to_workstations_subnet" {
  depends_on = [
    openstack_networking_router_v2.cert_attack_network_gateway_router,
    openstack_networking_subnet_v2.cert_attack_network_workstations_subnet
  ]
  router_id = openstack_networking_router_v2.cert_attack_network_gateway_router.id
  subnet_id = openstack_networking_subnet_v2.cert_attack_network_workstations_subnet.id
}
*/
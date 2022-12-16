/*
resource "openstack_compute_quotaset_v2" "set_range_quota" {
  project_id = var.project_ids.certification_range
  key_pairs = 20
  ram = 256000
  cores = 150
  instances = 200
  security_groups = 10
  server_group_members = 8
}
*/
#hosts in workstations_subnet
resource "openstack_compute_instance_v2" "create_windows_2010_workstation_in_workstations" {
  depends_on = [
    openstack_networking_subnet_v2.cert_main_internal_workstations_subnet
  ]
  count = 6
  name = "windows_workstation_workstations-${count.index+1}"
  #key_pair = ""
  security_groups = ["default"]
  flavor_id = var.flavor_ids.medium
  # user_data = file("${path.module}/external/user_data/cloudbaseinit-example.con
      timeouts {
    create = "60m"
  }
  network {
    uuid = openstack_networking_subnet_v2.cert_main_internal_workstations_subnet.network_id
  }
  block_device {
    source_type = "image"
    uuid = var.image_ids.windows_10_cloud
    delete_on_termination = true
    boot_index = 0
    destination_type = "volume"
    volume_size = 20
  }
}

#host in high_value_target subnet
resource "openstack_compute_instance_v2" "create_windows_2010_workstation_in_high_value_target" {
  depends_on = [
    openstack_networking_subnet_v2.cert_main_internal_high_value_target_subnet
  ]
  count = 6
  name = "windows_workstation_high_value_target-${count.index+1}"
  #key_pair = ""
  security_groups = ["default"]
  flavor_id = var.flavor_ids.medium
  image_id = var.image_ids.windows_10_cloud
  # user_data = file("${path.module}/external/user_data/cloudbaseinit-example.con
    timeouts {
      create = "60m"
    }
  network {
    uuid = openstack_networking_subnet_v2.cert_main_internal_high_value_target_subnet.network_id
  }
  block_device {
    source_type = "image"
    uuid = var.image_ids.windows_10_cloud
    delete_on_termination = true
    boot_index = 0
    destination_type = "volume"
    volume_size = 20
  }
}